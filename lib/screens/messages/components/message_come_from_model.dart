import 'package:chattingan/constants.dart';
import 'package:chattingan/models/message_model_data.dart';
import 'package:chattingan/screens/messages/components/handler_audio_message.dart';
import 'package:chattingan/screens/messages/components/handler_notif_read_message_icon.dart';
import 'package:chattingan/screens/messages/components/handler_text_messages.dart';
import 'package:chattingan/screens/messages/components/handler_video_message.dart';
import 'package:flutter/material.dart';

class HandlerMessagesCome extends StatelessWidget {
  const HandlerMessagesCome({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  Widget _messageContaint(ChatMessage message) {
    switch (message.messageType) {
      case ChatMessageType.text:
        return TextMessageHandler(message: message);
      // ignore: dead_code
      // break;
      case ChatMessageType.audio:
        return AudioMessageHandler(message: message);
      // ignore: dead_code
      // break;
      case ChatMessageType.video:
        return VideoMessageHandler();
      // ignore: dead_code
      // break;
      default:
        return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: kDefaultPadding * 0.5,
      ),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage('assets/images/user_5.png'),
            ),
            SizedBox(
              width: kDefaultPadding * 0.5,
            ),
          ],
          // Text("Isi Pesan"),
          // TextMessage(
          //   message: message,
          // ),
          _messageContaint(message),
          if (message.isSender)
            DotStatusMessageHandler(
              status: message.messageStatus,
            ),
        ],
      ),
    );
  }
}
