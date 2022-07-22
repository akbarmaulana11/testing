import 'package:chattingan/constants.dart';
import 'package:chattingan/screens/auth_login/auth_login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Spacer(
            flex: 2,
          ),
          Image.asset('assets/images/welcome_image.png'),
          Spacer(
            flex: 3,
          ),
          Text(
            'Welcome to the apps \nits for my Dear',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(
            'Chattingan ini hanya untuk pribadi saja hehehe',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .color!
                    .withOpacity(0.64)),
          ),
          Spacer(
            flex: 5,
          ),
          FittedBox(
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AuthLoginPage()));
                print("on pressed : $context");
              },
              child: Row(
                children: <Widget>[
                  Text(
                    "Skip",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(0.8),
                        ),
                  ),
                  SizedBox(
                    width: kDefaultPadding / 4,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 17,
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .color!
                        .withOpacity(0.8),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
