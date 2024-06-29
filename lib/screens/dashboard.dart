import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:venue/screens/about.dart';
import 'package:venue/screens/contact.dart';
import 'package:venue/screens/details.dart';
import 'package:venue/screens/homescreen.dart';
import 'package:venue/screens/profilescreen.dart';
import 'package:venue/screens/search.dart';
import 'package:venue/screens/settings.dart';
import '../widgets/styles.dart';

import '../models/weddingmodel.dart';

class TabNavigation extends StatefulWidget {
  @override
  State<TabNavigation> createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          // title: Text('Tab Navigation'),
          title: Text("Dashboard"),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.search),
                text: 'Search',
              ),
              // Tab(
              //   icon: Icon(Icons.person),
              //   text: 'Profile',
              // ),
              Tab(
                icon: Icon(Icons.contact_mail),
                text: 'Contack',
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: 'Settings',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomePage(),
            SearchTab(),
// SettingsItem(),
            // SettingsItem(icons: icons, title: title),
            // HomeTab(),
            // UserProfilePage(user: user),
            // AboutUsScreen(),
            Contact(),
            Settings(user: user,),

            // SearchTab(),
            // ProfileTab(),
          ],
        ),
      ),
    );
  }
}

// class SearchTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Search Tab Content'),
//     );
//   }
// }

// class SearchTab extends StatefulWidget {
//   @override
//   _SearchTabState createState() => _SearchTabState();
// }

// class _SearchTabState extends State<SearchTab> {
//   List<String> data = [
//     'Item 1',
//     'Item 2',
//     'Item 3',
//     'Item 4',
//     'Item 5',
//   ];
//   List<String> filteredData = [];

//   @override
//   void initState() {
//     super.initState();
//     filteredData = data;
//   }

//   void search(String query) {
//     if (query.isEmpty) {
//       setState(() {
//         filteredData = data;
//       });
//     } else {
//       setState(() {
//         filteredData = data
//             .where((item) => item.toLowerCase().contains(query.toLowerCase()))
//             .toList();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.all(16.0),
//           child: TextField(
//             onChanged: (value) => search(value),
//             decoration: InputDecoration(
//               labelText: 'Search',
//               prefixIcon: Icon(Icons.search),
//               border: OutlineInputBorder(),
//             ),
//           ),
//         ),
//         Expanded(
//           child: ListView.builder(
//             itemCount: filteredData.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(filteredData[index]),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
