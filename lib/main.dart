import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_claim_app/di.dart' as di;
import 'package:insurance_claim_app/features/claims/presentation/screen/claim_list_page.dart';
import 'features/claims/presentation/bindings/claim_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Insurance Claims',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialBinding: ClaimBinding(),
      home: const ClaimListPage(),
    );
  }
}
