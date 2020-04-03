import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';

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
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      elevation: 7,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('images/dp.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                      child: Card(
                        color: Colors.white,
                        elevation: 7,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(41, 10, 41, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 80),
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.blueGrey[300],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Text(
                                  '+91 9027398389',
                                  style: TextStyle(color: Colors.blueGrey[300]),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _launchURL,
                      child: Card(
                        margin: EdgeInsets.only(top: 8, bottom: 6),
                        color: Colors.white,
                        elevation: 7,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 40),
                                child: Icon(
                                  Icons.mail,
                                  color: Colors.blueGrey[300],
                                ),
                              ),
                              Text(
                                'maurya.abhay30@gmail.com',
                                style: TextStyle(color: Colors.blueGrey[300]),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(top: 8),
                      color: Colors.white,
                      elevation: 7,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(24, 0, 15, 0),
                              child: GestureDetector(
                                onTap: _launchLI,
                                child: Icon(
                                  FontAwesomeIcons.linkedin,
                                  color: Colors.blueGrey[300],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: GestureDetector(
                                onTap: _launchGH,
                                child: Icon(
                                  FontAwesomeIcons.githubSquare,
                                  color: Colors.blueGrey[300],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: GestureDetector(
                                onTap: _launchTW,
                                child: Icon(
                                  FontAwesomeIcons.twitterSquare,
                                  color: Colors.blueGrey[300],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: GestureDetector(
                                onTap: _launchIG,
                                child: Icon(
                                  FontAwesomeIcons.instagramSquare,
                                  color: Colors.blueGrey[300],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 23, 0),
                              child: GestureDetector(
                                onTap: _launchRD,
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
