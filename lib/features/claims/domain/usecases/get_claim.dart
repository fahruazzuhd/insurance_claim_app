import 'package:insurance_claim_app/features/claims/domain/entities/claim_entity.dart';
import 'package:insurance_claim_app/features/claims/domain/repositories/claim_repository.dart';

class GetClaim {
  final ClaimRepository repository;

  GetClaim(this.repository);

  Future<List<ClaimEntity>> call() async {
    return await repository.getClaims();
  }
}
