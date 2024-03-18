import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_video/data/repo/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<Login>((event, emit) async {
      emit(AuthLoading());

      try {
        await authRepository.loginUser(phone: event.phoneNumber);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(errorMessage: '$e'));
      }
    });
  }
}
