import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/enums/view_state.dart';
import 'package:flutter_clean_architecture/core/widgets/appbar.dart';
import 'package:flutter_clean_architecture/core/widgets/custom_popups.dart';
import 'package:flutter_clean_architecture/core/widgets/input_field.dart';
import 'package:flutter_clean_architecture/core/widgets/resouce_unavailable.dart';
import 'package:flutter_clean_architecture/features/views/base/base_view_model.dart';
import 'package:flutter_clean_architecture/features/views/providers/dashboard_view_model.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: mmAppBar(context,
            title: 'Clean Architecture',
            iconColor: Colors.purple,
            isCenter: true,
            icon: Icons.person),
        body: BaseView<DashboardViewModel>(
          onModelReady: (model) {
            model.getAllVoters();
          },
          builder: (context, model, _) {
            if (model.state == ViewState.Done) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EInputForm(
                      controller: model.queryController,
                      hintText: 'Search voter name',
                      onChangeHandler: (_) {
                        model.searchVoters();
                      },
                      prefixIcon: Icons.search,
                    ),
                  ),
                  model.voters.isEmpty
                      ? const ResourceNotFound(
                          icon: Icons.error,
                          title: "No Users Found!",
                        )
                      : Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemCount: model.voters.length,
                                  separatorBuilder: (context, index) {
                                    return const Divider();
                                  },
                                  itemBuilder: ((context, index) {
                                    final voter = model.voters[index];
                                    return ListTile(
                                      onTap: () => CustomPopup.textInputDialog(
                                        context: context,
                                        title: voter.voterNameEn,
                                        confirmBtnTitle: 'Share',
                                        hintText: 'Enter Number',
                                        textFieldController:
                                            model.phoneController,
                                        onPressed: () =>
                                            model.sendWhatsappMessage(
                                          context: context,
                                          msg: voter.voterNameEn +
                                              voter.idCardNo,
                                        ),
                                        onCancelled: () =>
                                            model.onCancel(context: context),
                                      ),
                                      leading: CircleAvatar(
                                        backgroundColor:
                                            const Color(0xff764abc),
                                        child: Text(index.toString()),
                                      ),
                                      title: Text(voter.voterNameEn),
                                      subtitle: Text(voter.idCardNo),
                                      trailing:
                                          Text(voter.gender.toUpperCase()),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator.adaptive());
          },
          onModelDispose: (model) {
            model.disposeViewModel();
          },
        ),
      ),
    );
  }
}
