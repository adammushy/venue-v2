import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import '../screens/weddings.dart';
// ignore: depend_on_referenced_packages
import 'package:nice_buttons/nice_buttons.dart';
import '../widgets/styles.dart';
import 'package:url_launcher/url_launcher.dart';

// class DetailPage extends StatelessWidget {
//   final name;
//   final location;
//   final imgUrl;
//   const DetailPage(this.name, this.location, this.imgUrl);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       drawer: Drawer(
//         semanticLabel: "Menu",
//         elevation: 2,
//         child: drawContent(),
//         backgroundColor: Color.fromARGB(255, 147, 148, 149),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 50,
//           ),
//           Container(
//             child: Image.asset(imgUrl),
//           ),
//           Text(name),
//           Text(location)
//         ],
//       ),
//     );
//   }

//   Widget drawContent() {
//     return Container(
//       child: Column(
//         children: [
//           SizedBox(
//             height: 100,
//           ),
//           NiceButtons(
//             startColor: primaryColor,
//             endColor: Color.fromARGB(210, 11, 0, 0),
//             progressColor: Color.fromARGB(255, 223, 73, 73),
//             borderColor: Color.fromARGB(47, 235, 57, 57),
//             height: 50,
//             stretch: true,
//             gradientOrientation: GradientOrientation.Horizontal,
//             onTap: (finish) {
//               print('On tap called');
//             },
//             child: Text(
//               'Full Width',
//               style: TextStyle(color: Colors.white, fontSize: 18),
//             ),
//           ),
//           NiceButtons(
//             startColor: primaryColor,
//             endColor: Color.fromARGB(210, 11, 0, 0),
//             progressColor: Color.fromARGB(255, 223, 73, 73),
//             borderColor: Color.fromARGB(47, 235, 57, 57),
//             height: 50,
//             stretch: true,
//             gradientOrientation: GradientOrientation.Horizontal,
//             onTap: (finish) {
//               print('On tap called');
//             },
//             child: Text(
//               'Full Width',
//               style: TextStyle(color: Colors.white, fontSize: 18),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ProductDetailsView extends StatefulWidget {
  final name;
  final location;
  final imgUrl;
  final phone;
  // final List image;
  final description;
  final price;
  ProductDetailsView(
      this.name, this.location, this.imgUrl, this.phone,this.description,this.price);

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  // @override

  makeDirectCall(String number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  void makePhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Handle error or show a message that the call couldn't be made
    }
  }

  void launchCall(String phone) async {
    String url = "tel:" + phone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print(' Could not launch $url');
    }
  }

  // final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    var i;
    return Scaffold(
      backgroundColor: AppColors.kBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.kBgColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Ionicons.chevron_back,
            color: Colors.black,
          ),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Ionicons.bag_outline,
        //       color: Colors.black,
        //     ),
        //   ),
        // ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .35,
            padding: const EdgeInsets.only(bottom: 30),
            width: double.infinity,
            child: Image.asset(
              widget.imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 40, right: 14, left: 14),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   'Chanel',
                        //   style: GoogleFonts.poppins(
                        //     fontSize: 15,
                        //     color: Colors.grey,
                        //   ),
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.name,
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "${widget.price} Tshs.",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(
                          widget.description,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 15),
                        // Text(
                        //   'Similar This',
                        //   style: GoogleFonts.poppins(
                        //     fontSize: 16,
                        //     fontWeight: FontWeight.w600,
                        //   ),
                        // ),
                        const SizedBox(height: 10),
                        // SizedBox(
                        //   height: 110,
                        //   child: ListView.builder(
                        //     scrollDirection: Axis.horizontal,
                        //     itemCount: smProducts.length,
                        //     itemBuilder: (context, index) => Container(
                        //       margin: const EdgeInsets.only(right: 6),
                        //       width: 110,
                        //       height: 110,
                        //       decoration: BoxDecoration(
                        //         color: AppColors.kSmProductBgColor,
                        //         borderRadius: BorderRadius.circular(20),
                        //       ),
                        //       child: Center(
                        //         child: Image(
                        //           height: 70,
                        //           image: AssetImage(smProducts[index].image),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppColors.kGreyColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.kGreyColor),
                ),
                child: IconButton(
                    onPressed: () => makeDirectCall(widget.phone)
                    // _makePhoneCall(widget.phone);

                    ,
                    icon: Icon(Ionicons.call))),
            // SizedBox(width: 20),r
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.kGreyColor),
              ),
              child: IconButton(
                onPressed: () {
                  print("Location fetched");
                },
                // onPressed: () => makeDirectCall(widget.phone),
                // _makePhoneCall(widget.phone);

                icon: Icon(Ionicons.location),
              ),
            ),

            // Expanded(
            //   child: InkWell(
            //     onTap: () {
            //       productController.addToCart();
            //     },
            //     child: Container(
            //       alignment: Alignment.center,
            //       decoration: BoxDecoration(
            //         color: Colors.black,
            //         borderRadius: BorderRadius.circular(15),
            //       ),
            //       child: Obx(
            //         () => productController.isAddLoading.value
            //             ? SizedBox(
            //                 width: 20,
            //                 height: 20,
            //                 child: CircularProgressIndicator(
            //                   color: Colors.white,
            //                   strokeWidth: 3,
            //                 ),
            //               )
            //             : Text(
            //                 '+ Add to Cart',
            //                 style: GoogleFonts.poppins(
            //                   fontSize: 15,
            //                   fontWeight: FontWeight.w500,
            //                   color: Colors.white,
            //                 ),
            //               ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
