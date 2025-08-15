import 'package:flutter_test/flutter_test.dart';
import 'package:insurance_claim_app/features/claims/data/datasources/claim_remote_datasource.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:insurance_claim_app/features/claims/data/models/claim_model.dart';

import 'claim_remote_datasource_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late ClaimRemoteDataSourceImpl dataSource;

  setUp(() {
    mockDio = MockDio();
    dataSource = ClaimRemoteDataSourceImpl(dio: mockDio);
  });

  test(
    'should return list of ClaimModel when API call is successful',
    () async {
      when(mockDio.get(any)).thenAnswer(
        (_) async => Response(
          data: [
            {"userId": 1, "id": 1, "title": "Test title", "body": "Test body"},
          ],
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final result = await dataSource.getClaims();

      expect(result, isA<List<ClaimModel>>());
      expect(result.first.title, "Test title");
    },
  );
}
