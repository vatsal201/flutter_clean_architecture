import 'package:flutter_clean_architecture/features/domain/entities/voters/voter_entity.dart';

abstract class DashboardRemoteDatasource {
  Future<List<VoterEntity>> getVoters();
}
