import 'package:chattingan/constants.dart';
import 'package:chattingan/models/message_model_data.dart';
import 'package:flutter/material.dart';

class AudioMessageHandler extends StatelessWidget {
  const AudioMessageHandler({Key? key, required this.message})
      : super(key: key);
  final ChatMessage message;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 0.75,
        vertical: kDefaultPadding / 2.5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: kPrimaryColor.withOpacity(message.isSender ? 0.7 : 0.1),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.play_arrow,
            color: message.isSender
                ? Theme.of(context).iconTheme.color
                : Theme.of(context).iconTheme.color,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding * 0.25,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .color!
                        .withOpacity(0.4),
                  ),
                  Positioned(
                    left: 0,
                    child: Container(
                      height: 7,
                      width: 7,
                      decoration: BoxDecoration(
                          color: Theme.of(context).iconTheme.color,
                          shape: BoxShape.circle),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            "1.37",
            style: TextStyle(
                fontSize: 12,
                color: message.isSender
                    ? Theme.of(context).textTheme.bodyText1!.color
                    : Theme.of(context).textTheme.bodyText1!.color),
          ),
        ],
      ),
    );
  }
}
