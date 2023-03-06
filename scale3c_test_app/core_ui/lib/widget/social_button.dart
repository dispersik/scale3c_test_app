import 'package:core_ui/app_color_theme.dart';
import 'package:core_ui/app_image_theme.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';

enum _SocialType { twitter, linkedIn, facebook }

class SocialButton extends StatelessWidget {
  final _SocialType _type;
  final void Function() onTap;

  factory SocialButton.twitter({
    required void Function() onTap,
  }) =>
      SocialButton._(onTap: onTap, type: _SocialType.twitter);

  factory SocialButton.linkedIn({
    required void Function() onTap,
  }) =>
      SocialButton._(onTap: onTap, type: _SocialType.linkedIn);

  factory SocialButton.facebook({
    required void Function() onTap,
  }) =>
      SocialButton._(onTap: onTap, type: _SocialType.facebook);

  const SocialButton._({
    required this.onTap,
    required _SocialType type,
  }) : _type = type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
      height: Dimensions.SPACE_60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[_mapTypeToIcon(_type)],
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColorTheme.border,
          width: Dimensions.WIDTH_1,
        ),
      ),
    ));
  }

  static Widget _mapTypeToIcon(_SocialType type) {
    switch (type) {
      case _SocialType.twitter:
        return AppImageTheme.twitter;
      case _SocialType.facebook:
        return AppImageTheme.facebook;
      case _SocialType.linkedIn:
        return AppImageTheme.linkedIn;
    }
  }
}
