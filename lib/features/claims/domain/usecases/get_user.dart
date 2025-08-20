import 'package:insurance_claim_app/features/claims/domain/entities/users_entity.dart';
import 'package:insurance_claim_app/features/claims/domain/repositories/users_repository.dart';

class GetUsers {
  final UsersRepository repository;

  GetUsers(this.repository);

  Future<List<UsersEntity>> call() async {
    return await repository.getUsers();
  }
}
