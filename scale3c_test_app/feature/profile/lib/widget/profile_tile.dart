import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

final Color _dividerColor = AppColorTheme.border.withOpacity(.3);

class ProfileTile extends StatelessWidget {
  final Widget icon;
  final String keyText;
  final String? valueText;

  const ProfileTile({
    required this.valueText,
    required this.keyText,
    required this.icon,
  });

  static const String _notAvailable = 'N/A';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: _dividerColor, width: Dimensions.WIDTH_1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(padding: EdgeInsets.all(Dimensions.SPACE_30), child: icon),
          _VerticalDivider(),
          const SizedBox(width: Dimensions.SPACE_16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(keyText, style: AppTextTheme.key),
              const SizedBox(height: Dimensions.SPACE_4),
              Text(valueText ?? _notAvailable, style: AppTextTheme.value)
            ],
          ),
        ],
      ),
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      padding: EdgeInsets.symmetric(vertical: Dimensions.SPACE_20),
      color: _dividerColor,
    );
  }
}
