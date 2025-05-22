import 'package:dartz/dartz.dart';

import '../entities/login_entity.dart';
import '../repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Exception, LoginEntity>> call(String username, String password) {
    return repository.login(username, password);
  }
}