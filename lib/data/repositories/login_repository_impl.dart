import 'package:dartz/dartz.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../sources/remote/login_remote_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Exception, LoginEntity>> login(String username, String password) async {
    try {
      final loginModel = await remoteDataSource.login(username, password);
      return Right(loginModel);
    } catch (e) {
      return Left(Exception('Login failed: $e'));
    }
  }
}