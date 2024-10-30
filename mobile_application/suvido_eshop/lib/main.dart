import 'package:flutter/material.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouting.appRoutes,
    );
  }
}
