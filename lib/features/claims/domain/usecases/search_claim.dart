import 'package:insurance_claim_app/features/claims/domain/entities/claim_entity.dart';
import 'package:insurance_claim_app/features/claims/domain/repositories/claim_repository.dart';

class SearchClaim {
  final ClaimRepository repository;

  SearchClaim(this.repository);

  Future<List<ClaimEntity>> call(String keyword) async {
    return await repository.searchClaims(keyword);
  }
}
