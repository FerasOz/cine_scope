import 'package:cine_scope/core/networking/api_service.dart';
import 'package:cine_scope/core/networking/dio_factory.dart';
import 'package:cine_scope/data/repos/home_repo/home_repo.dart';
import 'package:cine_scope/features/home/logic/home_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<ApiService>()));
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));
}
