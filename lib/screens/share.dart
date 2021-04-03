import 'package:flutter/material.dart';
import 'package:share/share.dart';

void main() {
  runApp(DemoApp());
}

class DemoApp extends StatefulWidget {
  @override
  DemoAppState createState() => DemoAppState();
}

class DemoAppState extends State<DemoApp> {
  List<String> imagePaths = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share Plugin Demo',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Share Plugin Demo'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        child: Text('Share With Empty Origin'),
                        onPressed: () => _onShareWithEmptyOrigin(context),
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }

  // _onDeleteImage(int position) {
  //   setState(() {
  //     imagePaths.removeAt(position);
  //   });
  // }
  //
  // _onShare(BuildContext context) async {
  //   // A builder is used to retrieve the context immediately
  //   // surrounding the ElevatedButton.
  //   //
  //   // The context's `findRenderObject` returns the first
  //   // RenderObject in its descendent tree when it's not
  //   // a RenderObjectWidget. The ElevatedButton's RenderObject
  //   // has its position and size after it's built.
  //   final RenderBox box = context.findRenderObject() as RenderBox;
  //
  //   if (imagePaths.isNotEmpty) {
  //     await Share.shareFiles(imagePaths,
  //         text: text,
  //         subject: subject,
  //         sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  //   } else {
  //     await Share.share(text,
  //         subject: subject,
  //         sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  //   }
  // }

  _onShareWithEmptyOrigin(BuildContext context) async {
    await Share.share("text");
  }
}