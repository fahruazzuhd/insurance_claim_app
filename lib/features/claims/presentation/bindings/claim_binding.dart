import 'package:get/instance_manager.dart';
import 'package:insurance_claim_app/di.dart';
import 'package:insurance_claim_app/features/claims/presentation/controller/claim_controller.dart';

class ClaimBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClaimController(getClaims: sl(), searchClaims: sl()));
  }
}
