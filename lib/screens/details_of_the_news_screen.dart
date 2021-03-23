import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kader_app/api/api_controller.dart';
import 'package:kader_app/main.dart';
import 'package:kader_app/models/result.dart';
import 'package:kader_app/utlies/app_colors.dart';
import 'package:kader_app/utlies/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MainApp());

class DetailsNewsScreen extends StatefulWidget {
  @override
  _DetailsNewsScreenState createState() => _DetailsNewsScreenState();

}

class _DetailsNewsScreenState extends State<DetailsNewsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<List<Result>> _resultListFuture;
  List<Result> _result = [];
  // final Result result;
  //
  // _DetailsNewsScreenState(this.result);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // _resultListFuture = ApiController().indexPost();

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
            "تفاصيل الخبر",
          )),
          actions: [
      IconButton(
          icon: Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/home_screen');
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "وزارة الصحة تكرم قسم العلاقات العامة بالمستشفى الاندونيسي",
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
                    "18-02-2021",
                    style: TextStyle(
                      color: AppColors.HINT_TEXT_STACK_HOME_COLOR,
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.scaleTextFont(14),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.scaleWidth(5),
                  ),
                  Text(
                    "08:55:27",
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/home.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(16),
              ),
              Text(
                "dfgdfdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfg"
                "dfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgd"
                "dfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfggdfgdfg"
                "dfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfggdfgdfg"
                "dfgdfgdfgdfg"
                "dfgdfdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfg"
                "dfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgd"
                "dfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfggdfgdfg"
                "dfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfggdfgdfg"
                "dfgdfgdfgdfg"
                "dfgdfdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfg"
                "dfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgd"
                "dfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfggdfgdfg"
                "dfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfggdfgdfg"
                "dfgdfgdfgdfg"
                "dfgdfdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfg"
                "dfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgd"
                "dfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfggdfgdfg"
                "dfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfggdfgdfg"
                "dfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfggdfgdfg"
                "dfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfggdfgdfgfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfggdfgdfg",
                style: TextStyle(
                  color: AppColors.HINT_TEXT_STACK_HOME_COLOR,
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.scaleTextFont(14),
                ),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(16),
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
