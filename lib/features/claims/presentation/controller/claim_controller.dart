import 'package:get/state_manager.dart';
import 'package:insurance_claim_app/features/claims/domain/entities/claim_entity.dart';
import 'package:insurance_claim_app/features/claims/domain/usecases/get_claim.dart';
import 'package:insurance_claim_app/features/claims/domain/usecases/search_claim.dart';

class ClaimController extends GetxController {
  final GetClaim getClaims;
  final SearchClaim searchClaims;

  ClaimController({required this.getClaims, required this.searchClaims});

  var claims = <ClaimEntity>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchClaims();
  }

  Future<void> fetchClaims() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final result = await getClaims();
      claims.assignAll(result);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> search(String keyword) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final result = await searchClaims(keyword);
      claims.assignAll(result);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
