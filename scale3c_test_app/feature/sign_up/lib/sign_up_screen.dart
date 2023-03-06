import 'package:common_presentation/common_presentation.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/profile.dart';
import 'package:sign_up/bloc/sign_up_bloc.dart';
import 'package:sign_up/bloc/sign_up_event.dart';
import 'package:sign_up/bloc/sign_up_state.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  static const String _signUpText = 'Sign Up';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColorTheme.backgroundMain,
        appBar: MainAppBar(
          onLeadingTap: () => Navigator.of(context).pop(),
          onMenuTap: () {},
          titleText: _signUpText,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: Dimensions.SPACE_30),
            child: Column(
              children: <Widget>[
                const SizedBox(height: Dimensions.SPACE_60),
                AppImageTheme.pencil,
                const SizedBox(height: Dimensions.SPACE_50),
                AppTextField(
                  hintText: 'Enter email',
                  isObscure: false,
                  controller: _emailController,
                ),
                const SizedBox(height: Dimensions.SPACE_16),
                AppTextField(
                  hintText: 'Enter Password',
                  controller: _passwordController,
                  isObscure: true,
                ),
                // todo
                // const SizedBox(height: Dimensions.SPACE_16),
                // AppTextField(
                //   hintText: 'Confirm Password',
                //   controller: _repeatPasswordController,
                //   isObscure: true,
                // ),

                const SizedBox(height: Dimensions.SPACE_50),
                BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (BuildContext context, SignUpState state) {
                  final String? err = state.errorMessage;
                  if (err != null) {
                    return Text(
                      err,
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                }),
                AccentTextButton(
                    onTap: () {
                      context.read<SignUpBloc>().add(
                          SignUpWithEmailAndPasswordEvent(
                              password: _passwordController.text,
                              email: _emailController.text));
                    },
                    buttonText: _signUpText),
                const SizedBox(height: Dimensions.SPACE_16),
                Text('or', style: AppTextTheme.actionButtonText),
                const SizedBox(height: Dimensions.SPACE_16),
                SocialCarousel(
                  onFacebookTap: () {},
                  onLinkedInTap: () {},
                  onTwitterTap: () {},
                ),
                SizedBox(height: Dimensions.SPACE_50),
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: 'Already have an account? ',
                      style: AppTextTheme.body),
                  TextSpan(
                    text: 'Sign In',
                    style: AppTextTheme.orangeClickableText,
                    recognizer: TapGestureRecognizer()
                      ..onTap =
                          () => context.read<SignUpBloc>().add(RouteToSignIn()),
                  ),
                ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
