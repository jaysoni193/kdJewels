import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/useCases/login_register_useCase.dart';

part 'login_register_event.dart';

part 'login_register_state.dart';

class LoginRegisterBloc extends Bloc<LoginRegisterEvent, LoginRegisterState> {
  final LoginRegisterUseCase _loginRegisterUseCase;

  LoginRegisterBloc({required LoginRegisterUseCase loginRegisterUseCase})
      : _loginRegisterUseCase = loginRegisterUseCase,
        super(LoginRegisterInitial()) {
    on<LoginRegisterEvent>((event, emit) {
      on<LoginRegisterEvent>((event, emit) {});

    });
  }

}
