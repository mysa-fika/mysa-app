import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mysa/colors.dart';
import 'package:mysa/home.dart';
import 'package:mysa/email_signup.dart';
import 'package:mysa/signup.dart';
import 'package:mysa/welcome.dart';
import 'package:mysa/welcome_screen.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

//2
final FirebaseAuth _auth = FirebaseAuth.instance;
final globalKey = GlobalKey<ScaffoldState>();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

//3
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mysa.',
        theme: ThemeData(
          primaryColor: mysa_primary,
        ),
        //    home: IntroScreen());
        // home: Welcome());
        home: Carousel());
  }
}

// final Key what = Key('');

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//4
  void onPressedFunc() async {
    final User? user = _auth.currentUser;
    if (user == null) {
      final snackbar = SnackBar(
        content: Text('No one has signed in.'),
      );

      globalKey.currentState!.showSnackBar(snackbar);
      return;
    } else {
      await _auth.signOut();
      final String uid = user.uid;
      final snackbar = SnackBar(
        content: Text(uid + ' has successfully signed out.'),
      );

      globalKey.currentState!.showSnackBar(snackbar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Builder(builder: (BuildContext context) {
            final User? user = _auth.currentUser;
            if (user != null) {
              return FlatButton(
                child: const Text('Sign out'),
                textColor: Theme.of(context).buttonColor,
                onPressed: onPressedFunc,
              );
            }

            return FlatButton(
              child: const Text('Sign in'),
              textColor: Theme.of(context).buttonColor,
              onPressed: onPressedFunc,
            );
          })
        ],
      ),
      body: Builder(builder: (BuildContext context) {
//7
        return ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            //TODO: UI widgets will go here.
          ],
        );
      }),
    );
  }
}

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? result = _auth.currentUser;
    return new SplashScreen(
        navigateAfterSeconds: result != null ? Home(uid: result.uid) : SignUp(),
        seconds: 5,
        title: new Text(
          'Welcome To Mysa.',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: Image.asset('assets/images/dart.png', fit: BoxFit.scaleDown),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("flutter"),
        loaderColor: Colors.red);
  }
}
