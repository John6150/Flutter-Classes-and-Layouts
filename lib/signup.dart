import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> signupKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassswordController = TextEditingController();
  bool isHidden = false;

  @override
  Widget build(BuildContext context) {
    print('initializing');

    // Map<String, dynamic> user = {};
    return SafeArea(
      top: false,
      bottom: true,
      child: LayoutBuilder(
        // key: signupKey,
        //     Container(
        //   width: MediaQuery.of(context).size.width,
        //   height: MediaQuery.of(context).size.height,
        // )
        builder: (context, constraints) {
          return Scaffold(
            appBar: AppBar(title: Text('Signup')),
            body: Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              decoration: BoxDecoration(color: Colors.amber),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Container(
                color: Colors.transparent,
                child: Form(
                  key: signupKey,
                  child: Column(
                    children: [
                      Text(
                        'Singup to continue',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.account_circle),
                            // suffixIcon: Icon(Icons.abc),
                            hint: Text('John Doe'),
                            label: Text('Name'),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                width: 3,
                                color: Colors.white,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Sorry, fied can not be empty';
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            // suffixIcon: Icon(Icons.abc),
                            hint: Text('abc@gmail.com'),
                            label: Text('Email'),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                width: 3,
                                color: Colors.white,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Sorry, fied can not be empty';
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 60,
                        child: CustomTextFormField(
                          controller: passwordController,
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 60,
                        child: CustomTextFormField(
                          controller: confirmPassswordController,
                        ),
                      ),
                      SizedBox(height: 30),

                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.black),
                        ),
                        onPressed: () {
                          if (signupKey.currentState!.validate()) {
                            print('Validated'); // Execute an operation
                          } else {
                            print('Sorry, invalid input');
                          }
                        },
                        child: Text(
                          'Signup',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      // TextField(
                      //   valida
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  const CustomTextFormField({super.key, required this.controller});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isHidden = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // keyboardType: TextInputType.emailAddress,
      controller: widget.controller,
      obscureText: isHidden,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: () {
            print('hii');
            setState(() {
              isHidden = !isHidden;
            });
          },
          icon: Icon(isHidden ? Icons.visibility : Icons.visibility_off),
        ),
        hint: Text('*********'),
        label: Text('Password'),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width: 3,
            color: Colors.white,
            style: BorderStyle.solid,
          ),
        ),
      ),
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),

      validator: (value) {
        if (value!.isEmpty) {
          return 'Sorry, fied can not be empty';
        } else if (value.length < 6) {
          // return 'Too short';
        }
      },
    );
  }
}
