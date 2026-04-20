import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_loader_event.dart';
part 'app_loader_state.dart';

class AppLoaderBloc extends Bloc<AppLoaderEvent, AppLoaderState> {
  AppLoaderBloc() : super(AppLoaderInitial()) {
    on<AppLoaderEvent>((event, emit) {
      on<LoaderEvent>(_loaderEvent);
    });
  }
  void _loaderEvent(LoaderEvent event, Emitter<AppLoaderState> emit) {
    emit(LoaderState(isLoading: event.isLoading));
  }
}
