import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'contact_us_event.dart';
part 'contact_us_state.dart';

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  ContactUsBloc() : super(ContactUsInitial()) {
    on<ContactUsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
