import 'package:insurance_claim_app/features/claims/domain/entities/users_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  const UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UsersEntity toEntity() => UsersEntity(
    id: id,
    name: name,
    username: username,
    email: email,
    phone: phone,
    website: website,
  );

  factory UserModel.fromEntity(UsersEntity entity) => UserModel(
    id: entity.id,
    name: entity.name,
    username: entity.username ?? '',
    email: entity.email ?? '',
    phone: entity.phone ?? '',
    website: entity.website ?? '',
  );
}
