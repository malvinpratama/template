part of 'login_bloc.dart';

class LoginState extends Equatable {
  final Email email;
  final Password password;
  final ViewStatusModel viewStatusModel;
  final String errorMsg;

  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.viewStatusModel = ViewStatusModel.idle,
    this.errorMsg = ''
  });

  LoginState copywith({
    Email? email,
    Password? password,
    ViewStatusModel? viewStatusModel,
    String? errorMsg,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      viewStatusModel: viewStatusModel ?? this.viewStatusModel,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
  
  @override
  List<Object?> get props => [
    email,
    password,
    viewStatusModel,
    errorMsg,
  ];
}
