import 'package:chattingan/components/custom_fillOutline_button/fill_outline_button.dart';
import 'package:chattingan/constants.dart';
import 'package:chattingan/models/chats_model_data.dart';
import 'package:chattingan/screens/chats/components/chat_user_card.dart';
import 'package:chattingan/screens/messages/messages_screen.dart';
import 'package:flutter/material.dart';

class ChatsPageBody extends StatelessWidget {
  const ChatsPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: kPrimaryColor,
    //     automaticallyImplyLeading: false,
    //     title: Text("This Chats Body"),
    //   ),
    // );
    return Column(children: <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(
            kDefaultPadding / 1.1, 0, kDefaultPadding, kDefaultPadding),
        color: kPrimaryColor,
        child: Row(
          children: <Widget>[
            FillOutlineButton(
              press: () {},
              text: "Recent Messege",
            ),
            SizedBox(width: kDefaultPadding),
            FillOutlineButton(
              press: () {},
              text: "Active",
              isFilled: false,
            ),
          ],
        ),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: chatsData.length,
          itemBuilder: (context, index) => ChatsUserCard(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessagesScreenPage(),
                ),
              );
              print('Route to Page Message \n$context');
            },
            chat: chatsData[index],
          ), //Text("User"),
        ),
      ),
    ]);
  }
}
