import 'package:dio/dio.dart';
import 'package:insurance_claim_app/core/network/api_config.dart';
import 'package:insurance_claim_app/features/claims/data/models/claim_model.dart';

abstract class ClaimRemoteDataSource {
  Future<List<ClaimModel>> getClaims();
}

class ClaimRemoteDataSourceImpl implements ClaimRemoteDataSource {
  final Dio dio;

  ClaimRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ClaimModel>> getClaims() async {
    final response = await dio.get(ApiConfig.claims);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = response.data;
      return jsonList.map((e) => ClaimModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch claims: ${response.statusCode}');
    }
  }
}
