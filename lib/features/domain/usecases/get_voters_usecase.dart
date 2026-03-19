import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/errors/failure.dart';
import 'package:flutter_clean_architecture/core/usecases/base_usecase.dart';
import 'package:flutter_clean_architecture/features/domain/entities/voters/voter_entity.dart';
import 'package:flutter_clean_architecture/features/domain/respositories/dashboard_repo.dart';

class GetVotersUsecase extends BaseUsecase<List<VoterEntity>, NoParams> {
  final DashboardRepository repository;

  GetVotersUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<VoterEntity>>> call(params) async =>
      repository.getVoters();
}
