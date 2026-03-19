import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/errors/failure.dart';
import 'package:flutter_clean_architecture/core/usecases/safe_api_call_usecase.dart';
import 'package:flutter_clean_architecture/features/data/sources/remote/dashboard/dashboard_remote_ds.dart';
import 'package:flutter_clean_architecture/features/domain/entities/voters/voter_entity.dart';
import 'package:flutter_clean_architecture/features/domain/respositories/dashboard_repo.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  final DashboardRemoteDatasource datasource;
  final SafeApiCallUsecase safeApiCallUsecase;

  DashboardRepositoryImpl({
    required this.datasource,
    required this.safeApiCallUsecase,
  });
  @override
  Future<Either<Failure, List<VoterEntity>>> getVoters() async {
    return safeApiCallUsecase
        .call<List<VoterEntity>>(() => datasource.getVoters());
  }
}
