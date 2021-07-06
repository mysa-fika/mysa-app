import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysa/calendar.dart';
import 'package:mysa/modal_bottom_sheet.dart';
import 'package:mysa/showup.dart';
import 'package:mysa/signup.dart';
import 'package:mysa/welcome_screen.dart';

import 'colors.dart';
import 'home.dart';

class Goals extends StatefulWidget {
  Goals({Key? key}) : super();

  @override
  _GoalsState createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  _GoalsState({Key? key}) : super();

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 2;

    void _onItemTapped(int index) {
      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home(uid: "")),
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Calendar()),
          );
          break;
        default:
      }
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Goals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          height: 6,
                          width: 240,
                          child: LinearProgressIndicator(
                            backgroundColor: mysa_secondary.withOpacity(0.3),
                            valueColor:
                                AlwaysStoppedAnimation<Color>(mysa_secondary),
                            value: 0.66,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'My Challenge',
                    style: TextStyle(
                      color: mysa_contrast,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Managing Stress in Uncertain Times',
                    style: TextStyle(
                      color: mysa_primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'Part 6: Prioritize Self-Care',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'You will focus on your overall well-being, starting with taking a few initial steps towards self-care despite the anxiety and worry you might feel.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 10,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.emoji_food_beverage,
                        size: 40,
                        color: mysa_contrast,
                      ),
                      title: const Text(
                        'Savor',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SizedBox(
                                height: 6,
                                width: 300,
                                child: LinearProgressIndicator(
                                  backgroundColor:
                                      mysa_secondary.withOpacity(0.3),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      mysa_secondary),
                                  value: 0.4,
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
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 10,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.star,
                        size: 40,
                        color: mysa_contrast,
                      ),
                      title: const Text(
                        'Thank',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SizedBox(
                                height: 6,
                                width: 300,
                                child: LinearProgressIndicator(
                                  backgroundColor:
                                      mysa_secondary.withOpacity(0.3),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      mysa_secondary),
                                  value: 0.6,
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
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 10,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.card_giftcard,
                          size: 40,
                          color: mysa_contrast,
                        ),
                        title: const Text(
                          'Give',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: SizedBox(
                                  height: 6,
                                  width: 300,
                                  child: LinearProgressIndicator(
                                    backgroundColor:
                                        mysa_secondary.withOpacity(0.3),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        mysa_secondary),
                                    value: 0.2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 10,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.nature_people,
                        size: 40,
                        color: mysa_contrast,
                      ),
                      title: const Text(
                        'Aspire',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SizedBox(
                                height: 6,
                                width: 300,
                                child: LinearProgressIndicator(
                                  backgroundColor:
                                      mysa_secondary.withOpacity(0.3),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      mysa_secondary),
                                  value: 0.3,
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
              SizedBox(
                height: 50,
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: SizedBox(
                    height: 40,
                    width: 300,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            mysa_secondary.withOpacity(0.8)),
                      ),
                      onPressed: () {},
                      child: Text(
                        'See My Stats',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
