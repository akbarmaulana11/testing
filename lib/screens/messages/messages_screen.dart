import 'package:chattingan/constants.dart';
import 'package:chattingan/screens/messages/components/message_body.dart';
import 'package:flutter/material.dart';

class MessagesScreenPage extends StatelessWidget {
  const MessagesScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MessagesAppBar(),
      body: MessagePageBody(),
    );
  }

  AppBar MessagesAppBar() {
    return AppBar(
      title: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/user_5.png'),
          ),
          SizedBox(
            width: kDefaultPadding * 0.75,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Akbar Maulana",
                style: TextStyle(fontSize: 17),
              ),
              Text(
                "Active 3m ago",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
        IconButton(onPressed: () {}, icon: Icon(Icons.call)),
      ],
    );
  }
}
