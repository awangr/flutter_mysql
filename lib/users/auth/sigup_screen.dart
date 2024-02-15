import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:using_db/controller/usersC/usersC.dart';
import 'package:using_db/users/auth/login_screen.dart';

final usersC = Get.put(UsersC());

class SigupScreen extends StatefulWidget {
  const SigupScreen({super.key});

  @override
  State<SigupScreen> createState() => _SigupScreenState();
}

class _SigupScreenState extends State<SigupScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(maxHeight: constraints.maxHeight),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset('asset/images/sigup.jpg',
                          fit: BoxFit.cover),
                    ),
                    SizedBox(height: 50),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white10,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.person),
                                        hintText: 'Username',
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    controller: usersC.usernameC,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Username is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.email),
                                        hintText: 'Email',
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    controller: usersC.emailC,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Email is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  Obx(
                                    () => TextFormField(
                                      style: TextStyle(color: Colors.white),
                                      obscureText: usersC.isVisible.value,
                                      controller: usersC.passC,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Password is required';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.lock),
                                          hintText: 'Password',
                                          suffixIcon: Obx(
                                            () => IconButton(
                                                onPressed: () {
                                                  usersC.isVisible.toggle();
                                                },
                                                icon: usersC.isVisible.value
                                                    ? Icon(Icons.visibility_off)
                                                    : Icon(Icons.visibility)),
                                          ),
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  ElevatedButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          //
                                          usersC.validateEmail();
                                        }
                                        ;
                                      },
                                      child: Text('REGISTER'))
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Sudah memiliki akun?',
                                  style: TextStyle(color: Colors.white),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Get.to(LoginScreen());
                                    },
                                    child: Text('SIG IN'))
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
