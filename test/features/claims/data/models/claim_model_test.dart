import 'package:flutter_test/flutter_test.dart';
import 'package:insurance_claim_app/features/claims/data/models/claim_model.dart';

void main() {
  const claimJson = {
    "userId": 1,
    "id": 1,
    "title": "Test Title",
    "body": "Test Body",
  };

  const claimModel = ClaimModel(
    userId: 1,
    id: 1,
    title: "Test Title",
    body: "Test Body",
  );

  test('fromJson should return valid model', () {
    final result = ClaimModel.fromJson(claimJson);
    expect(result, equals(claimModel));
  });

  test('toJson should return a JSON map', () {
    final result = claimModel.toJson();
    expect(result, equals(claimJson));
  });
}
