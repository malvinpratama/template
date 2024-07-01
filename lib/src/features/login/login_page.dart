import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/utils.dart';

class LoginPage extends StatelessWidget {
  static const String route = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 64),
          child: Column(
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
              _buildForm(),
              128.verticalSpace,
              _buildButtonLogIn()
            ],
          ),
        ),
      ),
    );
  }

  Column _buildForm() {
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
          ),
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
          ),
        ),
      ],
    );
  }

  SizedBox _buildButtonLogIn() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Padding(
          padding: REdgeInsets.symmetric(
            vertical: 16,
          ),
          child: Text(
            LocaleKeys.logIn.tr(),
            style: GoogleFonts.sen(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
