import 'package:common_presentation/common_presentation.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in/bloc/sign_in_bloc.dart';
import 'package:sign_in/bloc/sign_in_event.dart';
import 'package:sign_in/bloc/sign_in_state.dart';

class SignInScreenInternal extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  static const String _signInText = 'Sign In';
  static const String _forgotPasswordText = 'Forgot your password?';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColorTheme.backgroundMain,
        appBar: MainAppBar(
          onMenuTap: () {},
          titleText: _signInText,
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
                  hintText: 'Email',
                  isObscure: false,
                  controller: _emailController,
                ),
                const SizedBox(height: Dimensions.SPACE_16),
                AppTextField(
                  hintText: 'Password',
                  isObscure: true,
                  controller: _passwordController,
                ),
                const SizedBox(height: Dimensions.SPACE_16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        _forgotPasswordText,
                        style: AppTextTheme.actionButtonText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Dimensions.SPACE_50),
                BlocBuilder<SignInBloc, SignInState>(
                    builder: (BuildContext context, SignInState state) {
                  if (state.badCredentials) {
                    return Text(
                      'Could not sign in',
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                }),
                AccentTextButton(
                  onTap: () {
                    context.read<SignInBloc>().add(
                          SignInWithEmailAndPasswordEvent(
                              password: _passwordController.text,
                              email: _emailController.text),
                        );
                  },
                  buttonText: _signInText,
                ),
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
                      text: 'Don’t have an account? ',
                      style: AppTextTheme.body),
                  TextSpan(
                      text: 'Sign Up',
                      style: AppTextTheme.orangeClickableText,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context
                            .read<SignInBloc>()
                            .add(RouteToSignUpEvent())),
                ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
