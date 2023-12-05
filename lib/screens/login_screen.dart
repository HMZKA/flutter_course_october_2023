import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_october/components/components.dart';
import 'package:flutter_course_october/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter_course_october/cubit/auth_cubit/auth_state.dart';
import 'package:flutter_course_october/screens/main_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          state.status
              ? Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => MainScreen(),
                  ),
                  (route) => false)
              : showMessage(msg: "Credintials incorrect", color: Colors.red);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            actions: [
              PopupMenuButton(
                  onSelected: (value) {
                    AuthCubit().get(context).changeLocale(value);
                  },
                  itemBuilder: (context) => const [
                        PopupMenuItem(
                          value: Locale("ar"),
                          child: Text("العربية"),
                        ),
                        PopupMenuItem(
                          value: Locale("en"),
                          child: Text("English"),
                        ),
                      ]
                  //    AppLocalizations.supportedLocales
                  //       .map((e) => PopupMenuItem(
                  //             value: e,
                  //             onTap: () {
                  //               AuthCubit().get(context).changeLocale(e);
                  //             },
                  //             child: Text(e.languageCode),
                  //           ))
                  //       .toList(),
                  )
            ],
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
                          label: Text("${AppLocalizations.of(context)?.email}"),
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
                          label:
                              Text("${AppLocalizations.of(context)?.password}"),
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
                                child: Text(
                                  "${AppLocalizations.of(context)?.login}",
                                  textAlign: TextAlign.center,
                                ))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${AppLocalizations.of(context)?.dontHaveAccount}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "${AppLocalizations.of(context)?.createAccount}",
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
