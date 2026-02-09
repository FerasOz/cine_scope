import 'package:cine_scope/cine_scope_app.dart';
import 'package:cine_scope/core/routing/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(CineScopeApp(appRouters: AppRouters()));
}
