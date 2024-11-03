import 'package:flutter/material.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initProject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouting.appRoutes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Merriweather',
        focusColor: AppColors.primaryDarkGreen,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStatePropertyAll(
              AppFontStyles.regularWhite15.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        textTheme: const TextTheme(
          bodySmall: AppFontStyles.regularBlack7,
          bodyMedium: AppFontStyles.regularBlack13,
          bodyLarge: AppFontStyles.regularBlack15,
          labelSmall: AppFontStyles.regularBlack18,
          labelMedium: AppFontStyles.regularBlack21,
          labelLarge: AppFontStyles.regularBlack23,
          displaySmall: AppFontStyles.boldWhite13,
          displayMedium: AppFontStyles.boldWhite18,
          displayLarge: AppFontStyles.boldWhite23,
          titleSmall: AppFontStyles.boldBlack13,
          titleMedium: AppFontStyles.boldBlack18,
          titleLarge: AppFontStyles.boldBlack23,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryBlack,
          titleTextStyle: AppFontStyles.boldWhite18,
        ),
      ),
    );
  }
}
