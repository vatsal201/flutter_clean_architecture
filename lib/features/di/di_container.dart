import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_clean_architecture/features/data/repositories/dashboard_repo_impl.dart';
import 'package:flutter_clean_architecture/features/data/sources/remote/dashboard/dashboard_remote_ds.dart';
import 'package:flutter_clean_architecture/features/data/sources/remote/dashboard/dashboard_remote_ds_impl.dart';
import 'package:flutter_clean_architecture/features/domain/respositories/dashboard_repo.dart';
import 'package:flutter_clean_architecture/features/domain/usecases/get_voters_usecase.dart';
import 'package:flutter_clean_architecture/features/views/providers/dashboard_view_model.dart';
import 'package:get_it/get_it.dart';

import '../../core/network/connection.dart';
import '../../core/usecases/safe_api_call_usecase.dart';
import '../../core/utils/safe_api_call.dart';

final GetIt locator = GetIt.instance;
User? get currentUser => FirebaseAuth.instance.currentUser;
Future<void> initializeDependencies() async {
/* 
::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    :::::::::::::::: VIEWMODELS/PROVIDERS/CONTROLLERS ::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 */

  locator.registerFactory<DashboardViewModel>(
    () => DashboardViewModel(
      getVotersUsecase: locator.call(),
    ),
  );

// ::::::::::::: Dashboard ::::::::::::::::::::::::::
  locator.registerLazySingleton<GetVotersUsecase>(
    () => GetVotersUsecase(
      repository: locator.call(),
    ),
  );
// ================ Safe Api Call ===============================

  locator.registerLazySingleton<SafeApiCallUsecase>(() => SafeApiCallUsecase(
        safeApiCall: locator.call(),
      ));

/* 
::::::::::::::::::::::::::::::::::::::::::::::::::::::
    :::::::::::::::LOCAL DATA SOURCES ::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::
 */

/* 
::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    :::::::::::::::REMOTE DATA SOURCES ::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 */

  locator.registerLazySingleton<DashboardRemoteDatasource>(
    () => DashboardRemoteDatasourceImpl(
      firebaseFirestore: locator.call(),
    ),
  );

/* 
:::::::::::::::::::::::::::::::::::::::::::::::::::::
    :::::::::::::::  REPOSITORIES ::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::
 */

  locator.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(
      datasource: locator.call(),
      safeApiCallUsecase: locator.call(),
    ),
  );

/* 
:::::::::::::::::::::::::::::::
    :::::::: CORE ::::::::::::::::
:::::::::::::::::::::::::::::::
 */

  locator.registerFactory<NetworkInfo>(() => NetworkInfoImpl(
        connectivity: locator.call(),
      ));
  locator.registerFactory<SafeApiCall>(() => SafeApiCallImpl(
        networkInfo: locator.call(),
      ));

/* 
:::::::::::::::::::::::::::::::::::::::::::::::
    :::::::: EXTERNAL DATA SOURCES - DEPENDENCIES ::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::
 */
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firesotre = FirebaseFirestore.instance;
  final AwesomeNotifications _notification = AwesomeNotifications();
  final Connectivity _connectivity = Connectivity();

  locator.registerLazySingleton(() => _auth);
  locator.registerLazySingleton(() => _storage);
  locator.registerLazySingleton(() => _firesotre);
  locator.registerLazySingleton(() => _notification);
  locator.registerLazySingleton(() => _connectivity);
}
