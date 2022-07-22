import 'package:chattingan/constants.dart';
import 'package:chattingan/models/chats_model_data.dart';
import 'package:chattingan/models/message_model_data.dart';
import 'package:chattingan/screens/messages/components/message_come_from_model.dart';
import 'package:chattingan/screens/messages/components/message_input_field.dart';
import 'package:flutter/material.dart';

class MessagePageBody extends StatelessWidget {
  const MessagePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Spacer(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
            ),
            child: ListView.builder(
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index) => HandlerMessagesCome(
                message: demeChatMessages[index],
              ),
            ),
          ),
        ),
        MessageInputField(),
      ],
    );
  }
}
