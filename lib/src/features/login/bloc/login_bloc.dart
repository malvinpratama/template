import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../models/models.dart';
import '../../../utils/utils.dart';

part 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(const LoginState());

  onChangeEmail(String value) {
    final email = Email.dirty(value: value);
    emit(
      state.copywith(
        email: email,
      ),
    );
  }

  onChangePassword(String value) {
    final password = Password.dirty(value: value);
    emit(
      state.copywith(
        password: password,
      ),
    );
  }

  login() {
    if (state.viewStatusModel != ViewStatusModel.submitting &&
        Formz.validate([state.email, state.password])) {
      emit(
        state.copywith(
          viewStatusModel: ViewStatusModel.submitting,
        ),
      );

      //  TODO : Logic Login
      Future.delayed(const Duration(seconds: 3)).then(
        (value) {
          // TODO : Success Login
          // emit(
          //   state.copywith(
          //     viewStatusModel: ViewStatusModel.success,
          //   ),
          // );

          // TODO : Failed Login
           emit(
            state.copywith(
              viewStatusModel: ViewStatusModel.failure,
              errorMsg: LocaleKeys.emailOrPasswordIsInvalid,
            ),
          );
        },
      );
    }
  }

  resetStatus() {
    emit(
      state.copywith(
        viewStatusModel: ViewStatusModel.idle,
        errorMsg: '',
      ),
    );
  }
}
