import 'package:chattingan/components/button/button_custom.dart';
import 'package:chattingan/constants.dart';
import 'package:chattingan/screens/chats/chats_screen.dart';
import 'package:flutter/material.dart';

class AuthLoginPage extends StatelessWidget {
  const AuthLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return FittedBox(
    //   child: Text(
    //     "Hello!",
    //     style: Theme.of(context).textTheme.bodyText1!.copyWith(
    //           color: Theme.of(context)
    //               .textTheme
    //               .bodyText1!
    //               .color!
    //               .withOpacity(0.8),
    //         ),
    //   ),
    // );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: <Widget>[
              Spacer(
                flex: 2,
              ),
              Image.asset(
                MediaQuery.of(context).platformBrightness == Brightness.light
                    ? "assets/images/Logo_light.png"
                    : "assets/images/Logo_dark.png",
                height: 146,
              ),
              Spacer(),
              ButtonPrimary(
                text: "Sign In",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatsScreenPage()),
                  );
                  print("Login : $context");
                },
              ),
              SizedBox(
                height: kDefaultPadding * 1.5,
              ),
              ButtonPrimary(
                color: Theme.of(context).colorScheme.secondary,
                press: () {},
                text: "Sign Up",
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
