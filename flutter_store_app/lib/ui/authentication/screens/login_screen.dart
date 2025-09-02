import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_store_app/core/gen/assets.gen.dart';
import 'package:flutter_store_app/navigation/app_router.dart';
import 'package:flutter_store_app/ui/authentication/bloc/auth_bloc.dart';
import 'package:flutter_store_app/ui/authentication/screens/register_screen.dart';
import 'package:flutter_store_app/ui/authentication/widgets/auth_field.dart';
import 'package:flutter_store_app/ui/authentication/widgets/login_button.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/loginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login your account',
                    style: GoogleFonts.getFont(
                      'Lato',
                      color: Color(0xff0d120e),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2,
                      fontSize: 23,
                    ),
                  ),
                  Text(
                    'To explore the world exclusives',
                    style: GoogleFonts.getFont(
                      'Lato',
                      color: Color(0xff0d120e),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2,
                      fontSize: 14,
                    ),
                  ),
                  Image.asset(
                    Assets.images.illustration.path,
                    width: 200,
                    height: 200,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      style: GoogleFonts.getFont(
                        'Nunito Sans',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  AuthField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    labelText: 'Enter your email',
                    controller: _emailController,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(
                        10.0,
                      ),
                      child: Image.asset(
                        Assets.icons.email.path,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: GoogleFonts.getFont(
                        'Nunito Sans',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  AuthField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    labelText: 'Enter your password',
                    controller: _passwordController,
                    obscureText: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(
                        10.0,
                      ),
                      child: Image.asset(
                        Assets.icons.password.path,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    suffixIcon: Icon(Icons.visibility),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AuthCustomButtonWidget(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // context.push(RoutePaths.home);
                        // print("logging in");
                      }
                    },
                    labelText: 'Sign In',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Need an Account?',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          context.push(RoutePaths.register);
                        },
                        child: Text(
                          'Sign up',
                          style: GoogleFonts.roboto(
                            color: Color(0xff103de5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
