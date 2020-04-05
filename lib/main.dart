import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  Animatable<Color> background = TweenSequence<Color>(
    [
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.red,
          end: Colors.orange,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.orange,
          end: Colors.amber,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.amber,
          end: Colors.green,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.green,
          end: Colors.blue,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.blue,
          end: Colors.purple,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.purple,
          end: Colors.pink,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.pink,
          end: Colors.red,
        ),
      ),
    ],
  );
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 60),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Scaffold(
            backgroundColor:
                background.evaluate(AlwaysStoppedAnimation(_controller.value)),
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            height: 150,
                            width: 150,
                            child: FlareActor("animations/dpbg.flr",
                                alignment: Alignment.center,
                                fit: BoxFit.contain,
                                animation: "Alarm"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(21.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              elevation: 0,
                              child: CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage('images/dp.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                        child: Text(
                          'Abhay Maurya',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: 'Pacifico',
                          ),
                        ),
                      ),
                      Text(
                        '【=◈︿◈=】',
                        style: TextStyle(
                          color: Colors.white70,
                          letterSpacing: 2.5,
                          fontSize: 15,
                          fontFamily: 'Source Sans Pro',
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 175,
                        child: Divider(
                          color: Colors.white54,
                        ),
                      ),
                      GestureDetector(
                        onTap: _launchPhone,
                        child: Tooltip(
                                  message: 'Phone',
                                  waitDuration: Duration(milliseconds: 500),
                                  child: Card(
                          color: Colors.white,
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.phone,
                                  color: Colors.blueGrey[300],
                                ),
                                Text(
                                  '+91 9027398389',
                                  style: TextStyle(color: Colors.blueGrey[300]),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),),
                      GestureDetector(
                        onTap: _launchURL,
                        child: Tooltip(
                                  message: 'Email',
                                  waitDuration: Duration(milliseconds: 500),
                                  child: Card(
                          color: Colors.white,
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.mail,
                                  color: Colors.blueGrey[300],
                                ),
                                Text(
                                  'maurya.abhay30@gmail.com',
                                  style: TextStyle(color: Colors.blueGrey[300]),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),),
                      Card(
                        color: Colors.white,
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                onTap: _launchLI,
                                child: Tooltip(
                                  message: 'LinkedIn',
                                  waitDuration: Duration(milliseconds: 500),
                                  child:Icon(
                                  FontAwesomeIcons.linkedin,
                                  color: Colors.blueGrey[300],
                                ),),
                              ),
                              GestureDetector(
                                onTap: _launchGH,
                                child: Tooltip(
                                  message: 'Github',
                                  waitDuration: Duration(milliseconds: 500),
                                  child:Icon(
                                  FontAwesomeIcons.githubSquare,
                                  color: Colors.blueGrey[300],
                                ),),
                              ),
                              GestureDetector(
                                onTap: _launchTW,
                                child: Tooltip(
                                  message: 'Twitter',
                                  waitDuration: Duration(milliseconds: 500),
                                  child:Icon(
                                  FontAwesomeIcons.twitterSquare,
                                  color: Colors.blueGrey[300],
                                ),),
                              ),
                              GestureDetector(
                                onTap: _launchIG,
                                child: Tooltip(
                                  message: 'Instagram',
                                  waitDuration: Duration(milliseconds: 500),
                                  child:Icon(
                                  FontAwesomeIcons.instagramSquare,
                                  color: Colors.blueGrey[300],
                                ),
                                ),
                              ),
                              GestureDetector(
                                onTap: _launchRD,
                                child: Tooltip(
                                  message: 'Reddit',
                                  waitDuration: Duration(milliseconds: 500),
                                  child: Icon(
                                    FontAwesomeIcons.redditSquare,
                                    color: Colors.blueGrey[300],
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
          );
        },
      ),
    );
  }
}

_launchPhone() async {
  const url = 'tel:+91 9027398389';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL() async {
  const url = 'mailto:maurya.abhay30@gmail.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchLI() async {
  const url = 'https://www.linkedin.com/in/liquidatorcoder/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchGH() async {
  const url = 'https://github.com/LiquidatorCoder';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchTW() async {
  const url = 'https://twitter.com/LiquidatorAB';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchIG() async {
  const url = 'https://www.instagram.com/its.me.abhay/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchRD() async {
  const url = 'https://www.reddit.com/user/LiquidatorAB';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
