part of 'app_loader_bloc.dart';

@immutable
sealed class AppLoaderState {}

final class AppLoaderInitial extends AppLoaderState {}
class LoaderState extends AppLoaderState {
  final bool? isLoading;

  LoaderState({this.isLoading = false});
}