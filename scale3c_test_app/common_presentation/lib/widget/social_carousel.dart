import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';

class SocialCarousel extends StatelessWidget {
  final void Function() onTwitterTap;
  final void Function() onFacebookTap;
  final void Function() onLinkedInTap;

  const SocialCarousel({
    required this.onFacebookTap,
    required this.onLinkedInTap,
    required this.onTwitterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(child: SocialButton.facebook(onTap: onFacebookTap)),
        const SizedBox(width: Dimensions.SPACE_8),
        Expanded(child: SocialButton.twitter(onTap: onTwitterTap)),
        const SizedBox(width: Dimensions.SPACE_8),
        Expanded(child: SocialButton.linkedIn(onTap: onLinkedInTap)),
      ],
    );
  }
}
