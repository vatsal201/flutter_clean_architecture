import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/errors/failure.dart';
import 'package:flutter_clean_architecture/features/domain/entities/voters/voter_entity.dart';

abstract class DashboardRepository {
  Future<Either<Failure, List<VoterEntity>>> getVoters();
}
