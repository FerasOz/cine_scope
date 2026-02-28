import 'package:cine_scope/core/networking/api_service.dart';
import 'package:cine_scope/core/networking/dio_factory.dart';
import 'package:cine_scope/features/bottom_nav/details/data/repo/movie_details_repo.dart';
import 'package:cine_scope/features/bottom_nav/home/data/repo/home_repo.dart';
import 'package:cine_scope/features/bottom_nav/details/logic/movie_details_cubit.dart';
import 'package:cine_scope/features/bottom_nav/home/logic/home_cubit.dart';
import 'package:cine_scope/features/bottom_nav/search/data/search_repo.dart';
import 'package:cine_scope/features/bottom_nav/search/logic/search_cubit.dart';
import 'package:cine_scope/features/bottom_nav/watch_list/data/local/watchlist_local_data_source.dart';
import 'package:cine_scope/features/bottom_nav/watch_list/data/repo/watchlist_repo.dart';
import 'package:cine_scope/features/bottom_nav/watch_list/logic/watchlist_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<ApiService>()));
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));

  getIt.registerLazySingleton<MovieDetailsRepo>(
    () => MovieDetailsRepo(getIt<ApiService>()),
  );
  getIt.registerFactory<MovieDetailsCubit>(
    () => MovieDetailsCubit(getIt<MovieDetailsRepo>()),
  );

  getIt.registerLazySingleton<SearchRepo>(
    () => SearchRepo(getIt<ApiService>()),
  );
  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt<SearchRepo>()));

  final box = Hive.box<Map>('watchlist');

  getIt.registerLazySingleton(() => WatchlistLocalDataSource(box));

  getIt.registerLazySingleton(() => WatchlistRepo(getIt()));

  getIt.registerFactory(() => WatchlistCubit(getIt()));
}
