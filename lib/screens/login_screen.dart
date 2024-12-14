import 'package:flutter/material.dart';
import 'package:hacker_kernel/backend/api_calls.dart';
import 'package:hacker_kernel/constants/color.dart';
import 'package:hacker_kernel/screens/home_screen.dart';
import 'package:hacker_kernel/widgets/password_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 20,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        "assets/login.png",
                        height: MediaQuery.sizeOf(context).height * 0.3,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: onSecondary,
                    ),
                  ),
                  _buildEmailTextFormField(),
                  PasswordTextField(
                      controller: passwordController,
                      primaryColor: primaryColor),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forget password?",
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        ApiCalls apiCalls = ApiCalls();
                        bool isSuccessful = await apiCalls.login(
                            email: emailController.text,
                            password: passwordController.text,
                            context: context);
                        if (context.mounted) {
                          isSuccessful
                              ? Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                )
                              : null;
                        }
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  _buildOrDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("New to Logistics?"),
                      TextButton(
                        onPressed: () {},
                        child: Text("Register"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _buildEmailTextFormField() {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        hintText: "Email ID",
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontSize: 18,
        ),
        prefixIconColor: Colors.grey.shade500,
        prefixIcon: Icon(Icons.alternate_email_rounded),
        // Underline border styles
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  Widget _buildOrDivider() {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey.shade400,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "OR",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade600,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey.shade400,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
