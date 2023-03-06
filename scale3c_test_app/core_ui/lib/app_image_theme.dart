import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
export 'package:flutter_svg/flutter_svg.dart';

// todo(dispersik): fix icon issue
// target path: 'packages/core_ui/assets/ic_menu.svg'

class AppImageTheme {
  static Image get pencil => Image.asset(
        'core_ui/assets/pencil.png',
        height: 145,
        width: 100,
      );

  static SvgPicture get back => SvgPicture.asset('core_ui/assets/ic_back.svg');

  static SvgPicture get menu => SvgPicture.asset('core_ui/assets/ic_menu.svg');

  static SvgPicture get twitter =>
      SvgPicture.asset('core_ui/assets/ic_twitter.svg');

  static SvgPicture get facebook =>
      SvgPicture.asset('core_ui/assets/ic_fb.svg');

  static SvgPicture get linkedIn =>
      SvgPicture.asset('core_ui/assets/ic_linkedin.svg');

  static SvgPicture get phone =>
      SvgPicture.asset('core_ui/assets/ic_phone.svg');

  static SvgPicture get mail =>
      SvgPicture.asset('core_ui/assets/ic_letter.svg');

  static SvgPicture get circle =>
      SvgPicture.asset('core_ui/assets/ic_circle.svg');
}
