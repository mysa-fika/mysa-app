import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysa/colors.dart';
import 'package:mysa/showup.dart';
import 'package:mysa/welcome.dart';
import 'package:mysa/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'email_login.dart';
import 'email_signup.dart';
import 'home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUp> {
  final String title = "Sign Up";
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseDatabase dbInstance = FirebaseDatabase.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void registerToFb() {
      firebaseAuth
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((res) {
        res.user!
            .updateProfile(
              displayName: nameController.text,
            )
            .then((r) => {})
            .catchError((err) => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Error"),
                    content: Text(err.message),
                    actions: [
                      TextButton(
                        child: Text("Ok"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                }));
        print(res.user);
        isLoading = false;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home(uid: res.user!.uid)),
        );
      }).catchError((err) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text(err.message),
                actions: [
                  TextButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      });
    }

    return Material(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    mysa_secondary.withOpacity(0.1),
                    mysa_primary.withOpacity(0.6),
                  ],
                ),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(40.0),
                  ),
                  ShowUp(
                    child: SizedBox(
                      height: 80,
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Image.asset(
                          'assets/images/mysa-cropped.png',
                          scale: 0.3,
                        ),
                      ),
                    ),
                    delay: 400,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
                    child: Text(
                      'Let\'s save your progress.',
                      style: TextStyle(
                        color: mysa_secondary,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                            child: TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.4),
                                focusColor: Colors.white,
                                labelText: "User Name",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: mysa_primary,
                                    width: 1,
                                  ),
                                ),
                                labelStyle: TextStyle(
                                  color: mysa_contrast,
                                  fontSize: 16,
                                ),
                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter User Name';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.4),
                                focusColor: Colors.white,
                                labelText: "Email",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: mysa_primary,
                                    width: 1,
                                  ),
                                ),
                                labelStyle: TextStyle(
                                  color: mysa_contrast,
                                  fontSize: 16,
                                ),
                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter an Email Address';
                                } else if (!value.contains('@')) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                            child: TextFormField(
                              controller: ageController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.4),
                                focusColor: Colors.white,
                                labelText: "Age",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: mysa_primary,
                                    width: 1,
                                  ),
                                ),
                                labelStyle: TextStyle(
                                  color: mysa_contrast,
                                  fontSize: 16,
                                ),
                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Age';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                            child: TextFormField(
                              obscureText: true,
                              controller: passwordController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.4),
                                focusColor: Colors.white,
                                labelText: "Password",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: mysa_primary,
                                    width: 1,
                                  ),
                                ),
                                labelStyle: TextStyle(
                                  color: mysa_contrast,
                                  fontSize: 16,
                                ),
                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Password';
                                } else if (value.length < 6) {
                                  return 'Password must be atleast 6 characters!';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: isLoading
                                ? CircularProgressIndicator()
                                : SizedBox(
                                    height: 90,
                                    child: Align(
                                      alignment: FractionalOffset.bottomCenter,
                                      child: SizedBox(
                                        height: 50,
                                        width: 300,
                                        child: TextButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .all<Color>(mysa_secondary
                                                        .withOpacity(0.8)),
                                          ),
                                          onPressed: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              setState(() {
                                                isLoading = true;
                                              });
                                              // await connection.query(
                                              //     "INSERT INTO public.profiles (full_name, birth_date) VALUES (@name:string, @date:string)",
                                              //     substitutionValues: {
                                              //       "name": nameController.value.text,
                                              //       "date": "10.10.10",
                                              //     });
                                              registerToFb();
                                            }
                                          },
                                          child: Text(
                                            'Sign Up',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
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
