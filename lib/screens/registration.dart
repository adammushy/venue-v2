import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/AuthenticationService.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  File? _selectedImage;
  final AuthenticationService _auth = AuthenticationService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _selectImage() async {
    File? imageFile = await _auth.pickImage();
    if (imageFile != null) {
      setState(() {
        _selectedImage = imageFile;
      });
    }
  }

  void _createUser() async {
    if (_formKey.currentState!.validate()) {
      dynamic result = await _auth.createNewUser(
        _nameController.text,
        _phoneController.text,
        _emailController.text,
        _passwordController.text,
        _selectedImage,
      );
      if (result == null) {
        _showErrorDialog('Email is not valid');
      } else {
        _clearForm();
        Navigator.pop(context);
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _clearForm() {
    _nameController.clear();
    _phoneController.clear();
    _emailController.clear();
    _passwordController.clear();
    setState(() {
      _selectedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Color.fromARGB(255, 252, 113, 103),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Register',
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
                          _buildTextField(_nameController, 'Name'),
                          SizedBox(height: 20),
                          _buildTextField(_phoneController, 'Phone'),
                          SizedBox(height: 20),
                          _buildTextField(_emailController, 'Email'),
                          SizedBox(height: 20),
                          ElevatedButton(
                            child: Text('Select Photo'),
                            onPressed: _selectImage,
                          ),
                          SizedBox(height: 20),
                          _selectedImage != null
                              ? Image.file(
                                  _selectedImage!,
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.cover,
                                )
                              : SizedBox(),
                          SizedBox(height: 20),
                          _buildPasswordField(),
                          SizedBox(height: 20),
                          _buildActionButtons(),
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

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return '$label cannot be empty';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password cannot be empty';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(color: Colors.white),
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: Text(
            'Sign Up',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: _createUser,
        ),
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}





















// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// // import 'package:userprofile_demo/Services/AuthenticationService.dart';
// import '../services/AuthenticationService.dart';

// class RegistrationScreen extends StatefulWidget {
//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }

// class _RegistrationScreenState extends State<RegistrationScreen> {
//   final _key = GlobalKey<FormState>();
//   File? _selectedImage;

//   final AuthenticationService _auth = AuthenticationService();

//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _phoneController = TextEditingController();

//   TextEditingController _emailContoller = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   Future<File?> _pickImage() async {
//     final ImagePicker _picker = ImagePicker();
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       return File(image.path);
//     }
//     return null;
//   }

//   void _selectImage() async {
//     File? imageFile = await _pickImage();
//     if (imageFile != null) {
//       setState(() {
//         _selectedImage = imageFile;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             // color: Color.fromARGB(255, 140, 13, 13),
//             color: Color.fromARGB(255, 252, 113, 103),

//             child: Center(
//               child: Form(
//                 key: _key,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Register',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 30,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(32.0),
//                       child: Column(
//                         children: [
//                           TextFormField(
//                             controller: _nameController,
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Name cannot be empty';
//                               } else
//                                 return null;
//                             },
//                             decoration: InputDecoration(
//                                 labelText: 'Name',
//                                 labelStyle: TextStyle(
//                                   color: Colors.white,
//                                 )),
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           SizedBox(height: 20),
//                           TextFormField(
//                             controller: _phoneController,
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Phone cannot be empty';
//                               } else
//                                 return null;
//                             },
//                             decoration: InputDecoration(
//                                 labelText: 'Phone',
//                                 labelStyle: TextStyle(color: Colors.white)),
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           SizedBox(height: 20),
//                           TextFormField(
//                             controller: _emailContoller,
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Email cannot be empty';
//                               } else
//                                 return null;
//                             },
//                             decoration: InputDecoration(
//                                 labelText: 'Email',
//                                 labelStyle: TextStyle(color: Colors.white)),
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           SizedBox(height: 20),
//                           ElevatedButton(
//                             child: Text('Select Photo'),
//                             onPressed: _selectImage,
//                           ),
//                           SizedBox(height: 20),
//                           _selectedImage != null
//                               ? Image.file(
//                                   _selectedImage!,
//                                   height: 150,
//                                   width: 150,
//                                   fit: BoxFit.cover,
//                                 )
//                               : SizedBox(),
//                           SizedBox(height: 20),
//                           TextFormField(
//                             controller: _passwordController,
//                             obscureText: true,
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Password cannot be empty';
//                               } else
//                                 return null;
//                             },
//                             decoration: InputDecoration(
//                                 labelText: 'Password',
//                                 labelStyle: TextStyle(color: Colors.white)),
//                             style: TextStyle(
//                               color: Colors.white,
//                             ),
//                           ),
//                           SizedBox(height: 20),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               ElevatedButton(
//                                 style: ButtonStyle(
//                                     backgroundColor:
//                                         MaterialStatePropertyAll(Colors.white)),
//                                 child: Text(
//                                   'Sign Up',
//                                   style: TextStyle(color: Colors.black),
//                                 ),
//                                 onPressed: () {
//                                   if (_key.currentState!.validate()) {
//                                     createUser();
//                                   }
//                                 },
//                                 // color: Colors.white,
//                               ),
//                               ElevatedButton(
//                                 child: Text('Cancel'),
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 // color: Colors.white,
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }


//   void createUser() async {
//     if (_key.currentState!.validate()) {
//       dynamic result = await _auth.createNewUser(
//         _nameController.text,
//         _phoneController.text,
//         _emailContoller.text,
//         _passwordController.text,
//         _selectedImage, // Pass the selected image to the createUser method
//       );
//       print('Result ${result}');
//       ;

//       if (result == null) {
//         print('Email is not valid');
//       } else {
//         print(result.toString());
//         _nameController.clear();
//         _phoneController.clear();
//         _emailContoller.clear();
//         _selectedImage = null; // Clear the selected image

//         _passwordController.clear();
//         Navigator.pop(context);
//       }
//     }
//   }
// }
