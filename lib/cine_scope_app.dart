import 'package:cine_scope/core/routing/app_routers.dart';
import 'package:cine_scope/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CineScopeApp extends StatelessWidget {
  final AppRouters appRouters;
  const CineScopeApp({super.key, required this.appRouters});

  @override
  Widget build(BuildContext context) {
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
        initialRoute: Routes.appLayout,
      ),
    );
  }
}
