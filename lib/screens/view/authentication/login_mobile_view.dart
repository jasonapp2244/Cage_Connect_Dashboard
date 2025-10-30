import 'package:cageconnectdashboard/routes/apppages.dart';
import 'package:cageconnectdashboard/screens/responsive/responsive.dart';
import 'package:cageconnectdashboard/utils/colors.dart';
import 'package:cageconnectdashboard/widgets/custom_button.dart';
import 'package:cageconnectdashboard/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginMobileView extends StatelessWidget {
  const LoginMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: _buildLoginContainer(context),
          ),
        ),
      ),
    );
  }

  // ==============================
  // 🔹 1. Login Container
  // ==============================
  Widget _buildLoginContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      constraints: const BoxConstraints(maxWidth: 400),
      decoration: BoxDecoration(
        color: Color(0xffF7F7F7),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.textColor.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLogo(),
          const SizedBox(height: 30),
          _buildWelcomeText(context),
          const SizedBox(height: 24),
          _buildEmailField(),
          const SizedBox(height: 20),
          _buildPasswordField(),
          const SizedBox(height: 8),
          _buildRememberMe(),

          const SizedBox(height: 24),
          _buildLoginButton(context),
        ],
      ),
    );
  }

  // ==============================
  // 🔹 2. Logo
  // ==============================
  Widget _buildLogo() {
    return Image.asset('assets/icons/cage.png', height: 60);
  }

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

  // ==============================
  // 🔹 4. Email Field
  // ==============================
  Widget _buildEmailField() {
    return const CustomTextField(
      hintText: 'Enter Your Email',
      prefixIcon: Icons.email_outlined,
    );
  }

  // ==============================
  // 🔹 5. Password Field
  // ==============================
  Widget _buildPasswordField() {
    return const CustomTextField(
      hintText: 'Enter Your Password',
      prefixIcon: Icons.lock_outline,
    );
  }

  // ==============================
  // 🔹 6. Remember Me Row
  // ==============================
  Widget _buildRememberMe() {
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
          'Forgot Password?',
          style: TextStyle(
            color: Color(0xff060606),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // ==============================
  // 🔹 7. Login Button
  // ==============================
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
