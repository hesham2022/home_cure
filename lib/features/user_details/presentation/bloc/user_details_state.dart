part of 'user_details_bloc.dart';

abstract class UserDetailsState extends Equatable {
  const UserDetailsState();  

  @override
  List<Object> get props => [];
}
class UserDetailsInitial extends UserDetailsState {}
