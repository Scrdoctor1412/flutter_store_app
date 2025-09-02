import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_store_app/data/models/user.dart';
import 'package:flutter_store_app/data/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  // AuthBloc()
  //   : _authRepository = authRepository;

  AuthBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(AuthInitial()) {
    // on<AuthEvent>((event, emit) {});
    on<AuthSignUp>(
      (event, emit) => _onAuthSighup(event, emit),
    );
  }

  void _onAuthSighup(AuthSignUp event, Emitter emit) async {
    emit(AuthLoading());
    final res = await _authRepository.signUpUsers(
      email: event.email,
      password: event.password,
      fullName: event.fullName,
    );

    res.fold(
      (failure) {
        debugPrint(failure.message);
        emit(AuthFailure(failure.message));
      },
      (user) {
        debugPrint("login successs ${user.email} ");
        emit(AuthSuccess(user));
      },
    );
  }
}
