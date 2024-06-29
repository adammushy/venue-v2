import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  void makePhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Handle error or show a message that the call couldn't be made
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('About Us'),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //
              Text(
                'Welcome to our Venue Find Booking App!',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Text(
                'We aim to provide a convenient platform for finding and booking venues for various events. Our app offers a wide range of venues to choose from, along with detailed information and booking options.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 24.0),
              Text(
                'Key Features:',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              ListTile(
                leading: Icon(Icons.check),
                title: Text(
                    'Search and browse venues based on location and event type.'),
              ),
              ListTile(
                leading: Icon(Icons.check),
                title: Text(
                    'View detailed venue information, including photos, amenities, and pricing.'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone:+255 652 171 162'),
                onTap: () => makePhoneCall('+255652171162'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
