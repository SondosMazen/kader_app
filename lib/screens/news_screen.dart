import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kader_app/api/api_controller.dart';
import 'package:kader_app/custom_widgets/app_search_text_feild.dart';
import 'package:kader_app/models/autogenerated.dart';
import 'package:kader_app/models/result.dart';
import 'package:kader_app/utlies/app_colors.dart';
import 'package:kader_app/utlies/size_config.dart';
import 'package:share/share.dart';
import 'package:http/http.dart' as http;

import 'details_of_the_news_screen.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int currentIndex;

  bool _hasMore;
  int _pageNumber;
  bool _error;
  bool _loading;
  final int _defaultPhotosPerPageCount = 5;
  List<Result> _results;
  final int _nextPageThreshold = 5;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<List<Result>> _resultListFuture;
  List<Result> _result = [];
  List<String> imagePaths = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _hasMore = true;
    _pageNumber = 0;
    _error = false;
    _loading = true;
    _results = [];
    fetchResults();
     _resultListFuture = ApiController().indexPost();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      //appBar: AppBar(title: Text("Photos App")),

      body: Container(
          padding: EdgeInsetsDirectional.only(
            start: SizeConfig.scaleWidth(16),
            end: SizeConfig.scaleWidth(16),
            top: SizeConfig.scaleHeight(18),
            // bottom: SizeConfig.scaleHeight(10),
          ),
          decoration: BoxDecoration(
            color: AppColors.DOTS_HORIZANTAL_COLOR,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // SizedBox(height: SizeConfig.scaleHeight(16),),
            AppSearchTextFeild(),
            SizedBox(
              height: SizeConfig.scaleHeight(16),
            ),
            Expanded(
              child: getBody(),
            ),
          ])),
    );
  }

  Widget getBody() {
    if (_results.isEmpty) {
      if (_loading) {
        return Center(
            child: CircularProgressIndicator());
      } else if (_error) {
        return Center(
            child: InkWell(
          onTap: () {
            setState(() {
              _loading = true;
              _error = false;
              fetchResults();
            });
          },
          child: Text("Error while loading photos, tap to try agin"),
        ));
      }
    } else {
      return ListView.builder(
          itemCount: _results.length + (_hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            currentIndex = index;

            if (index == _results.length - _nextPageThreshold) {
              fetchResults();
            }
            if (index == _results.length) {
              if (_error) {
                return Center(
                    child: InkWell(
                  onTap: () {
                    setState(() {
                      _loading = true;
                      _error = false;
                      fetchResults();
                    });
                  },
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: SizeConfig.scaleWidth(16),
                      end: SizeConfig.scaleWidth(16),
                      top: SizeConfig.scaleHeight(18),
                      bottom: SizeConfig.scaleHeight(18)
                    ),
                    child: Text("Error while loading photos, tap to try agin"),
                  ),
                ));
              } else {
                return Center(
                    child: CircularProgressIndicator());
              }
            }
            final Result photo = _results[index];
            return GestureDetector(
              onTap:(){
              Navigator.push(
                  context,
                  MaterialPageRoute (
                    builder: (context) => DetailsNewsScreen(news: _results[index]),
                  )
              );},
              child: Card(
                child: Column(
                  children:[
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: SizeConfig.scaleWidth(10),
                        ),
                        Text(photo.postDate),
                        Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.white,
                            elevation: 0,
                          ),
                          child: Icon(
                            Icons.share,
                            color: Colors.red.shade900,
                          ),
                          //Text('Share With Empty Origin'),
                          onPressed: () => _onShareWithEmptyOrigin(context),
                        ),
                        // SizedBox(
                        //   width: SizeConfig.scaleWidth(10),
                        // ),
                      ],
                    ),
                    Image.network(
                      photo.imageUrl.contains(".pdf")
                          ? "https://www.moh.gov.ps/portal/wp-content/uploads/2021/03/166450908_276095637336182_280269521181798585_n.jpg"
                          : photo.imageUrl ??
                              "https://www.moh.gov.ps/portal/wp-content/uploads/2021/03/166450908_276095637336182_280269521181798585_n.jpg",
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                      height: SizeConfig.scaleHeight(170),

                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(photo.postTitle,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ],
                ),
              ),
            );
          });
    }
    return Container();
  }

  Future<void> fetchResults() async {
    try {
      final response = await http
          .get("https://www.moh.gov.ps/test/test.php?page=$_pageNumber");
      print("https://www.moh.gov.ps/test/test.php?page=$_pageNumber");
      // List<Results> fetchedPhotos = Results.parseList(jsonDecode(response.body));
      List<Result> fetchedPhotos =
          Autogenerated.fromJson(jsonDecode(response.body)).result;
      // fetchedPhotos.forEach((element) {
      //   print(element.id);
      //   print(element.postDate);
      //   print(element.guid);
      //   print(element.postTitle);
      //   print(element.imageUrl);
      //   print(element.postContent);
      //   print("===================");
      // });
      setState(() {
        _hasMore = fetchedPhotos.length == _defaultPhotosPerPageCount;
        _loading = false;
        _pageNumber = _pageNumber + 1;
        _results.addAll(fetchedPhotos);
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _error = true;
      });
    }
  }

  //
  // _onDeleteImage(int position) {
  //   setState(() {
  //     imagePaths.removeAt(position);
  //   });
  // }

  _onShareWithEmptyOrigin(BuildContext context) async {
    await Share.share("text");
  }
}

class Results {
  String id;
  String postDate;
  String guid;
  String postTitle;
  String postContent;
  String imageUrl;

