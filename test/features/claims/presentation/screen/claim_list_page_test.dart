import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:insurance_claim_app/features/claims/domain/entities/users_entity.dart';
import 'package:insurance_claim_app/features/claims/domain/usecases/get_claim.dart';
import 'package:insurance_claim_app/features/claims/domain/usecases/get_user.dart';
import 'package:insurance_claim_app/features/claims/domain/usecases/search_claim.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:insurance_claim_app/features/claims/domain/entities/claim_entity.dart';
import 'package:insurance_claim_app/features/claims/presentation/controller/claim_controller.dart';
import 'package:insurance_claim_app/features/claims/presentation/screen/claim_list_page.dart';

import 'claim_list_page_test.mocks.dart';

@GenerateMocks([GetClaim, SearchClaim, GetUsers])
void main() {
  late MockGetClaim mockGetClaim;
  late MockSearchClaim mockSearchClaim;
  late MockGetUsers mockGetUsers;

  setUp(() {
    mockGetClaim = MockGetClaim();
    mockSearchClaim = MockSearchClaim();
    mockGetUsers = MockGetUsers();

    when(mockGetClaim()).thenAnswer(
      (_) async => [
        const ClaimEntity(userId: 1, id: 1, title: 'Test', body: 'Body'),
      ],
    );
    when(mockSearchClaim(any)).thenAnswer((_) async => []);

    when(mockGetUsers()).thenAnswer(
      (_) async => [
        const UsersEntity(
          id: 1,
          name: 'Test User',
          username: 'test',
          email: 'test',
          phone: 'test',
          website: 'test',
        ),
      ],
    );
  });

  testWidgets('shows claims', (tester) async {
    Get.put(
      ClaimController(
        getClaims: mockGetClaim,
        searchClaims: mockSearchClaim,
        getUsers: mockGetUsers,
      ),
    );

    await tester.pumpWidget(const GetMaterialApp(home: ClaimListPage()));
    await tester.pump();

    expect(find.text('Test'), findsOneWidget);
    expect(find.text('Body'), findsOneWidget);

    verify(mockGetClaim()).called(1);
    verify(mockGetUsers()).called(1);
  });
}
