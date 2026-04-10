import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'other_screens_event.dart';
part 'other_screens_state.dart';

class OtherScreensBloc extends Bloc<OtherScreensEvent, OtherScreensState> {
  OtherScreensBloc() : super(OtherScreensInitial()) {
    on<OtherScreensEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
