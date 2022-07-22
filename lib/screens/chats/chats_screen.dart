import 'package:chattingan/constants.dart';
import 'package:chattingan/screens/chats/components/chats_body.dart';
import 'package:flutter/material.dart';

class ChatsScreenPage extends StatefulWidget {
  const ChatsScreenPage({Key? key}) : super(key: key);

  @override
  State<ChatsScreenPage> createState() => _ChatsScreenPageState();
}

class _ChatsScreenPageState extends State<ChatsScreenPage> {
  int _indexMenuBar = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatsAppBar(),
      body: ChatsPageBody(),
      //dibawah ini tombol tambah orang untuk chat
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        child: Icon(
          Icons.message,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
      bottomNavigationBar: _BottomNavigationBarBuilder(),
    );
  }

  BottomNavigationBar _BottomNavigationBarBuilder() {
    return BottomNavigationBar(
      currentIndex: _indexMenuBar,
      onTap: (value) {
        setState(() {
          _indexMenuBar = value;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
        BottomNavigationBarItem(icon: Icon(Icons.call), label: "Call"),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage('assets/images/user_3.png'),
            ),
            label: "Profile"),
      ],
    );
  }
}

AppBar ChatsAppBar() {
  return AppBar(
    backgroundColor: kPrimaryColor,
    automaticallyImplyLeading: false,
    title: Text("Chats"),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.search),
      ),
    ],
  );
}
