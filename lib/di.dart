import 'package:get_it/get_it.dart';
import 'package:insurance_claim_app/core/network/api_client.dart';
import 'package:insurance_claim_app/features/claims/data/datasources/claim_remote_datasource.dart';
import 'package:insurance_claim_app/features/claims/domain/usecases/get_claim.dart';
import 'package:insurance_claim_app/features/claims/domain/usecases/search_claim.dart';

import 'features/claims/data/repositories/claim_repository_impl.dart';
import 'features/claims/domain/repositories/claim_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => ApiClient());

  // Data sources
  sl.registerLazySingleton<ClaimRemoteDataSource>(
    () => ClaimRemoteDataSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<ClaimRepository>(
    () => ClaimRepositoryImpl(remoteDataSource: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetClaim(sl()));
  sl.registerLazySingleton(() => SearchClaim(sl()));
}
