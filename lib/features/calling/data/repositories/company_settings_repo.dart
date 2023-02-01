import 'package:dartz/dartz.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/core/utils/catch_async.dart';
import 'package:home_cure/features/calling/data/datasources/comapny_settings_datasource.dart';
import 'package:home_cure/features/calling/data/models/comapny_settings_model.dart';
import 'package:home_cure/features/calling/data/models/compliantment_model.dart';
import 'package:home_cure/features/calling/domain/repositories/i_comapny_settings_repo.dart';

class ComapnySettingsRepository extends IComapnySettingsRepository {
  ComapnySettingsRepository(this.userRemote);
  final IComapnySettingsRemote userRemote;

  @override
  Future<Either<NetworkExceptions, ComapnySettingsModel>>
      getCompanySettings() =>
          guardFuture<ComapnySettingsModel>(userRemote.getComapnySettings);
  @override
  Future<Either<NetworkExceptions, ComplaintModel>> addCompliantment(
    ComplaintModel model,
  ) =>
      guardFuture<ComplaintModel>(() => userRemote.addCompliantment(model));
}
