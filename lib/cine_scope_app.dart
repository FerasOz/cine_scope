import 'package:flutter/material.dart';

class CineScopeApp extends StatelessWidget {
  const CineScopeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cine Scope',
      // themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      // theme: AppThemes.lightTheme,
      // darkTheme: AppThemes.darkTheme,
      // onGenerateRoute: appRouters.onGenerateRoute,
      // initialRoute: Routes.homeScreen,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cine Scope'),
        ),
        body: const Center(
          child: Text('Welcome to Cine Scope!'),
        ),
      ),

    );
  }
}
