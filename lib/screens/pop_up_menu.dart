import 'package:flutter/material.dart';

class PopUpMenu extends StatefulWidget {
  @override
  _PopUpMenuState createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popup Menu"),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext bc) => [
              PopupMenuItem(child: Text("New Chat"), value: "/newchat"),
              PopupMenuItem(
                  child: Text("New Group Chat"), value: "/new-group-chat"),
              PopupMenuItem(child: Text("Settings"), value: "/settings"),
            ],
            onSelected: (route) {
              print(route);
              // Note You must create respective pages for navigation
              Navigator.pushNamed(context, route);
            },
          ),
        ],
      ),
      body: Container(),
    );
  }
}