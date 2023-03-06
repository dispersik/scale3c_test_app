import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';

class AppTextButton extends StatelessWidget {
  final String buttonText;
  final void Function() onTap;

  const AppTextButton({
    required this.onTap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColorTheme.backgroundMain,
                border: Border.all(color: AppColorTheme.border),
              ),
              alignment: Alignment.center,
              height: Dimensions.SPACE_60,
              child: Text(
                buttonText,
                style: AppTextTheme.actionButtonText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AccentTextButton extends StatelessWidget {
  final String buttonText;
  final void Function() onTap;

  const AccentTextButton({
    required this.onTap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              height: Dimensions.SPACE_60,
              color: AppColorTheme.accent,
              child: Text(
                buttonText,
                style: AppTextTheme.accentText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
