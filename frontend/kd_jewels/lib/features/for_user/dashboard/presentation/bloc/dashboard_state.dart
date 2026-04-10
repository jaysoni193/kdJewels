part of 'dashboard_bloc.dart';

enum DashboardTab {home, favorite, search, person}

class DashboardState {
  final DashboardTab selectedTab;

  DashboardState({required this.selectedTab});

  DashboardState copyWith({DashboardTab? selectedTab}) {
    return DashboardState(
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }
}
