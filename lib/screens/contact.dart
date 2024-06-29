import 'package:flutter/material.dart';
import 'package:social_media_flutter/social_media_flutter.dart';

import '../models/weddingmodel.dart';
import 'details.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SocialWidget(
          placeholderText: 'Christina_', //text visible to viewers
          iconData:
              SocialIconsFlutter.instagram, //use the respective social logo
          iconColor: Colors.pink, //(optional, default - grey)
          link: 'https://www.instagram.com/chriva13_/', //provide the link
          placeholderStyle: TextStyle(
              color: Colors.black, fontSize: 20), //placeholder text style
        ),
        SocialWidget(
          placeholderText: 'akshitmadan_', //text visible to viewers
          iconData:
              SocialIconsFlutter.facebook, //use the respective social logo
          iconColor: Colors.blue, //(optional, default - grey)
          link: 'https://www.instagram.com/akshitmadan_/', //provide the link
          placeholderStyle: TextStyle(
              color: Colors.black, fontSize: 20), //placeholder text style
        ),
        SocialWidget(
          placeholderText: 'CHRISTINA JOSEPH_', //text visible to viewers
          iconData:
              SocialIconsFlutter.youtube, //use the respective social logo
          iconColor: Colors.pink, //(optional, default - grey)
          link: 'https://www.youTube.com/CHRISTINA_JOSEPH_/', //provide the link
          placeholderStyle: TextStyle(
              color: Colors.black, fontSize: 20), //placeholder text style
        ),
      ]),
    );
  }
}
