part of 'setting_bloc.dart';

class SettingState extends Equatable {
  const SettingState({this.lang = 'en'});
  final String lang;
bool get isEng => lang == 'en';
bool get isAr => lang == 'ar';

  @override
  List<Object> get props => [lang];
}

// class SettingInitial extends SettingState {}
