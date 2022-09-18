part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    User? user,
    this.message = '',
  }) : user = user ?? User.empty;

  AuthenticationState.unknown() : this._();

  AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  AuthenticationState.unauthenticated(String messeage)
      : this._(status: AuthenticationStatus.unauthenticated, message: messeage);

  final AuthenticationStatus status;
  final User user;
  final String message;
  @override
  List<Object> get props => [status, user];
}
