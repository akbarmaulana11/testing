import 'package:chattingan/constants.dart';
import 'package:chattingan/models/message_model_data.dart';
import 'package:flutter/material.dart';

class DotStatusMessageHandler extends StatelessWidget {
  const DotStatusMessageHandler({Key? key, required this.status})
      : super(key: key);
  final MessageStatus status;
  @override
  Widget build(BuildContext context) {
    Color _sendDotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_sent:
          return kErrorColor;
          // ignore: dead_code
          break;
        case MessageStatus.not_view:
          return Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.1);
          // ignore: dead_code
          break;
        case MessageStatus.viewed:
          return kViewedMessage.withOpacity(0.90);
          // ignore: dead_code
          break;
        default:
          return Colors.transparent;
      }
    }

    return Container(
      margin: EdgeInsets.only(left: kDefaultPadding * 0.5),
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        color: _sendDotColor(status),
        shape: BoxShape.circle,
      ),
      child: Icon(
        status == MessageStatus.not_sent ? Icons.refresh_rounded : Icons.done,
        size: 10,
        color: Colors.white,
      ),
    );
  }
}
