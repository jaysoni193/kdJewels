part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}

class DashboardTabChanged extends DashboardEvent {
  final int index;
  DashboardTabChanged(this.index);
}