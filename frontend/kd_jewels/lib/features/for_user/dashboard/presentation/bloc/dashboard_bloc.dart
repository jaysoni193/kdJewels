import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState(selectedTab: DashboardTab.home)) {
    on<DashboardTabChanged>((event, emit) {
      emit(state.copyWith(selectedTab: DashboardTab.values[event.index]));
    });
  }
}