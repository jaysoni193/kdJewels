import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kd_jewels/features/for_user/login_register_screen/data/datasources/login_register_remote_datasource.dart';
import 'package:kd_jewels/features/for_user/login_register_screen/data/repositories/login_register_repositories_impl.dart';
import 'package:kd_jewels/features/for_user/login_register_screen/presentation/bloc/login_register_bloc/login_register_bloc.dart';
import '../core/api/app_dio.dart';
import '../features/for_user/login_register_screen/domain/repositories/login_register_repository.dart';
import '../features/for_user/login_register_screen/domain/useCases/login_register_useCase.dart';
import '../features/splash_screen/presentation/bloc/app_loader_bloc.dart';

GetIt sl = GetIt.instance;

class DependencyInjection {
  Future<void> init() async {
    // Dio instance
    sl.registerLazySingleton<Dio>(() => AppDio.getInstance());

    //shared preferences
    // sl.registerLazySingleton<SecurePreferenceManager>(
    //       () => SecurePreferenceManager(),
    // );

    //inject blocs
    sl.registerFactory<AppLoaderBloc>(() => AppLoaderBloc());
    sl.registerFactory<LoginRegisterBloc>(() => LoginRegisterBloc(loginRegisterUseCase: sl()));

    //inject useCases
    sl.registerLazySingleton<LoginRegisterUseCase>(() => LoginRegisterUseCase(loginRegisterRepository: sl()));

    //inject repository
    sl.registerLazySingleton<LoginRegisterRepository>(() => LoginRegisterRepositoriesImpl(loginRegisterRemoteDatasource: sl()));
    // inject remote dataSources
    sl.registerLazySingleton<LoginRegisterRemoteDatasource>(() => LoginRemoteDatasourceImpl(dio: sl()));
  }
}
