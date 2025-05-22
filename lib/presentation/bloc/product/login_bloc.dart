import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/login_use_case.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String accessToken;

  LoginSuccess(this.accessToken);
}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message);
}

abstract class LoginEvent {
  final String username;
  final String password;

  LoginEvent(this.username, this.password);
}

class LoginSubmitted extends LoginEvent {
  LoginSubmitted({required String username, required String password})
      : super(username, password);
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginLoading());
      final result = await loginUseCase(event.username, event.password);
      result.fold(
            (failure) => emit(LoginFailure('Đăng nhập thất bại: $failure')),
            (success) => emit(LoginSuccess(success.accessToken)),
      );
    });
  }
}