  Results(this.id, this.postDate, this.guid, this.postTitle, this.postContent,
      this.imageUrl);

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(json["id"], json["postDate"], json["guid"],
        json["postTitle"], json["postContent"], json["imageUrl"]);
  }

  static List<Results> parseList(List<dynamic> list) {
    return list.map((i) => Results.fromJson(i)).toList();
  }
}

// Widget build(BuildContext context) {
//   SizeConfig().init(context);
//
//   return Container(
//     padding: EdgeInsetsDirectional.only(
//       start: SizeConfig.scaleWidth(16),
//       end: SizeConfig.scaleWidth(16),
//       top: SizeConfig.scaleHeight(18),
//       // bottom: SizeConfig.scaleHeight(10),
//     ),
//     decoration: BoxDecoration(
//       color: AppColors.DOTS_HORIZANTAL_COLOR,
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // SizedBox(height: SizeConfig.scaleHeight(16),),
//         AppSearchTextFeild(),
//         SizedBox(
//           height: SizeConfig.scaleHeight(16),
//         ),
//
//         Expanded(
//           child: Container(
//             child: FutureBuilder(
//                 future: _resultListFuture,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(
//                       child: CircularProgressIndicator(
//                         backgroundColor: Colors.blue,
//                         strokeWidth: SizeConfig.scaleWidth(1),
//                       ),
//                     );
//                   } else {
//                     if (snapshot.hasError || snapshot.data == null) {
//                       return Center(
//                         child: Text("ERROR"),
//                       );
//                     } else {
//                       _result = snapshot.data;
//                       return ListView.builder(
//                           scrollDirection: Axis.vertical,
//                           shrinkWrap: true,
//                           itemCount: _result.length,
//                           itemBuilder: (context, index) {
//                             return Container(
//                               margin: EdgeInsetsDirectional.only(
//                                 bottom: SizeConfig.scaleHeight(10),
//                                 //   start: SizeConfig.scaleWidth(16),
//                                 //   end: SizeConfig.scaleWidth(16),
//                                 //   top: SizeConfig.scaleHeight(8),
//                               ),
//                               decoration: BoxDecoration(
//                                 //  color: AppColors.DOTS_HORIZANTAL_COLOR,
//                                 color: Colors.white,
//                               ),
//                               height: SizeConfig.scaleHeight(300),
//                               child: Column(
//                                 crossAxisAlignment:
//                                     CrossAxisAlignment.stretch,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SizedBox(
//                                     height: SizeConfig.scaleHeight(40),
//                                     child: Row(
//                                       // crossAxisAlignment: CrossAxisAlignment.center,
//                                       // mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         SizedBox(
//                                           width: SizeConfig.scaleWidth(10),
//                                         ),
//                                         Text(_result[index].postDate),
//                                         Spacer(),
//                                         ElevatedButton(
//                                           // style: ButtonStyle(
//                                           //   backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                           //         (Set<MaterialState> states) {
//                                           //       if (states.contains(MaterialState.pressed))
//                                           //         return Colors.white;
//                                           //       return Colors.white; // Use the component's default.
//                                           //     },
//                                           //   ),
//                                           //   shadowColor: MaterialStateProperty.resolveWith<Color>(
//                                           //         (Set<MaterialState> states) {
//                                           //       if (states.contains(MaterialState.pressed))
//                                           //         return Colors.white;
//                                           //       return Colors.white; // Use the component's default.
//                                           //     },
//                                           //   ),
//                                           //
//                                           // ),
//                                           style: ElevatedButton.styleFrom(
//                                             primary: Colors.white,
//                                             onPrimary: Colors.white,
//                                             elevation: 0,
//                                           ),
//                                           child: Icon(
//                                             Icons.share,
//                                             color: Colors.red.shade900,
//                                           ),
//                                           //Text('Share With Empty Origin'),
//                                           onPressed: () =>
//                                               _onShareWithEmptyOrigin(
//                                                   context),
//                                         ),
//                                         SizedBox(
//                                           width: SizeConfig.scaleWidth(10),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: SizeConfig.scaleHeight(6),
//                                   ),
//                                   Expanded(
//                                     child: SizedBox(
//                                       child: Image.network(
//                                         _result[index].imageUrl,
//                                         fit: BoxFit.fill,
//                                         height: SizeConfig.scaleHeight(150),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: SizeConfig.scaleHeight(10),
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsetsDirectional.only(
//                                       start: SizeConfig.scaleWidth(10),
//                                       end: SizeConfig.scaleWidth(10),
//                                     ),
//                                     child: Expanded(
//                                       child: Center(
//                                         child: Text(_result[index].postTitle),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: SizeConfig.scaleHeight(10),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           });
//                     }
//                   }
//                 }),
//           ),
//         ),
//       ],
//     ),
//   );
// }


/*
 child: Container(
                                  // height: SizeConfig.scaleHeight(150),
                                  margin: EdgeInsetsDirectional.only(
                                    bottom: SizeConfig.scaleHeight(20),
                                  ),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: SizeConfig.scaleHeight(30),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: SizeConfig.scaleWidth(10),
                                              ),
                                              Text("03-03-2021"),
                                              SizedBox(
                                                width: SizeConfig.scaleWidth(5),
                                              ),
                                              Text("55:08:09"),
                                              Spacer(),
                                              Icon(Icons.share),
                                              SizedBox(
                                                width: SizeConfig.scaleWidth(10),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            child: Image.asset("images/home.png"),
                                        width: double.infinity,
                                        ),
                                        Center(
                                            child: Text(_result[index].postTitle),
                                        ),
                                      ],
                                    ),

                                ),
 */