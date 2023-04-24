// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/login_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final ValueNotifier<bool> _toggle = ValueNotifier<bool>(false);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final login = Provider.of<LoginProvider>(context);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100))),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              Consumer<LoginProvider>(builder: (context, value, child) {
                return TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email_outlined),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 194, 189, 189),
                              width: 1),
                          borderRadius: BorderRadius.circular(8)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 194, 189, 189),
                              width: 1),
                          borderRadius: BorderRadius.circular(8))),
                );
              }),
              const SizedBox(
                height: 15,
              ),
              Consumer<LoginProvider>(builder: (context, value, child) {
                return TextFormField(
                  controller: passwordController,
                  obscureText: value.isHidden,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outlined),
                      suffixIcon: InkWell(
                        onTap: () {
                          value.isVeiwPassword();
                        },
                        child: Icon(value.isHidden
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 194, 189, 189),
                              width: 1),
                          borderRadius: BorderRadius.circular(8)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 194, 189, 189),
                              width: 1),
                          borderRadius: BorderRadius.circular(8))),
                );
              }),
              const SizedBox(
                height: 20,
              ),
              Consumer<LoginProvider>(builder: (context, value, child) {
                return InkWell(
                    onTap: () {
                      value.getdata(emailController.text.toString(),
                          passwordController.text.toString());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(255, 39, 38, 38),
                                  blurRadius: 2,
                                  offset: Offset(1, 2))
                            ],
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(14)),
                        child: Center(
                          child: value.loading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                    ));
              })
            ],
          )),
    );
  }
}
