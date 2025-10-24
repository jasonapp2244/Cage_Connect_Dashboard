import 'package:cageconnectdashboard/widgets/custom_button.dart';
import 'package:cageconnectdashboard/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginWebView extends StatelessWidget {
  const LoginWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  20,
                ), // 👈 same radius as container
                child: Image.asset(
                  'assets/images/login.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ),

          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              height: 500,
              decoration: BoxDecoration(color: Color(0xffF7F7F7)),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/icons/cage_icon.svg'),
                  SizedBox(height: 20),
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: const Color(0xFF060606),
                      fontSize: 40,
                      fontFamily: 'Clash Display',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "We're glad to see you again. Let's get you back to work!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.42,
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    hintText: 'Enter Your Email',
                    prefixIcon: Icons.email_outlined,
                  ),

                  SizedBox(height: 20),
                  CustomTextField(
                    hintText: 'Enter Your Password',
                    prefixIcon: Icons.lock_outline,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            fillColor: WidgetStateProperty.all(
                              Color(0xffED1C24),
                            ),
                            checkColor: Colors.white,

                            value: true,
                            onChanged: (v) {},
                          ),
                          Text(
                            'Remember me',
                            style: TextStyle(color: Color(0xff060606)),
                          ),
                        ],
                      ),
                      Text(
                        'Forget Passsword',
                        style: TextStyle(
                          color: Color(0xff060606),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    backgroundColor: Color(0xffED1C24),
                    text: 'Login',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
