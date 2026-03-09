import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager_astad/screens/new_login_screen.dart';

import 'package:task_manager_astad/utils/app_colors.dart';
import 'package:task_manager_astad/widgets/screen_background.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<OtpVerification> {
  void _onTapLogIn() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewLoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 150),
              Text('PIN Verification', style: TextTheme.of(context).titleLarge),
              SizedBox(height: 25),
              // TextFormField(decoration: InputDecoration(hintText: 'Email')),
              PinInput(
                length: 4,
                builder: (context, cells) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: cells.map((cell) {
                      return Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: cell.isFocused
                              ? Colors.blue
                              : Colors.grey[200],
                        ),
                        child: Center(
                          child: Text(
                            cell.character ?? '',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
                onCompleted: (pin) => print('PIN: $pin'),
              ),
              SizedBox(height: 10),

              FilledButton(
                onPressed: () {},
                child: Icon(Icons.arrow_circle_right_outlined),
              ),
              SizedBox(height: 35),
              Center(
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Have an account? ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Log In',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = _onTapLogIn,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
