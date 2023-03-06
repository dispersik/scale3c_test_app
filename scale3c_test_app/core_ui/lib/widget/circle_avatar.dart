import 'package:core_ui/app_color_theme.dart';
import 'package:flutter/cupertino.dart';

class CircleAvatar extends StatelessWidget {
  final String? imageUrl;

  const CircleAvatar({
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 114,
      height: 114,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(114),
        color: AppColorTheme.accent,
      ),
    );
  }
}
