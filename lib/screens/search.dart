import 'package:flutter/material.dart';
import 'package:venue/screens/details.dart';

import '../models/weddingmodel.dart';

class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  List<dynamic> data = [];
  List<dynamic> filteredData = [];

  @override
  void initState() {
    super.initState();
    // Combine the weddings and birthdays lists into one data list
    data.addAll(weddings);
    data.addAll(birthdays);
    data.addAll(conferences);
    data.addAll(multipurposes);
  }

  void search(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredData.clear();
      });
    } else {
      setState(() {
        filteredData = data
            .where(
                (item) => item.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            onChanged: (value) => search(value),
            decoration: InputDecoration(
              labelText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        if (filteredData.isNotEmpty)
          Expanded(
            child: ListView.builder(
              itemCount: filteredData.length,
              itemBuilder: (context, index) {
                if (filteredData[index] is Weddings) {
                  // Display wedding item
                  Weddings wedding = filteredData[index];
                  return ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text(wedding.name),
                    subtitle: Text(wedding.location),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsView(
                              wedding.name,
                              wedding.location,
                              wedding.imgUrl,
                              wedding.phone,
                              wedding.description,
                              wedding.price),
                        ),
                      );

                      // navigateToVenueDetails(wedding);
                    },
                  );
                } else if (filteredData[index] is Birthdays) {
                  // Display birthday item
                  Birthdays birthday = filteredData[index];
                  return ListTile(
                    leading: Icon(Icons.cake),
                    title: Text(birthday.name),
                    subtitle: Text(birthday.location),
                    onTap: () {
                      // ProductDetailsView(name, location, imgUrl, phone, image)
                    },
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ),
      ],
    );
  }

  void navigateToVenueDetails(Weddings venue) {
    // Implement the navigation logic to the detailed screen for weddings
  }

  void navigateToBirthdayDetails(Birthdays birthday) {
    // Implement the navigation logic to the detailed screen for birthdays
  }
}
