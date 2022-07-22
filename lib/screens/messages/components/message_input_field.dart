import 'package:flutter/material.dart';
import 'package:chattingan/constants.dart';

class MessageInputField extends StatelessWidget {
  const MessageInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 0.75,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 32,
            color: (Colors.grey).withOpacity(0.3),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 0.75,
                ),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.09),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.5),
                    ),
                    SizedBox(width: kDefaultPadding / 4),
                    Expanded(
                      child: Scrollbar(
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: 'Ketik Pesan',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      // child: Column(
                      //   children: <Widget>[Text("data")],
                      // ),
                    ),
                    Icon(
                      Icons.attach_file,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.5),
                    ),
                    SizedBox(width: kDefaultPadding / 4),
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: kDefaultPadding),
            Icon(Icons.mic, color: kPrimaryColor),
            SizedBox(width: kDefaultPadding * 0.5),
          ],
        ),
      ),
    );
  }
}
