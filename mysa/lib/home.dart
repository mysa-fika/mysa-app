import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mysa/calendar.dart';
import 'colors.dart';

class Home extends StatelessWidget {
  Home({required this.uid});
  final String uid;
  final String title = "Home";

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    void _onItemTapped(int index) {
      switch (index) {
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
          // elevation: 0,
          // unselectedIconTheme: IconThemeData(
          //   color: Colors.grey,
          // ),
          // unselectedItemColor: Colors.grey,
          // selectedFontSize: 16,
          // selectedIconTheme: IconThemeData(
          //   color: mysa_secondary,
          //   size: 30,
          // ),
          // selectedItemColor: mysa_secondary,
          // selectedLabelStyle: TextStyle(
          //   fontWeight: FontWeight.bold,
          // ),
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
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.format_list_bulleted),
            //   label: 'Goals',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'More',
            ),
          ],
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 50, 90, 10),
                  child: Text(
                    'Today\'s Selection',
                    style: TextStyle(
                      color: mysa_contrast,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    disableCenter: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.5,
                    height: 250,
                  ),
                  items: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 10,
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.all(5)),
                          Container(
                            width: 180,
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/one.jpg"),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.headset,
                              size: 40,
                              color: mysa_contrast,
                            ),
                            title: const Text(
                              'Morning Mindfullness',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              'Meditation',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.6)),
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
                          Padding(padding: EdgeInsets.all(5)),
                          Container(
                            width: 180,
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/two.jpg"),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.video_collection,
                              size: 40,
                              color: mysa_contrast,
                            ),
                            title: const Text(
                              'Self-confidence',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              'Exercise',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.6)),
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
                          Padding(padding: EdgeInsets.all(5)),
                          Container(
                            width: 180,
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/three.jpg"),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.headset,
                              size: 40,
                              color: mysa_contrast,
                            ),
                            title: const Text(
                              'Happy Naps',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              'Sleep',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Explore',
                        style: TextStyle(
                          color: mysa_contrast,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    disableCenter: true,
                    aspectRatio: 21 / 9,
                    viewportFraction: 0.55,
                    height: 190,
                  ),
                  items: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.all(5)),
                          Container(
                            width: 180,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/six.png"),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                          ),
                          ListTile(
                            subtitle: Text(
                              'Positivism',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: mysa_contrast,
                              ),
                            ),
                            title: const Text(
                              'Daily',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
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
                      elevation: 5,
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.all(5)),
                          Container(
                            width: 180,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/five.png"),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                          ),
                          ListTile(
                            subtitle: Text(
                              'Gratitude',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: mysa_contrast,
                              ),
                            ),
                            title: const Text(
                              'Daily',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
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
                      elevation: 5,
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.all(5)),
                          Container(
                            width: 180,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/seven.png"),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                          ),
                          ListTile(
                            subtitle: Text(
                              'Family',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: mysa_contrast,
                              ),
                            ),
                            title: const Text(
                              'Daily',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
                ),
              ],
            ),
          ],
        ),
        drawer: NavigateDrawer(uid: this.uid));
  }
}

class NavigateDrawer extends StatefulWidget {
  final String uid;

  NavigateDrawer({Key? key, required this.uid}) : super(key: key);
  @override
  _NavigateDrawerState createState() => _NavigateDrawerState();
}

class _NavigateDrawerState extends State<NavigateDrawer> {
  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text((currentUser == null
                ? ''
                : currentUser.email == null
                    ? ''
                    : currentUser.email)!),
            accountName: Text((currentUser == null
                ? ''
                : currentUser.displayName == null
                    ? ''
                    : currentUser.displayName)!),
            decoration: BoxDecoration(
              color: mysa_secondary,
            ),
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.home, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text('Home'),
            onTap: () {
              print(widget.uid);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home(uid: widget.uid)),
              );
            },
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.settings, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text('Settings'),
            onTap: () {
              print(widget.uid);
            },
          ),
        ],
      ),
    );
  }
}

// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';
// import 'package:mysa/email_signup.dart';
// import 'package:mysa/signup.dart';
// import 'package:mysa/welcome.dart';
// import 'package:mysa/welcome_screen.dart';
// import 'package:page_indicator/page_indicator.dart';
// appBar: AppBar(
//   title: Text(
//     title,
//     style: TextStyle(
//       color: Colors.white,
//     ),
//   ),
//   actions: <Widget>[
//     IconButton(
//       icon: Icon(
//         Icons.exit_to_app,
//         color: Colors.white,
//       ),
//       onPressed: () {
//         FirebaseAuth auth = FirebaseAuth.instance;
//         auth.signOut().then((res) {
//           Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(builder: (context) => Welcome()),
//               (Route<dynamic> route) => false);
//         });
//       },
//     )
//   ],
// ),
