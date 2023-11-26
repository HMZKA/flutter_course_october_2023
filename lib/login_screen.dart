import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_october/cubit/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This is empty";
                        } else if (!(value.contains('@'))) {
                          return "This is not a valid email address";
                        }
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white60,
                          filled: true,
                          prefixIcon: const Icon(Icons.email),
                          hintText: "example@example.com",
                          label: const Text("Email"),
                          border: OutlineInputBorder(
                              //  borderSide: BorderSide(width: 5.0, strokeAlign: 2.2),
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This is empty";
                        }
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.white60,
                          filled: true,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: const Icon(Icons.visibility),
                          hintText: "P@ssw0rd",
                          label: const Text("Password"),
                          border: OutlineInputBorder(
                              //  borderSide: BorderSide(width: 5.0, strokeAlign: 2.2),
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    state is LoginLoadingState
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)))),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                AuthCubit().get(context).login(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: const Text(
                                  "Log in",
                                  textAlign: TextAlign.center,
                                ))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "You don't have account?",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Create one",
                              style: TextStyle(color: Colors.purple[900]),
                            ))
                      ],
                    )
                  ]),
            ),
          ),
        );
      },
    );
  }
}
