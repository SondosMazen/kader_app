import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kader_app/api/api_controller.dart';
import 'package:kader_app/locale/AppLocalizations.dart';
import 'package:kader_app/main.dart';
import 'package:kader_app/models/result.dart';
import 'package:kader_app/utlies/app_colors.dart';
import 'package:kader_app/utlies/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MainApp());

class DetailsNewsScreen extends StatefulWidget {
  final Result news;

  DetailsNewsScreen({Key key, @required this.news}) : super(key: key);
  @override
  _DetailsNewsScreenState createState() => _DetailsNewsScreenState();

}

class _DetailsNewsScreenState extends State<DetailsNewsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Result news;
  // final Result result;
  //
  // _DetailsNewsScreenState(this.result);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // _resultListFuture = ApiController().indexPost();
    news = widget.news;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(icon: Icon(Icons.more_vert), onPressed: () {});

            },
          ),
          backgroundColor: AppColors.MAIN_COLOR,
          title: Center(
              child: Text(
                AppLocalizations.of(context).translate("newsDetails"),
          )),
          actions: [
      IconButton(
          icon: Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.pop(context);
          // Navigator.pushReplacementNamed(context, '/news');
          //Navigator.pop(context, true);
        }
    ),
            // IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ]),
      body: SingleChildScrollView(
        child: Container(
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
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.postTitle,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.scaleTextFont(20),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.scaleHeight(5),
                  ),
                  Row(
                    children: [
                      Text(
                        news.postDate,
                        style: TextStyle(
                          color: AppColors.HINT_TEXT_STACK_HOME_COLOR,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.scaleTextFont(14),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.scaleHeight(16),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.zero,
                    height: SizeConfig.scaleHeight(215),
                    width: double.infinity,
                    child:
                      Image.network(
                        news.imageUrl),
                  ),
                  SizedBox(
                    height: SizeConfig.scaleHeight(16),
                  ),
                  Text(
                    news.postContent,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.scaleTextFont(16),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.scaleHeight(16),
                  ),

                ],
              ),
              GestureDetector(
                onTap: () {
                  _launchURL();
                },
                child: Center(
                  child: Text(
                    "للانتقال لصفحة الموقع اضغط هنا",
                    style: TextStyle(
                      color: AppColors.MAIN_COLOR,
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.scaleTextFont(20),

                    ),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://www.moh.gov.ps/portal/category/it-unit/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
