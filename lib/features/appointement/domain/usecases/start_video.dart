import 'package:dartz/dartz.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/core/useCase/use_case.dart';
import 'package:home_cure/features/appointement/domain/entities/agora_token.dart';
import 'package:home_cure/features/appointement/domain/repositories/i_appointemnts.dart';

class StartVideo extends UseCase<AgoraToken, String> {
  StartVideo(this.repository);
  final IAppointmentRepository repository;

  @override
  Future<Either<NetworkExceptions, AgoraToken>> call(
    String params,
  ) async {
    return repository.stratVideo(params);
  }
}
