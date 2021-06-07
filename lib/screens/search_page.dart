import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool asTabs = false;
  String selectedValue;
  final List<DropdownMenuItem> items = [];

  static const String appTitle = "Search Choices demo";
  final String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  @override
  void initState() {
    String wordPair = "";
    loremIpsum
        .toLowerCase()
        .replaceAll(",", "")
        .replaceAll(".", "")
        .split(" ")
        .forEach((word) {
      if (wordPair.isEmpty) {
        wordPair = word + " ";
      } else {
        wordPair += word;
        if (items.indexWhere((item) {
          return (item.value == wordPair);
        }) ==
            -1) {
          items.add(DropdownMenuItem(
            child: Text(wordPair),
            value: wordPair,
          ));
        }
        wordPair = "";
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Widget> widgets;
    widgets = {
      "Search": SearchableDropdown.single(
        items: items,
        value: selectedValue,
        hint: "Select one",
        searchHint: "Select one",
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        isExpanded: true,
      ),
    };

    return MaterialApp(
      home: asTabs
          ? DefaultTabController(
        length: widgets.length,
        child: Scaffold(

        ),
      )
          : Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
         // actions: appBarActions,
        ),
        body: Column(
            children: widgets
                .map((k, v) {
              return (MapEntry(
                  k,
                  Center(
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          margin: EdgeInsets.all(20),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: <Widget>[
                                Text("$k:"),
                                v,
                              ],
                            ),
                          )
                      )
                  )
              )
              );
            })
                .values
                .toList(),
          ),
        ),
    );
  }
}