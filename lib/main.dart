import 'package:cine_scope/cine_scope_app.dart';
import 'package:cine_scope/core/di/dependency_injection.dart';
import 'package:cine_scope/core/routing/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await setUpGetIt();
  runApp(CineScopeApp(appRouters: AppRouters()));
}
