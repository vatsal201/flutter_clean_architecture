import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/enums/view_state.dart';
import 'package:flutter_clean_architecture/core/errors/failure.dart';
import 'package:flutter_clean_architecture/core/usecases/base_usecase.dart';
import 'package:flutter_clean_architecture/core/utils/response_message.dart';
import 'package:flutter_clean_architecture/core/widgets/snack_bar.dart';
import 'package:flutter_clean_architecture/features/domain/entities/voters/voter_entity.dart';
import 'package:flutter_clean_architecture/features/domain/usecases/get_voters_usecase.dart';
import 'package:flutter_clean_architecture/features/views/base/base_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardViewModel extends BaseModel {
  final GetVotersUsecase getVotersUsecase;
  final List<VoterEntity> _voters = [];
  final List<VoterEntity> _filteredVoters = [];
  List<VoterEntity> get voters =>
      queryController.text.isEmpty ? _voters : _filteredVoters;
  final phoneController = TextEditingController();
  final queryController = TextEditingController();

  DashboardViewModel({
    required this.getVotersUsecase,
  });

  Future<Either<Failure, void>> getAllVoters() async {
    setViewState(ViewState.Loading);
    final _res = await getVotersUsecase.call(NoParams());
    if (_res.isRight()) {
      List<VoterEntity> votersData = ResponseMessage.success(_res)!;
      _voters.clear();
      _voters.addAll(votersData);
    }
    setViewState(ViewState.Done);
    return _res;
  }

  Future<void> searchVoters() async {
    List<VoterEntity> voters = _voters
        .where(
          (voter) => voter.voterNameEn
              .toLowerCase()
              .contains(queryController.text.toLowerCase()),
        )
        .toList();
    _filteredVoters.clear();
    _filteredVoters.addAll(voters);
    notifyListeners();
  }

  Future<void> sendWhatsappMessage(
      {required BuildContext context, required String msg}) async {
    FocusManager.instance.primaryFocus?.unfocus();
    var whatsappUrl =
        "whatsapp://send?phone=91${phoneController.text}&text=$msg";
    try {
      await launchUrl(Uri.parse(whatsappUrl));
    } catch (e) {
      showSnackBar(context, msg: "Unable to open whatsapp");
    }
    phoneController.clear();
    Navigator.pop(context);
  }

  void onCancel({required BuildContext context}) {
    phoneController.clear();
    Navigator.pop(context);
  }

  void disposeViewModel() {
    phoneController.dispose();
    queryController.dispose();
  }
}
