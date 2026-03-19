import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_clean_architecture/core/mock_data/voters.dart';
import 'package:flutter_clean_architecture/features/data/models/voters/voter_model.dart';
import 'package:flutter_clean_architecture/features/data/sources/remote/dashboard/dashboard_remote_ds.dart';
import 'package:flutter_clean_architecture/features/domain/entities/voters/voter_entity.dart';

class DashboardRemoteDatasourceImpl extends DashboardRemoteDatasource {
  final FirebaseFirestore firebaseFirestore;

  DashboardRemoteDatasourceImpl({required this.firebaseFirestore});
  @override
  Future<List<VoterEntity>> getVoters() async {
    final List<VoterModel> voters =
        MockData.voters.map((voter) => VoterModel.fromJson(voter)).toList();
    return Future.value(voters);
  }
}
