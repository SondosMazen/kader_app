import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kader_app/api/api_controller.dart';
import 'package:kader_app/custom_widgets/app_search_text_feild.dart';
import 'package:kader_app/models/result.dart';
import 'package:kader_app/utlies/app_colors.dart';
import 'package:kader_app/utlies/size_config.dart';
import 'package:share/share.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<List<Result>> _resultListFuture;
  List<Result> _result = [];
  List<String> imagePaths = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  //  _resultListFuture = ApiController().indexPost();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsetsDirectional.only(
        start: SizeConfig.scaleWidth(16),
        end: SizeConfig.scaleWidth(16),
        top: SizeConfig.scaleHeight(18),
        // bottom: SizeConfig.scaleHeight(10),
      ),
      decoration: BoxDecoration(
        color: AppColors.DOTS_HORIZANTAL_COLOR,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
         // SizedBox(height: SizeConfig.scaleHeight(16),),
          AppSearchTextFeild(),
          SizedBox(height: SizeConfig.scaleHeight(16),),

          Expanded(
            child: Container(
              child: FutureBuilder(
                  future: _resultListFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.blue,
                          strokeWidth: SizeConfig.scaleWidth(1),
                        ),
                      );
                    } else {
                      if (snapshot.hasError || snapshot.data == null) {
                        return Center(
                          child: Text("ERROR"),
                        );
                      } else {
                        _result = snapshot.data;
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: _result.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsetsDirectional.only(
                                  bottom: SizeConfig.scaleHeight(10),
                                //   start: SizeConfig.scaleWidth(16),
                                //   end: SizeConfig.scaleWidth(16),
                                //   top: SizeConfig.scaleHeight(8),
                                ),
                                decoration: BoxDecoration(
                                  //  color: AppColors.DOTS_HORIZANTAL_COLOR,
                                  color: Colors.white,
                                ),
                                height: SizeConfig.scaleHeight(300),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    SizedBox(
                                      height: SizeConfig.scaleHeight(40),
                                      child: Row(
                                        // crossAxisAlignment: CrossAxisAlignment.center,
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: SizeConfig.scaleWidth(10),
                                          ),
                                          Text(_result[index].postDate),
                                          Spacer(),
                                          Builder(
                                            builder: (BuildContext context) {
                                              return RaisedButton(
                                                child: Icon(
                                                  Icons.share,
                                                  color: Colors.red.shade900,
                                                ),
                                                //Text('Share With Empty Origin'),
                                                onPressed: () => _onShareWithEmptyOrigin(context),
                                              );
                                            },
                                          ),
                                          SizedBox(
                                            width: SizeConfig.scaleWidth(10),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.scaleHeight(6),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        child: Image.network(
                                          _result[index].imageUrl,
                                          fit: BoxFit.fill,
                                          height: SizeConfig.scaleHeight(150),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.scaleHeight(10),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(
                                        start: SizeConfig.scaleWidth(10),
                                        end: SizeConfig.scaleWidth(10),
                                      ),
                                      child: Expanded(
                                        child: Center(
                                          child: Text(_result[index].postTitle),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.scaleHeight(10),
                                    ),
                                  ],
                                ),
                              );
                            });
                      }
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }


  _onDeleteImage(int position) {
    setState(() {
      imagePaths.removeAt(position);
    });
  }

  _onShareWithEmptyOrigin(BuildContext context) async {
    await Share.share("text");
  }
}
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
