import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysa/calendar.dart';
import 'package:mysa/modal_bottom_sheet.dart';
import 'package:mysa/showup.dart';
import 'package:mysa/signup.dart';
import 'package:mysa/welcome_screen.dart';

import 'colors.dart';

//0.125
class Question {
  final int current_step;
  final String question;

  Question(this.current_step, this.question);
}

final q = [
  "I experience little interest or pleasure in doing things.",
  "I'v been feeling down, depressed, or hopeless.",
  "I have trouble falling or staying asleep, or I sleep too much.",
  "I feel tired or have little energy.",
  "I have poor appetite or overeat.",
  "I feel bad about myself — or that I'm a failure or have let myself or my family down.",
  "I have trouble concentrating on things, such as reading the newspaper or watching television.",
  "I move or speak so slowly that other people could have noticed. Or so fidgety or restless that I have been moving a lot more than usual.",
  "I have thoughts that I would be better off dead, or thoughts of hurting myself in some way."
];

final questions = List.generate(9, (index) => Question(index, q[index]));

class Onboarding extends StatefulWidget {
  final int index;
  final int score;

  Onboarding({Key? key, required this.index, required this.score}) : super();

  @override
  _OnboardingState createState() =>
      _OnboardingState(question: questions[index], score: score);
}

class _OnboardingState extends State<Onboarding> {
  final double step = 0.1111;
  final Question question;
  final int score;

  _OnboardingState({Key? key, required this.question, required this.score})
      : super();

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => question.current_step == 8
                              ? SignUp()
                              : Onboarding(
                                  index: question.current_step + 1,
                                  score: score)),
                    );
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
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                // leading: new Icon(Icons.photo),
                                title: new Text('Several days'),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            question.current_step == 8
                                                ? SignUp()
                                                : Onboarding(
                                                    index:
                                                        question.current_step +
                                                            1,
                                                    score: score + 1)),
                                  );
                                },
                              ),
                              ListTile(
                                // leading: new Icon(Icons.music_note),
                                title: new Text('More than half the days'),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            question.current_step == 8
                                                ? SignUp()
                                                : Onboarding(
                                                    index:
                                                        question.current_step +
                                                            1,
                                                    score: score + 2)),
                                  );
                                },
                              ),
                              ListTile(
                                // leading: new Icon(Icons.videocam),
                                title: new Text('Nearly every day'),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            question.current_step == 8
                                                ? SignUp()
                                                : Onboarding(
                                                    index:
                                                        question.current_step +
                                                            1,
                                                    score: score + 3)),
                                  );
                                },
                              ),
                            ],
                          );
                        });
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
                      Navigator.pop(context);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Carousel()),
                      // );
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
                        value: step * question.current_step,
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
                        MaterialPageRoute(
                            builder: (context) => Onboarding(
                                  index: 0,
                                  score: 0,
                                )),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          ShowUp(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Center(
                child: Text(
                  question.question,
                  style: TextStyle(
                    color: mysa_contrast,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            delay: 500,
          ),
          ShowUp(
            child: SizedBox(
              height: 370,
              width: 450,
              child: Image.asset(
                'assets/images/${question.current_step}.png',
                fit: BoxFit.contain,
                // scale: 0.3,
              ),
            ),
            delay: 500,
          )
        ],
      ),
    );
  }

  void showOptions() {}
}
