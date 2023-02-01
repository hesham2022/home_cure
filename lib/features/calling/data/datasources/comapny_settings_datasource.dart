import 'package:home_cure/core/api_config/index.dart';
import 'package:home_cure/features/calling/data/models/comapny_settings_model.dart';
import 'package:home_cure/features/calling/data/models/compliantment_model.dart';

abstract class IComapnySettingsRemote {
  IComapnySettingsRemote(this.apiConfig);
  final ApiClient apiConfig;

  Future<ComapnySettingsModel> getComapnySettings();
  Future<ComplaintModel> addCompliantment(ComplaintModel complaintModel);
}

class ComapnySettingsRemote extends IComapnySettingsRemote {
  ComapnySettingsRemote(super.apiConfig);

  @override
  Future<ComapnySettingsModel> getComapnySettings() async {
    final response = await apiConfig.get(kSetting);
    final data = response.data as Map<String, dynamic>;

    final comapnySettingsResult = ComapnySettingsModel.fromMap(data);
    return comapnySettingsResult;
  }

  @override
  Future<ComplaintModel> addCompliantment(ComplaintModel complaintModel) async {
    final response =
        await apiConfig.post(kComplainment, body: complaintModel.toMap());
    return ComplaintModel.fromMap(response.data as Map<String, dynamic>);
    // response.data as Map<String, dynamic>;
  }
}
