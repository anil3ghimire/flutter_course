import 'package:flutter/material.dart';
import 'package:flutter_second/route/app_router.dart';
import 'theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.dartTheme,
      themeMode: ThemeMode.system,
    );
  }
}
