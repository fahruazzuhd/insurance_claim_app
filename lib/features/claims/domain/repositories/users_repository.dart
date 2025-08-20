import 'package:insurance_claim_app/features/claims/domain/entities/users_entity.dart';

abstract class UsersRepository {
  Future<List<UsersEntity>> getUsers();
}
