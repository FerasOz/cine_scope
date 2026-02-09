import 'package:cine_scope/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CineScopeApp extends StatelessWidget {
  const CineScopeApp({super.key});

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
        // onGenerateRoute: appRouters.onGenerateRoute,
        // initialRoute: Routes.homeScreen,
        home: HomeScreen()
      ),
    );
  }
}
