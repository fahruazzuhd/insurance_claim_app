import 'package:dio/dio.dart';
import 'package:insurance_claim_app/core/network/api_config.dart';
import 'package:insurance_claim_app/features/claims/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await dio.get(ApiConfig.users);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = response.data;
      return jsonList.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch Users: ${response.statusCode}');
    }
  }
}
