import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysa/onboarding.dart';
import 'package:mysa/signup.dart';
import 'package:page_indicator/page_indicator.dart';

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
      SliderBox(
          child: new Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            mysa_secondary.withOpacity(0.2),
            mysa_primary.withOpacity(0.2),
          ],
        )),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 500,
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Image.asset(
                  'assets/images/mysa.png',
                  scale: 0.3,
                ),
              ),
            ),
            SizedBox(
              height: 190,
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
                        MaterialPageRoute(builder: (context) => Onboarding()),
                      );
                    },
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
      SliderBox(
          child: FlutterLogo(
        textColor: Colors.green,
      )),
      SliderBox(
          child: FlutterLogo(
        textColor: Colors.blue,
      ))
    ];

    void _animateSlider() {
      Future.delayed(Duration(seconds: 5)).then((_) {
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

    return Stack(
      children: <Widget>[
        Container(color: Colors.grey[100], height: double.infinity),
        Container(
            color: Colors.white,
            child: container,
            margin: EdgeInsets.only(bottom: 0)),
      ],
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
