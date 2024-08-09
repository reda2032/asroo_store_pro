import 'package:asroo_store/core/app/app_cubit/app_cubit.dart';
import 'package:get_it/get_it.dart';

import '../service/graphql/api_service.dart';
import '../service/graphql/dio_factory.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initCore();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  sl
    ..registerFactory(AppCubit.new)
    ..registerLazySingleton<ApiService>(() => ApiService(dio));
}
