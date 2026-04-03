import 'package:cine_scope/core/networking/api_service.dart';
import 'package:cine_scope/core/networking/dio_factory.dart';
import 'package:cine_scope/features/details/data/repo/media_details_repo.dart';
import 'package:cine_scope/features/home/data/repo/home_repo.dart';
import 'package:cine_scope/features/details/logic/media_details_cubit.dart';
import 'package:cine_scope/features/home/logic/home_cubit.dart';
import 'package:cine_scope/features/search/data/local/search_local_data_source.dart';
import 'package:cine_scope/features/search/data/repo/search_repo.dart';
import 'package:cine_scope/features/search/logic/search_cubit.dart';
import 'package:cine_scope/features/watch_list/data/local/watchlist_local_data_source.dart';
import 'package:cine_scope/features/watch_list/data/repo/watchlist_repo.dart';
import 'package:cine_scope/features/watch_list/logic/watchlist_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<ApiService>()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  getIt.registerLazySingleton<MediaDetailsRepo>(
    () => MediaDetailsRepo(getIt<ApiService>()),
  );
  getIt.registerFactory<MediaDetailsCubit>(
    () => MediaDetailsCubit(getIt<MediaDetailsRepo>()),
  );

  getIt.registerLazySingleton<SearchRepo>(
    () => SearchRepo(getIt<ApiService>()),
  );
  getIt.registerFactory<SearchCubit>(
    () => SearchCubit(getIt<SearchRepo>(), getIt<SearchLocalDataSource>()),
  );

  final box = Hive.box<Map>('watchlist');

  getIt.registerLazySingleton(() => WatchlistLocalDataSource(box));

  getIt.registerLazySingleton(() => WatchlistRepo(getIt()));

  getIt.registerLazySingleton<WatchlistCubit>(() => WatchlistCubit(getIt()));

  final searchBox = Hive.box('search');
  getIt.registerLazySingleton(() => SearchLocalDataSource(searchBox));
}
