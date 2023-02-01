import 'package:dartz/dartz.dart';
import 'package:home_cure/core/api_errors/index.dart';
import 'package:home_cure/features/calling/data/models/comapny_settings_model.dart';
import 'package:home_cure/features/calling/data/models/compliantment_model.dart';

abstract class IComapnySettingsRepository {
  Future<Either<NetworkExceptions, ComapnySettingsModel>> getCompanySettings();
  Future<Either<NetworkExceptions, ComplaintModel>> addCompliantment(
    ComplaintModel model,
  );
}
