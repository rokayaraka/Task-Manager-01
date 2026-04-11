
import 'package:flutter/material.dart';

import 'package:task_manager_astad/widgets/tm_appbar.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TmAppbar(),
      body:  Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 60),
                      Text('Update Profile', style: TextTheme.of(context).titleLarge),
                      SizedBox(height: 25),
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 25),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(hintText: 'Email'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Valid Email';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(hintText: 'First Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter  First Name';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _lastNameController,
                        decoration: InputDecoration(hintText: 'Last Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Last Name';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _mobileController,
                        decoration: InputDecoration(hintText: 'Mobile'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Valid Phone Number';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(hintText: 'Password'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Valid Password';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      FilledButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                
                                }
                              },
                              child: Icon(Icons.arrow_circle_right_outlined),
                            ),
                      SizedBox(height: 35),
                      // Center(
                      //   child: Column(
                      //     children: [
                      //       RichText(
                      //         text: TextSpan(
                      //           text: "Have an account? ",
                      //           style: TextStyle(
                      //             fontWeight: FontWeight.w600,
                      //             color: Colors.black,
                      //           ),
                      //           children: [
                      //             TextSpan(
                      //               text: 'Log In',
                      //               style: TextStyle(
                      //                 color: AppColors.primaryColor,
                      //                 fontWeight: FontWeight.bold,
                      //               ),
                                   
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
        ),
      ),
            

    );
  }
}