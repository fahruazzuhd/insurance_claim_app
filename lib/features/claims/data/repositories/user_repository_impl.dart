import 'package:insurance_claim_app/features/claims/data/datasources/user_remote_datasource.dart';
import 'package:insurance_claim_app/features/claims/domain/entities/users_entity.dart';
import 'package:insurance_claim_app/features/claims/domain/repositories/users_repository.dart';

class UserRepositoryImpl implements UsersRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<UsersEntity>> getUsers() async {
    final models = await remoteDataSource.getUsers();
    return models.map((m) => m.toEntity()).toList();
  }
}
