import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';
import '../pages.dart';
import 'bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  static const String route = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginState>(
        listenWhen: (previous, current) {
          return previous.viewStatusModel != current.viewStatusModel;
        },
        listener: (context, state) {
          if (state.viewStatusModel == ViewStatusModel.success) {
            context.pushReplacementNamed(HomePage.route);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 64),
              child: BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previous, current) {
                  return previous.errorMsg != current.errorMsg;
                },
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      192.verticalSpace,
                      FlutterLogo(
                        size: 128.r,
                      ),
                      64.verticalSpace,
                      Text(
                        LocaleKeys.logIn.tr(),
                        style: GoogleFonts.sen(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      16.verticalSpace,
                      if (state.viewStatusModel == ViewStatusModel.failure)
                        Column(
                          children: [
                            Text(
                              state.errorMsg,
                              style: GoogleFonts.sen(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.red,
                              ),
                            ),
                            8.verticalSpace,
                          ],
                        ),
                      _buildForm(),
                      128.verticalSpace,
                      _buildButtonLogIn()
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        final bloc = context.read<LoginBloc>();
        return Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorAssets.kCelestialBlue,
                  ),
                ),
                labelText: LocaleKeys.email.tr(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'mail@mail.com',
                hintStyle: GoogleFonts.sen(),
                errorText:
                    state.email.displayError == EmailValidationError.invalid
                        ? LocaleKeys.emailInvalid.tr()
                        : null,
              ),
              onChanged: bloc.onChangeEmail,
            ),
            32.verticalSpace,
            TextFormField(
              obscureText: true,
              obscuringCharacter: '●',
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorAssets.kCelestialBlue,
                  ),
                ),
                labelText: LocaleKeys.password.tr(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: '●●●●●●●●',
                hintStyle: GoogleFonts.sen(),
                suffixIcon: const Icon(
                  Icons.visibility_off,
                ),
                errorText: state.password.displayError ==
                        PasswordValidationError.invalid
                    ? LocaleKeys.emailInvalid.tr()
                    : null,
              ),
              onChanged: bloc.onChangePassword,
            ),
          ],
        );
      },
    );
  }

  Widget _buildButtonLogIn() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) {
        return previous.viewStatusModel != current.viewStatusModel;
      },
      builder: (context, state) {
        final bloc = context.read<LoginBloc>();
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  state.viewStatusModel == ViewStatusModel.submitting
                      ? Colors.grey
                      : ColorAssets.kCelestialBlue,
            ),
            onPressed: () {
              bloc.login();
            },
            child: Padding(
              padding: REdgeInsets.symmetric(
                vertical: 16,
              ),
              child: state.viewStatusModel == ViewStatusModel.submitting
                  ? SizedBox(
                      width: 18.r,
                      height: 18.r,
                      child: const CircularProgressIndicator.adaptive(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Text(
                      LocaleKeys.logIn.tr(),
                      style: GoogleFonts.sen(color: Colors.white),
                    ),
            ),
          ),
        );
      },
    );
  }
}
