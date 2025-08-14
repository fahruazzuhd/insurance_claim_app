import 'package:insurance_claim_app/features/claims/domain/entities/claim_entity.dart';

abstract class ClaimRepository {
  Future<List<ClaimEntity>> getClaims();
  Future<List<ClaimEntity>> searchClaims(String keyword);
}
