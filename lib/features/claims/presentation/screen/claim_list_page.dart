import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:insurance_claim_app/features/claims/presentation/controller/claim_controller.dart';
import 'package:insurance_claim_app/features/claims/presentation/screen/claim_detail_page.dart';

class ClaimListPage extends StatelessWidget {
  const ClaimListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ClaimController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Insurance Claims'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.fetchClaims,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search claims...',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) => controller.search(value),
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }
        if (controller.claims.isEmpty) {
          return const Center(child: Text('No claims found.'));
        }
        return ListView.builder(
          itemCount: controller.claims.length,
          itemBuilder: (context, index) {
            final claim = controller.claims[index];
            return Card(
              child: ListTile(
                title: Text(
                  claim.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  claim.body,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  Get.to(() => ClaimDetailPage(claim: claim));
                },
              ),
            );
          },
        );
      }),
    );
  }
}
