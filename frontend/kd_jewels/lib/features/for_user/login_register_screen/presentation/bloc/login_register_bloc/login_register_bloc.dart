import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/model/sign_in_model.dart';
import '../../../domain/useCases/login_register_useCase.dart';

part 'login_register_event.dart';

part 'login_register_state.dart';

class LoginRegisterBloc extends Bloc<LoginRegisterEvent, LoginRegisterState> {
  final LoginRegisterUseCase _loginRegisterUseCase;

  LoginRegisterBloc({required LoginRegisterUseCase loginRegisterUseCase}) : _loginRegisterUseCase = loginRegisterUseCase, super(LoginRegisterInitial()) {
    on<LoginRegisterEvent>((event, emit) {
      on<LoginRegisterEvent>((event, emit) {});
      on<LogInEvent>(_doSignIn);
    });
  }

  void _doSignIn(LogInEvent event, emit) async {
    emit(LoadingState(true));
    final result = await _loginRegisterUseCase.doSignIn(event.email, event.password,);
    result.when(
      success: (data) {
        emit(LoadingState(false));
        emit(LoginSuccessState(data, event.email, event.password,));
      },
      failure: (error) {
        emit(LoadingState(false));
        return emit(ErrorState(error));
      },
    );
  }
}
