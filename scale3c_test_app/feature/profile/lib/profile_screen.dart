
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart' hide CircleAvatar;
import 'package:profile/widget/profile_tile.dart';

class ProfileScreen extends StatelessWidget {
  // todo hardcoded mock
  final Profile _profile = Profile(
      id: '123123',
      name: 'Username',
      cityName: 'New York',
      phoneNumber: '+3788888888',
      email: 'user@gmail.com',
      numberOfCompletedProjects: 248);

  static const String _notAvailable = 'N/A';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        onMenuTap: () {},
        onLeadingTap: () => Navigator.of(context).pop(),
      ),
      backgroundColor: AppColorTheme.backgroundMain,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: Dimensions.SPACE_30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: Dimensions.SPACE_50),
                  CircleAvatar(imageUrl: null),
                  const SizedBox(height: Dimensions.SPACE_16),
                  Text(
                    _profile.name ?? _notAvailable,
                    style: AppTextTheme.profileName,
                  ),
                  const SizedBox(height: Dimensions.SPACE_8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        _profile.cityName ?? _notAvailable,
                        style: AppTextTheme.body,
                      ),
                      const SizedBox(width: Dimensions.SPACE_8),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColorTheme.dot,
                        ),
                        height: 5,
                        width: 5,
                      ),
                      const SizedBox(width: Dimensions.SPACE_8),
                      Text(
                        'ID: ${_profile.id}',
                        style: AppTextTheme.body,
                      ),
                    ],
                  ),
                  const SizedBox(height: Dimensions.SPACE_16),
                  Text('Edit', style: AppTextTheme.orangeClickableText),
                  const SizedBox(height: Dimensions.SPACE_30),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          child: AppTextButton(
                              onTap: () {}, buttonText: 'About Me')),
                      const SizedBox(width: Dimensions.SPACE_16),
                      Expanded(
                          child: AccentTextButton(
                              onTap: () {}, buttonText: 'Log Out')),
                    ],
                  ),
                  const SizedBox(height: Dimensions.SPACE_40),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.SPACE_30,
                  vertical: Dimensions.SPACE_40),
              color: AppColorTheme.dark,
              child: Column(
                children: <Widget>[
                  ProfileTile(
                      valueText: _profile.phoneNumber,
                      keyText: 'Phone number',
                      icon: AppImageTheme.phone),
                  const SizedBox(height: Dimensions.SPACE_16),
                  ProfileTile(
                    valueText: _profile.email,
                    keyText: 'Email',
                    icon: AppImageTheme.mail,
                  ),
                  const SizedBox(height: Dimensions.SPACE_16),
                  ProfileTile(
                    valueText: _profile.numberOfCompletedProjects?.toString(),
                    keyText: 'Completed projects',
                    icon: AppImageTheme.circle,
                  ),
                  const SizedBox(height: Dimensions.SPACE_16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
