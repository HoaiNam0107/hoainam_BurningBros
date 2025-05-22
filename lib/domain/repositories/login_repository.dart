import 'package:dartz/dartz.dart';
import '../entities/login_entity.dart';

abstract class LoginRepository {
  Future<Either<Exception, LoginEntity>> login(String username, String password);
}