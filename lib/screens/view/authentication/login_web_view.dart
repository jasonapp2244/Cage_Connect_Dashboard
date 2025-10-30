import 'package:cageconnectdashboard/routes/apppages.dart';
import 'package:cageconnectdashboard/screens/responsive/responsive.dart';
import 'package:cageconnectdashboard/utils/colors.dart';
import 'package:cageconnectdashboard/widgets/custom_button.dart';
import 'package:cageconnectdashboard/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginWebView extends StatelessWidget {
  const LoginWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLeftImage(),
          Expanded(child: Center(child: _buildLoginForm(context))),
        ],
      ),
    );
  }

  // ==================================
  // 🔹 1. Left-side Image Section
  // ==================================
  Widget _buildLeftImage() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/images/login.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }

  // ==================================
  // 🔹 2. Right-side Login Form
  // ==================================
  Widget _buildLoginForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 60),
      height: 600,
      decoration: BoxDecoration(
        color: Color(0xffF7F7F7),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLogo(),
          const SizedBox(height: 20),
          _buildWelcomeText(context),
          const SizedBox(height: 20),
          _buildEmailField(),
          const SizedBox(height: 20),
          _buildPasswordField(),
          _buildRememberAndForgot(),
          const SizedBox(height: 20),
          _buildLoginButton(context),
        ],
      ),
    );
  }

  // ==================================
  // 🔹 3. Logo Widget
  // ==================================
  Widget _buildLogo() {
    return Image.asset('assets/icons/cage.png', height: 60);
  }

  // ==================================
  // 🔹 4. Welcome Texts
  // ==================================
  Widget _buildWelcomeText(BuildContext context) {
    var responsive = Adaptive(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back',
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: responsive.fontSize(40),
            fontFamily: 'Clash Display',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 6),
        Text(
          "We're glad to see you again. Let's get you back to work!",
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: responsive.fontSize(14),
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            letterSpacing: -0.42,
          ),
        ),
      ],
    );
  }

  // ==================================
  // 🔹 5. Email Field
  // ==================================
  Widget _buildEmailField() {
    return const CustomTextField(
      hintText: 'Enter Your Email',
      prefixIcon: Icons.email_outlined,
    );
  }

  // ==================================
  // 🔹 6. Password Field
  // ==================================
  Widget _buildPasswordField() {
    return const CustomTextField(
      hintText: 'Enter Your Password',
      prefixIcon: Icons.lock_outline,
    );
  }

  // ==================================
  // 🔹 7. Remember Me + Forgot Password Row
  // ==================================
  Widget _buildRememberAndForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              fillColor: WidgetStateProperty.all(AppColors.primaryColor),
              checkColor: AppColors.bgColor,
              value: true,
              onChanged: (v) {},
            ),
            const Text(
              'Remember me',
              style: TextStyle(color: AppColors.textColor),
            ),
          ],
        ),
        const Text(
          'Forget Password?',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // ==================================
  // 🔹 8. Login Button
  // ==================================
  Widget _buildLoginButton(BuildContext context) {
    return CustomButton(
      backgroundColor: AppColors.primaryColor,
      text: 'Login',
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.home);
      },
    );
  }
}
