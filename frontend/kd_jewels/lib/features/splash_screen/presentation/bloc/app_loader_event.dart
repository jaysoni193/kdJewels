part of 'app_loader_bloc.dart';

@immutable
sealed class AppLoaderEvent {}

class LoaderEvent extends AppLoaderEvent{
  final bool isLoading;

  LoaderEvent(this.isLoading);
}
