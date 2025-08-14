import 'package:insurance_claim_app/features/claims/data/datasources/claim_remote_datasource.dart';
import 'package:insurance_claim_app/features/claims/domain/entities/claim_entity.dart';
import 'package:insurance_claim_app/features/claims/domain/repositories/claim_repository.dart';

class ClaimRepositoryImpl implements ClaimRepository {
  final ClaimRemoteDataSource remoteDataSource;

  ClaimRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ClaimEntity>> getClaims() async {
    final models = await remoteDataSource.getClaims();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<ClaimEntity>> searchClaims(String keyword) async {
    final models = await remoteDataSource.getClaims();
    final filtered = models.where(
      (claim) =>
          claim.title.toLowerCase().contains(keyword.toLowerCase()) ||
          claim.body.toLowerCase().contains(keyword.toLowerCase()),
    );
    return filtered.map((m) => m.toEntity()).toList();
  }
}
