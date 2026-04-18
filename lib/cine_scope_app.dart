import 'package:cine_scope/core/di/dependency_injection.dart';
import 'package:cine_scope/core/routing/app_routers.dart';
import 'package:cine_scope/core/routing/routes.dart';
import 'package:cine_scope/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CineScopeApp extends StatelessWidget {
  final AppRouters appRouters;
  const CineScopeApp({super.key, required this.appRouters});

  @override
  Widget build(BuildContext context) {
    final initialRoute = getIt<AuthRepo>().hasActiveSession
        ? Routes.appLayout
        : Routes.loginScreen;

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cine Scope',
        // themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        // theme: AppThemes.lightTheme,
        // darkTheme: AppThemes.darkTheme,
        onGenerateRoute: appRouters.onGenerateRoute,
        initialRoute: initialRoute,
      ),
    );
  }
}
