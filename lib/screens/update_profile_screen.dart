import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager_astad/Controller/auth_controller.dart';
import 'package:task_manager_astad/Data/Models/userModel.dart';
import 'package:task_manager_astad/Data/services/api_caller.dart';

import '../Data/Models/api_response.dart';
import '../utils/urls.dart';
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

  final ImagePicker _imagePicker = ImagePicker();
  XFile? _selectedImage;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    UserModel user = AuthController.userModel!;
    _emailController.text = user.email;
    _firstNameController.text = user.firstName;
    _lastNameController.text = user.lastName;
    _mobileController.text = user.mobile;
  }

  Future<void> pickImage() async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      _selectedImage = image;
      setState(() {});
    }
  }

  Future<void> updateProfile() async {
    Map<String, dynamic> requestBody = {
      'email': _emailController.text,
      'firstName': _firstNameController.text,
      'lastName': _lastNameController.text,
      'mobile': _mobileController.text,
    };

    if (_passwordController.text.isNotEmpty) {
      requestBody['password'] = _passwordController.text;
    }

    setState(() {
      isLoading = true;
    });

    final ApiResponse response = await ApiCaller.PostRequest(
      body: requestBody, URL: Urls.ProfileUpdateURL,
    );

    setState(() {
      isLoading = false;
    });

    if (response.isSuccess) {
      UserModel model = UserModel(
        id: AuthController.userModel!.id,
        email: _emailController.text,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        mobile: _mobileController.text,
        photo: '',
      );

      AuthController.updateUserData(model);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile Updated success..!')),
      );
    } else {
      String errorMsg = 'Profile update failed. Please try again.';
      try {
        if (response.responseData is Map &&
            response.responseData['data'] != null) {
          errorMsg = response.responseData['data'].toString();
        }
      } catch (_) {
        // Keep default error message
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMsg)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TmAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Text(
                  'Update profile',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 25),
                InkWell(
                  onTap: () {
                    pickImage();
                  },
                  child: Container(
                    height: 50,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 80,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: const Text('photo'),
                        ),
                        Expanded(
                          child: Text(
                            _selectedImage?.name.toString() ?? '',
                            maxLines: 1,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(hintText: 'Email'),
                  cursorHeight: 20,
                  cursorWidth: 3,
                   style: TextStyle(fontSize: 16),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter email';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(hintText: 'First name'),
                  cursorHeight: 20,
                  cursorWidth: 3,
                   style: TextStyle(fontSize: 16),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter First name';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(hintText: 'Last name'),
                  cursorHeight: 20,
                  cursorWidth: 3,
                   style: TextStyle(fontSize: 16),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Last name';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _mobileController,
                  decoration: InputDecoration(hintText: 'Mobile'),
                  cursorHeight: 20,
                  cursorWidth: 3,
                   style: TextStyle(fontSize: 16),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter phone number';
                    } else if (value.length != 11) {
                      return 'Please enter correct phone number';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'Password'),
                  cursorHeight: 20,
                  cursorWidth: 3,
                   style: TextStyle(fontSize: 16),
                ),
                if (isLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  FilledButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        updateProfile();
                      }
                    },
                    child: Icon(Icons.arrow_circle_right_outlined),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
