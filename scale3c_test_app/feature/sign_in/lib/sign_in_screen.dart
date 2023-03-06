
import 'package:common_presentation/common_presentation.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:profile/profile.dart';
import 'package:sign_up/sign_up.dart';

class SignInScreen extends StatelessWidget {
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
                AppTextField.notObscure(hintText: 'Username'),
                const SizedBox(height: Dimensions.SPACE_16),
                AppTextField.obscure(hintText: 'Password'),
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
                AccentTextButton(
                    onTap: () => _mockSignIn(context), buttonText: _signInText),
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
                          ..onTap = () => Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                                builder: (_) => SignUpScreen()),
                          ),
                      ),
                    ])),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _mockSignIn(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute<void>(builder: (_) => ProfileScreen()));
}
