import 'package:flutter/material.dart';
import 'package:insurance_claim_app/features/claims/domain/entities/claim_entity.dart';

class ClaimDetailPage extends StatelessWidget {
  final ClaimEntity claim;

  const ClaimDetailPage({super.key, required this.claim});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Claim #${claim.id}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Claimant ID: ${claim.userId}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(claim.title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(claim.body),
          ],
        ),
      ),
    );
  }
}
