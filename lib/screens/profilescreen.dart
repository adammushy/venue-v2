import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:venue/database/DatabaseManager.dart';
import 'homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/AuthenticationService.dart';

class UserProfilePage extends StatefulWidget {
  User? user = FirebaseAuth.instance.currentUser;
  // User object retrieved from Firebase

  UserProfilePage({required this.user});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late int _currentIndex;
  int selected = 2;

  final AuthenticationService _auth = AuthenticationService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = 2;
    // fetchUserData(widget.uid).then((data) {
    //   setState(() {

    //     userData = data;
    //   });
    // });
    // fetchUserData();
  }

  // fetchUserData() async {
  //   dynamic userdata = await DatabaseManager().fetchUserData(uid);

  //   if ( userdata ==null)
  // }

  void changePage(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => HomePage(),
          ),
        );
      } else if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => HomePage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
              onPressed: () async {
                await _auth.logoutUser().then((result) {
                  Navigator.of(context).pop(true);
                });
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      // body: Padding(
      //   padding: EdgeInsets.all(16.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(
      //         'Name: ${widget.user!.displayName}',
      //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //       ),
      //       SizedBox(height: 16),
      //       Text(
      //         'Email: ${widget.user!.email}',
      //         style: TextStyle(fontSize: 18),
      //       ),
      //       // Add more fields to display other user data
      //     ],
      //   ),
      // ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 84,
                // backgroundImage: AssetImage("assets/images/8868.jpg"),
                backgroundImage: NetworkImage(widget.user!.photoURL.toString() ),
                // child: Image.asset("assets/images/8868.jpg"),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [

            //     Text(" ")
            //   ],
            // ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Name : ${widget.user!.displayName}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            Divider(
              height: 10,
              thickness: 1.0,
            ),
            Text(
              'Email : ${widget.user!.email}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: _currentIndex,
        // onTap: changePage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        // fabLocation: BubbleBottomBarFabLocation.end, //new
        // hasNotch: true, //new
        hasInk: true, //new, gives a cute ink effect
        inkColor: Colors.black12, //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.red,
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.feedback,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.feedback,
                color: Colors.red,
              ),
              title: Text("Feedback")),
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.person_2,
                color: Colors.red,
              ),
              title: Text("Profile")),
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.menu,
                color: Colors.red,
              ),
              title: Text("Menu"))
        ],
      ),
    );
  }
}
