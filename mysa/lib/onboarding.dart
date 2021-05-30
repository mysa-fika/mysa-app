import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysa/welcome_screen.dart';

import 'colors.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  static var current_step = 1;
  static var points = 0;
  final double step = 0.125;

  var questions = [
    "I experience little interest or pleasure in doing things.",
    "I am feeling down, depressed, or hopeless.",
    "I am having trouble falling or staying asleep, or sleeping too much.",
    "I am feeling tired or having little energy.",
    "I have poor appetite or I am overeating.",
    "I am feeling bad about myself - that I am a failure or have let myself or my family down?",
    "I am having trouble concentrating on things, such as reading the newspaper or watching television.",
    "I am moving or speaking so slowly that other people could have noticed. Or so fidgety or restless that I have been moving a lot more than usual.",
    "I am having thoughts that I would be better off dead, or thoughts of hurting myself in some way."
  ];

  var options = [
    "Several days",
    "More than half of the days",
    "Nearly every day"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 50,
                width: 150,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        mysa_primary.withOpacity(1)),
                  ),
                  onPressed: () {
                    current_step++;
                    setState(() {});
                  },
                  child: Text(
                    'No',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 150,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        mysa_secondary.withOpacity(0.8)),
                  ),
                  onPressed: () {
                    current_step++;
                    setState(() {});
                  },
                  child: Text(
                    'Yes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 55, 0, 0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    iconSize: 24,
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: mysa_contrast,
                      semanticLabel: "Back",
                      size: 24,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Onboarding()),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: 3,
                      width: 240,
                      child: LinearProgressIndicator(
                        backgroundColor: mysa_secondary.withOpacity(0.3),
                        valueColor:
                            AlwaysStoppedAnimation<Color>(mysa_secondary),
                        value: step * current_step,
                      ),
                    ),
                  ),
                  IconButton(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    iconSize: 24,
                    icon: Icon(
                      Icons.help_outline,
                      color: mysa_contrast,
                      semanticLabel: "Help",
                      size: 24,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Onboarding()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Center(
              child: Text(
                questions[current_step - 1],
                style: TextStyle(
                  color: mysa_contrast,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Image.asset(
            'assets/images/$current_step.png',
            scale: 0.3,
          ),
        ],
      ),
    );
  }

  void showOptions() {}
}
