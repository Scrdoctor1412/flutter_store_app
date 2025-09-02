import 'package:flutter_store_app/core/errors/failure.dart';
import 'package:flutter_store_app/data/data_sources/auth_remote_data_source.dart';
import 'package:flutter_store_app/data/models/user.dart';
import 'package:fpdart/src/either.dart';

abstract interface class AuthRepository {
  // Future<Either<>> signin(String email, String password)();
  Future<Either<Failure, User>> signUpUsers({
    required String email,
    required String password,
    required String fullName,
  });
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl({required AuthRemoteDataSource authRemoteDataSource})
    : _authRemoteDataSource = authRemoteDataSource;

  @override
  Future<Either<Failure, User>> signUpUsers({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final res = await _authRemoteDataSource.signUpUsers(
        email: email,
        password: password,
        fullName: fullName,
      );
      if (res != null && res is User) {
        return right(res);
      }
      return left(Failure(message: res.toString()));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
