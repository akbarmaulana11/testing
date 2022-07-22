import 'package:chattingan/constants.dart';
import 'package:chattingan/models/message_model_data.dart';
import 'package:flutter/material.dart';

class TextMessageHandler extends StatelessWidget {
  const TextMessageHandler({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 0.75,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(message.isSender ? 0.9 : 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        message.text,
        style: TextStyle(
            color: message.isSender
                ? Theme.of(context).textTheme.bodyText1!.color
                : Theme.of(context).textTheme.bodyText1!.color),
      ),
    );
  }
}
