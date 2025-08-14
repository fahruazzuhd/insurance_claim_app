import 'package:insurance_claim_app/features/claims/domain/entities/claim_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'claim_model.g.dart';

@JsonSerializable()
class ClaimModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  const ClaimModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory ClaimModel.fromJson(Map<String, dynamic> json) =>
      _$ClaimModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClaimModelToJson(this);

  ClaimEntity toEntity() =>
      ClaimEntity(userId: userId, id: id, title: title, body: body);

  factory ClaimModel.fromEntity(ClaimEntity entity) => ClaimModel(
    userId: entity.userId,
    id: entity.id,
    title: entity.title,
    body: entity.body,
  );
}
