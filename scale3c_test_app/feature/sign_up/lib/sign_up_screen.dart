
import 'package:common_presentation/common_presentation.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:profile/profile.dart';



class SignUpScreen extends StatelessWidget {
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
                AppTextField.notObscure(hintText: 'Enter email'),
                const SizedBox(height: Dimensions.SPACE_16),
                AppTextField.obscure(hintText: 'Enter Password'),
                const SizedBox(height: Dimensions.SPACE_16),
                AppTextField.obscure(hintText: 'Confirm Password'),
                const SizedBox(height: Dimensions.SPACE_50),
                AccentTextButton(
                    onTap: () => _mockSignIn(context), buttonText: _signUpText),
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
                          ..onTap = () => Navigator.of(context).pop(),
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
