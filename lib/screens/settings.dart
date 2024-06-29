import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:venue/screens/about.dart';
import 'package:venue/screens/feedback.dart';
import 'package:venue/screens/profilescreen.dart';
import 'package:venue/services/AuthenticationService.dart';
// import 'package:venue/widgets/therme_notifier.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:provider/provider.dart';

import '../widgets/styles.dart';

class Settings extends StatefulWidget {
  final User? user;
  const Settings({super.key, required this.user});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final AuthenticationService _auth = AuthenticationService();

  get user => null;
  // final AuthenticationService user = AuthenticationService();
  @override
  Widget build(BuildContext context) {
    // final themeNotifier = Provider.of<ThemeNotifier>(context);

    // void toggleDarkMode(bool value) {
    //   themeNotifier.toggleDarkMode(value);
    // }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              // User card
              BigUserCard(
                cardColor: Colors.red,
                userName: "Babacar Ndong",
                userProfilePic: AssetImage("assets/logo.png"),
                cardActionWidget: SettingsItem(
                  icons: Icons.edit,
                  // iconStyle: IconStyle(
                  //   withBackground: true,
                  //   borderRadius: 50,
                  //   backgroundColor: Colors.yellow[600],
                  // ),
                  title: "Modify",
                  subtitle: "Tap to change your data",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserProfilePage(user: user),
                      ),
                    );
                  },
                ),
              ),
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {},
                    icons: CupertinoIcons.pencil_outline,
                    // iconStyle: IconStyle(),
                    title: 'Appearance',
                    subtitle: "Make Ziar'App yours",
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.dark_mode_rounded,
                    // iconStyle: IconStyle(
                    //   iconsColor: Colors.white,
                    //   withBackground: true,
                    //   backgroundColor: Colors.red,
                    // ),
                    title: 'Dark mode',
                    subtitle: "Automatic",

                    trailing: Switch.adaptive(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutUsScreen()));
                    },
                    icons: Icons.info_rounded,
                    // iconStyle: IconStyle(
                    //   backgroundColor: Colors.purple,
                    // ),
                    title: 'About',
                    subtitle: "Learn more about Venue app",
                  ),
                ],
              ),
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FeedbackDialog()));
                    },
                    icons: Icons.feedback,
                    // iconStyle: IconStyle(
                    //   backgroundColor: Colors.purple,
                    // ),
                    title: 'Feedback',
                    subtitle: "Rate us",
                  ),
                ],
              ),
              // You can add a settings title
              SettingsGroup(
                settingsGroupTitle: "Account",
                items: [
                  SettingsItem(
                    onTap: () async {
                      await _auth.logoutUser().then((result) {
                        Navigator.of(context).pop(true);
                      });
                    },
                    icons: Icons.exit_to_app_rounded,
                    title: "Sign Out",
                  ),
                  // SettingsItem(
                  //   onTap: () {},
                  //   icons: CupertinoIcons.delete_solid,
                  //   title: "Delete account",
                  //   titleStyle: TextStyle(
                  //     color: Colors.red,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class SettingsItem extends StatelessWidget {
//   final IconData icons;
//   final IconStyle? iconStyle;
//   final String title;
//   final TextStyle? titleStyle;
//   final String? subtitle;
//   final TextStyle? subtitleStyle;
//   final Widget? trailing;
//   final VoidCallback? onTap;
//   final Color? backgroundColor;

//   SettingsItem(
//       {required this.icons,
//       this.iconStyle,
//       required this.title,
//       this.titleStyle,
//       this.subtitle,
//       this.subtitleStyle,
//       this.backgroundColor,
//       this.trailing,
//       this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(15),
//       child: ListTile(
//         onTap: onTap,
//         leading: (iconStyle != null && iconStyle!.withBackground!)
//             ? Container(
//                 decoration: BoxDecoration(
//                   color: iconStyle!.backgroundColor,
//                   borderRadius: BorderRadius.circular(iconStyle!.borderRadius!),
//                 ),
//                 padding: EdgeInsets.all(5),
//                 child: Icon(
//                   icons:Icons.abc,
//                   size: SettingsScreenUtils.settingsGroupIconSize,
//                   color: iconStyle!.iconsColor,
//                 ),
//               )
//             : Padding(
//                 padding: EdgeInsets.all(5),
//                 child: Icon(
//                   icons,
//                   size: SettingsScreenUtils.settingsGroupIconSize,
//                 ),
//               ),
//         title: Text(
//           title,
//           style: titleStyle ?? TextStyle(fontWeight: FontWeight.bold),
//           maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//         ),
//         subtitle: (subtitle != null)
//             ? Text(
//                 subtitle!,
//                 style: subtitleStyle ?? Theme.of(context).textTheme.bodyMedium!,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               )
//             : null,
//         trailing: (trailing != null) ? trailing : Icon(Icons.navigate_next),
//       ),
//     );
//   }
// }

class IconStyle {
  Color? iconsColor;
  bool? withBackground;
  Color? backgroundColor;
  double? borderRadius;

  IconStyle({
    iconsColor = Colors.white,
    withBackground = true,
    backgroundColor = Colors.blue,
    borderRadius = 8,
  })  : this.iconsColor = iconsColor,
        this.withBackground = withBackground,
        this.backgroundColor = backgroundColor,
        this.borderRadius = double.parse(borderRadius!.toString());
}

class SettingsScreenUtils {
  static double? settingsGroupIconSize;
  static TextStyle? settingsGroupTitleStyle;
}

// import 'package:flutter/material.dart';

class BigUserCard extends StatelessWidget {
  final Color? backgroundColor;
  final Color? settingColor;
  final double? cardRadius;
  final Color? backgroundMotifColor;
  final Widget? cardActionWidget;
  final String? userName;
  final Widget? userMoreInfo;
  final ImageProvider userProfilePic;

  BigUserCard({
    this.backgroundColor,
    this.settingColor,
    this.cardRadius = 30,
    required this.userName,
    this.backgroundMotifColor = Colors.white,
    this.cardActionWidget,
    this.userMoreInfo,
    required this.userProfilePic,
    required MaterialColor cardColor,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    return Container(
      height: mediaQueryHeight / 4,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).cardColor,
        borderRadius:
            BorderRadius.circular(double.parse(cardRadius!.toString())),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: backgroundMotifColor!.withOpacity(.1),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 400,
              backgroundColor: backgroundMotifColor!.withOpacity(.05),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: (cardActionWidget != null)
                  ? MainAxisAlignment.spaceEvenly
                  : MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // User profile
                    Expanded(
                      child: CircleAvatar(
                        radius: mediaQueryHeight / 18,
                        backgroundImage: userProfilePic,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            userName!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: mediaQueryHeight / 30,
                              color: Colors.white,
                            ),
                          ),
                          if (userMoreInfo != null) ...[
                            userMoreInfo!,
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: settingColor ?? Theme.of(context).cardColor,
                  ),
                  child: (cardActionWidget != null)
                      ? cardActionWidget
                      : Container(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
