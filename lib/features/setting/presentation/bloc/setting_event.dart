part of 'setting_bloc.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

class GetLan extends SettingEvent {}

class SetLang extends SettingEvent {
 const SetLang(this.lang);

  final String lang;
}
