import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_cure/core/local_storage/secure_storage_instance.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(const SettingState()) {
    on<GetLan>((event, emit) async {
      final lang = await Storage.getLang();
      if (lang != null) emit(SettingState(lang: lang));
    });
    on<SetLang>((event, emit) async {
      await Storage.setLang(event.lang);
      emit(SettingState(lang: event.lang));
    });
  }
}
