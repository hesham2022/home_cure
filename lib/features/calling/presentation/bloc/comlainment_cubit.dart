import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/features/calling/data/models/compliantment_model.dart';
import 'package:home_cure/features/calling/domain/repositories/i_comapny_settings_repo.dart';

abstract class ComplaintState {}

class ComplaintIntial extends ComplaintState {}

class ComplaintLoading extends ComplaintState {}

class ComplaintSuccess extends ComplaintState {
  ComplaintSuccess(this.complaintment);

  final ComplaintModel complaintment;
}

class ComplaintFailure extends ComplaintState {
  ComplaintFailure(this.error);

  final NetworkExceptions error;
}

class ComplaintCubit extends Cubit<ComplaintState> {
  ComplaintCubit({required this.repository}) : super(ComplaintIntial());
  final IComapnySettingsRepository repository;
  Future addCompliantment(ComplaintModel model) async {
    emit(ComplaintLoading());
    final result = await repository.addCompliantment(model);
    result.fold(
      (l) => emit(ComplaintFailure(l)),
      (r) => emit(ComplaintSuccess(r)),
    );
  }
}
