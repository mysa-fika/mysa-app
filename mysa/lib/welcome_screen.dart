import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mysa/calendar.dart';
import 'package:mysa/email_login.dart';
import 'package:mysa/email_signup.dart';
import 'package:mysa/onboarding.dart';
import 'package:mysa/showup.dart';
import 'package:mysa/signup.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class Carousel extends StatefulWidget {
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel>
    with SingleTickerProviderStateMixin {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    List<Widget> _list = [
      // SliderBox(child: SignUp()),
      SliderBox(
          child: new Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              mysa_secondary.withOpacity(0.4),
              mysa_primary.withOpacity(0.4),
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            ShowUp(
              child: SizedBox(
                height: 500,
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Image.asset(
                    'assets/images/mysa.png',
                    scale: 0.3,
                  ),
                ),
              ),
              delay: 600,
            ),
            ShowUp(
              child: SizedBox(
                  height: 180,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Let\'s get through this together!',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontFamily: 'packages/cool_fonts/Roboto',
                          fontSize: 26,
                          color: mysa_contrast,
                        ),
                      ),
                    ),
                  )),
              delay: 900,
            )
          ],
        ),
      )),
      SliderBox(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/carousel-1.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      SliderBox(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/carousel-2.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      SliderBox(
          child: new Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            mysa_secondary.withOpacity(0.4),
            mysa_primary.withOpacity(0.4),
          ],
        )),
        child: Column(
          children: <Widget>[
            ShowUp(
              child: SizedBox(
                height: 490,
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Image.asset(
                    'assets/images/mysa.png',
                    scale: 0.3,
                  ),
                ),
              ),
              delay: 500,
            ),
            SizedBox(
              height: 160,
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: SizedBox(
                  height: 50,
                  width: 300,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          mysa_secondary.withOpacity(0.8)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Onboarding(
                                  index: 0,
                                  score: 0,
                                )),
                        // MaterialPageRoute(builder: (context) => EmailSignUp()),
                      );
                    },
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            new Padding(
              padding: EdgeInsets.all(10.0),
            ),
            new Center(
              child: new RichText(
                text: new TextSpan(
                  children: [
                    new TextSpan(
                      text: 'Log in',
                      style: new TextStyle(
                        color: mysa_contrast,
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EmailLogIn()));
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    ];

    void _animateSlider() {
      Future.delayed(Duration(seconds: 2)).then((_) {
        int nextPage = _controller.page!.round() + 1;

        if (nextPage == _list.length) {
          nextPage = 0;
        }

        _controller
            .animateToPage(nextPage,
                duration: Duration(seconds: 1), curve: Curves.linear)
            .then((_) => _animateSlider());
      });
    }

    @override
    void initState() {
      super.initState();
      WidgetsBinding.instance!.addPostFrameCallback((_) => _animateSlider());
    }

    PageIndicatorContainer container = new PageIndicatorContainer(
      pageView: new PageView(
        children: _list,
        controller: _controller,
      ),
      length: _list.length,
      padding: EdgeInsets.fromLTRB(10, 40, 10, 30),
      indicatorSpace: 10,
      indicatorColor: Colors.grey[350],
      indicatorSelectorColor: Colors.grey,
    );

    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: <Widget>[
          Container(color: Colors.grey[100], height: double.infinity),
          Container(
              color: Colors.white,
              child: container,
              margin: EdgeInsets.only(bottom: 0)),
        ],
      ),
    );
  }
}

class SliderBox extends StatelessWidget {
  final Widget child;
  const SliderBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(0), child: child);
  }
}
