import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysa/colors.dart';
import 'package:mysa/signup.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Flutter Gradient Example'),
      // ),
      body: Center(
        child: new Container(
          // height: 800.0,
          // width: 800.0,
          decoration: BoxDecoration(
              // shape: BoxShape.rectangle,
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              mysa_secondary.withOpacity(0.2),
              mysa_primary.withOpacity(0.2),
            ],
          )),
          // child: new Container(
          //     height: 300.0,
          //     width: 300.0,
          //     decoration: BoxDecoration(
          //         shape: BoxShape.rectangle, color: Colors.transparent),
          //     child: Image.asset(
          //       'assets/images/mysa.png',
          //     )),
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/mysa.png',
                scale: 0.3,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(mysa_secondary),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                child: Text('Sign Up'),
              )
            ],
          ),
          // child: Center(
          //   child: Text(
          //     'Mysa.',
          //     style: TextStyle(
          //       fontSize: 48.0,
          //       fontWeight: FontWeight.bold,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
