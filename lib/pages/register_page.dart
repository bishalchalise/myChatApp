import 'package:flutter/material.dart';
import 'package:mychat/components/my_button.dart';
import 'package:mychat/components/my_text_field.dart';
import 'package:mychat/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    void signUp() async {
      if (passwordController.text != confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Password don't match"),
          ),
        );
        return;
      }

      final authService = Provider.of<AuthService>(context, listen: false);

      try {
        await authService.signUpWithEmail(
            emailController.text, passwordController.text);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
            ),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                Icon(
                  Icons.message,
                  size: 100,
                  color: Colors.grey[800],
                ),
                const SizedBox(
                  height: 50.0,
                ),
                const Text(
                  "Let's Create a account for you",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                MyTextField(
                  controller: emailController,
                  obscureText: false,
                  hintText: "Email",
                ),
                const SizedBox(
                  height: 10.0,
                ),
                MyTextField(
                  controller: passwordController,
                  obscureText: true,
                  hintText: "Password",
                ),
                const SizedBox(
                  height: 10.0,
                ),
                MyTextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  hintText: "Confirm Password",
                ),
                const SizedBox(
                  height: 50.0,
                ),
                MyButton(
                  onTap: signUp,
                  text: "Register",
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already a member?",
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Login",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
