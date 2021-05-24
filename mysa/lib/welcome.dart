import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysa/colors.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Flutter Gradient Example'),
      // ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              mysa_secondary.withOpacity(0.3),
              mysa_primary.withOpacity(0.3),
            ],
          )),
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/mysa.png'),
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
