import 'package:cine_scope/cine_scope_app.dart';
import 'package:cine_scope/core/di/dependency_injection.dart';
import 'package:cine_scope/core/routing/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Hive.initFlutter();
  await Hive.openBox<Map>('watchlist');
  await setUpGetIt();
  runApp(CineScopeApp(appRouters: AppRouters()));
}
