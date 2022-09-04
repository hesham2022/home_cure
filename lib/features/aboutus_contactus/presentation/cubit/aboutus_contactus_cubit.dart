import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'aboutus_contactus_state.dart';

class AboutusContactusCubit extends Cubit<AboutusContactusState> {
  AboutusContactusCubit() : super(AboutusContactusInitial());
}
