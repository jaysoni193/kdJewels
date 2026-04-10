import 'package:get_it/get_it.dart';
import '../features/for_user/login_register_screen/data/repositories/login_register_repositories_impl.dart';
import '../features/for_user/login_register_screen/domain/repositories/login_register_repository.dart';
import '../features/for_user/login_register_screen/presentation/bloc/login_register_bloc/login_register_bloc.dart';
import '../core/utils/prefrence_manager.dart';
import '../features/for_user/home_screen/data/datasources/home_remote_datasource.dart';
import '../features/for_user/home_screen/data/repositories/home_repositories_impl.dart';
import '../features/for_user/home_screen/domain/repositories/home_repository.dart';
import '../features/for_user/home_screen/domain/useCases/home_useCase.dart';
import '../features/for_user/home_screen/presentation/bloc/home_bloc/home_bloc.dart';
import '../features/for_user/login_register_screen/data/datasources/login_register_remote_datasource.dart';
import '../features/for_user/login_register_screen/domain/useCases/login_register_useCase.dart';

GetIt sl = GetIt.instance;

class DependencyInjection {
Future<void> init() async {
/*    // Dio instance
    sl.registerLazySingleton<Dio>(() => AppDio.getInstance());*/

//shared preferences
// sl.registerLazySingleton<PreferenceManager>(() => PreferenceManager());

///Login
sl.registerFactory(() =>LoginRegisterBloc(loginRegisterUseCase: sl()),);

sl.registerLazySingleton<LoginRegisterUseCase>(() => LoginRegisterUseCase(loginRegisterRepository: sl()),);

sl.registerLazySingleton<LoginRegisterRepository>(() => LoginRegisterRepositoriesImpl(loginRegisterRemoteDatasource: sl()),);

sl.registerLazySingleton(() => LoginRegisterRemoteDatasource(),);

///Home
sl.registerFactory<HomeBloc>(() => HomeBloc(homeUseCase: sl()));

sl.registerLazySingleton<HomeUseCase>(
() => HomeUseCase(homeRepository: sl()),
);

sl.registerLazySingleton<HomeRepository>(
() => HomeRepositoriesImpl(homeRemoteDatasource: sl()),
);

sl.registerLazySingleton<HomeRemoteDatasource>(
() => HomeRemoteDatasourceImpl(dio: sl()),
);
}
}
