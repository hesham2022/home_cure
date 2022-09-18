import 'package:dartz/dartz.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/core/useCase/use_case.dart';
import 'package:home_cure/features/authentication/domain/entities/user.dart';
import 'package:home_cure/features/authentication/domain/repositories/i_user.dart';

class GetMe extends UseCase<User, NoParams> {
  GetMe(this.repository);
  final IUserRepository repository;

  @override
  Future<Either<NetworkExceptions, User>> call(NoParams params) async {
    return repository.getMe();
  }
}
