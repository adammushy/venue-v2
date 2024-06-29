import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:venue/screens/dashboard.dart';
import 'registration.dart';
import '../services/AuthenticationService.dart';
import 'homescreen.dart';
// import 'package:userprofile_demo/Dashboard.dart';
// import 'package:userprofile_demo/RegistrationScreen.dart';
// import 'package:userprofile_demo/Services/AuthenticationService.dart';

// void main() => runApp(MaterialApp(
//       initialRoute: '/login',
//       routes: {
//         '/login': (context) => LoginScreen(),
//         '/register': (context) => RegistrationScreen(),
//         '/dashboard': (context) => DashboardScreen(),
//       },
//     ));

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();

  final AuthenticationService _auth = AuthenticationService();
  // final AuthenticationService _use

  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color.fromARGB(255, 252, 113, 103),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          TextFormField(
                            controller: _emailContoller,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email cannot be empty';
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(color: Colors.white)),
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password cannot be empty';
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.white)),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                           SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red),),
                                child: Text('Login'),
                                onPressed: () {
                                  if (_key.currentState!.validate()) {
                                    signInUser();
                                  }
                                },
                                // color: Colors.white,
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
      
                          ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),
                            child: Text('Not registerd? Sign up'),
                            onPressed: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  fullscreenDialog: true,
                                  builder: (context) => RegistrationScreen(),
                                ),
                              );
                            },
                            // textColor: Colors.white,
                          ),
                         
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

void signInUser() async {
  // Check network connectivity
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('No Internet Connection'),
        content: Text('Please check your internet connection and try again.'),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
    return;
  }

  // Perform user login
  dynamic authResult = await _auth.loginUser(
    _emailContoller.text,
    _passwordController.text
  );

  if (authResult == null) {
    print('Sign in error. Could not be able to login');
  } else {
    _emailContoller.clear();
    _passwordController.clear();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TabNavigation()),
    );
  }
}

  // void signInUser() async {
  //   dynamic authResult =
  //       await _auth.loginUser(_emailContoller.text, _passwordController.text);
  //   if (authResult == null) {
  //     print('Sign in error. could not be able to login');
      
  //   } else {
  //     _emailContoller.clear();
  //     _passwordController.clear();
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => HomePage()));
  //   }
  // }
}
