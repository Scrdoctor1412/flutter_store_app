import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_store_app/core/gen/assets.gen.dart';
import 'package:flutter_store_app/core/utils/show_snackbar.dart';
import 'package:flutter_store_app/navigation/app_router.dart';
import 'package:flutter_store_app/ui/authentication/bloc/auth_bloc.dart';
import 'package:flutter_store_app/ui/authentication/widgets/auth_field.dart';
import 'package:flutter_store_app/ui/authentication/widgets/login_button.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/registerScreen';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  void onSignUp() {
    context.read<AuthBloc>().add(
      AuthSignUp(
        email: emailController.text,
        password: passwordController.text,
        fullName: nameController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          showSnackBar(context, state.message);
        } else if (state is AuthSuccess) {
          showSnackBar(context, "Logged in successfully");
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create Your account',
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
                    //Email field
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
                          return 'enter your email';
                        }
                        return null;
                      },
                      labelText: 'Enter your email',
                      controller: emailController,
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
                    //Name field
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Full Name',
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
                          return 'enter your full name';
                        }
                        return null;
                      },
                      labelText: 'Enter your full name',
                      controller: nameController,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(
                          10.0,
                        ),
                        child: Image.asset(
                          Assets.icons.userJpeg.path,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Password field
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
                          return 'enter your password';
                        }
                        return null;
                      },
                      labelText: 'Enter your password',
                      controller: passwordController,
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
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return AuthCustomButtonWidget(
                          labelText: 'Sign Up',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              // print('validated');
                              // print(emailController.text);
                              onSignUp();
                            }
                          },
                          isLoading: state is AuthLoading ? true : false,
                        );
                      },
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
                            context.go(RoutePaths.login);
                          },
                          child: Text(
                            'Sign in',
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
      ),
    );
  }
}
