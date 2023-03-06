import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class MainAppBar extends AppBar {
  final void Function() onMenuTap;

  final String? titleText;
  final void Function()? onLeadingTap;

  MainAppBar({
    required this.onMenuTap,
    this.titleText,
    this.onLeadingTap,
  }) : super(
          elevation: Dimensions.ZERO,
          centerTitle: true,
          backgroundColor: AppColorTheme.backgroundMain,
          automaticallyImplyLeading: false,
          title: titleText != null
              ? Text(titleText, style: AppTextTheme.title)
              : null,
          leading: onLeadingTap != null
              ? GestureDetector(
                  onTap: onLeadingTap,
                  child: Transform.scale(
                    child: AppImageTheme.back,
                    scale: 0.35,
                  ),
                )
              : null,
          actions: <Widget>[
            GestureDetector(
              onTap: onMenuTap,
              child: AppImageTheme.menu,
            ),
            const SizedBox(width: Dimensions.SPACE_30),
          ],
        );
}
