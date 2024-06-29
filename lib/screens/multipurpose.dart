import 'package:flutter/material.dart';

import '../models/weddingmodel.dart';
import 'details.dart';



class MultipurposeVenue extends StatefulWidget {
  const MultipurposeVenue({super.key});

  @override
  State<MultipurposeVenue> createState() => _MultipurposeVenueState();
}

class _MultipurposeVenueState extends State<MultipurposeVenue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Multipurpose") ),
      body:SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                child: Column(
                  children: multipurposes.map((wed) {
                    return GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Card(
                          elevation: 15,
                          child: Row(
                            children: <Widget>[
                              Container(
                                  height: 80,
                                  width: 80,
                                  margin: EdgeInsets.symmetric(
                                    vertical: 1,
                                    horizontal: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    // border: Border.all(
                                    //   color: Colors.purple,
                                    //   width: 2,
                                    // ),
                                  ),
                                  padding: EdgeInsets.all(1),
                                  child: Image.asset(wed.imgUrl)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    wed.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    wed.location,
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>ProductDetailsView(wed.name, wed.location, wed.imgUrl,wed.phone,wed.description,wed.price)
                                // DetailPage(wed.name, wed.location, wed.imgUrl),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
