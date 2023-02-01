import 'package:dartz/dartz.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/core/useCase/use_case.dart';
import 'package:home_cure/features/authentication/domain/entities/user.dart';
import 'package:home_cure/features/authentication/domain/repositories/i_user.dart';

class GetUser extends UseCase<User, String> {
  GetUser(this.repository);
  final IUserRepository repository;

  @override
  Future<Either<NetworkExceptions, User>> call(String params) async {
    return repository.getUser(params);
  }
}

class GetProvider extends UseCase<User, String> {
  GetProvider(this.repository);
  final IUserRepository repository;

  @override
  Future<Either<NetworkExceptions, User>> call(String params) async {
    return repository.getProvider(params);
  }
}
