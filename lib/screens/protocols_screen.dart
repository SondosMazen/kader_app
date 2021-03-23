import 'package:flutter/material.dart';
import 'package:kader_app/custom_widgets/app_bar_screen.dart';
import 'package:kader_app/custom_widgets/app_search_text_feild.dart';
import 'package:kader_app/utlies/app_colors.dart';
import 'package:kader_app/utlies/size_config.dart';

class ProtocolsScreen extends StatefulWidget {
  @override
  _ProtocolsScreenState createState() => _ProtocolsScreenState();
}

class _ProtocolsScreenState extends State<ProtocolsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsetsDirectional.only(
            start: SizeConfig.scaleWidth(16),
            end: SizeConfig.scaleWidth(16),
            top: SizeConfig.scaleHeight(18),
            bottom: SizeConfig.scaleHeight(20)),
        decoration: BoxDecoration(
          color: AppColors.DOTS_HORIZANTAL_COLOR,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppSearchTextFeild(),
          SizedBox(
            height: SizeConfig.scaleHeight(39),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 12,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: SizeConfig.scaleHeight(57),
                  padding: EdgeInsetsDirectional.only(
                    top: SizeConfig.scaleHeight(10),
                    start: SizeConfig.scaleWidth(18),
                    end: SizeConfig.scaleWidth(18),
                  ),
                  margin: EdgeInsetsDirectional.only(
                    bottom: SizeConfig.scaleHeight(20),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Row(children: [
                        SizedBox(
                          height: SizeConfig.scaleHeight(20),
                          width: SizeConfig.scaleWidth(16),
                          child: Image.asset("images/noun_pdf_1620653.png"),
                        ),
                        SizedBox(
                          width: SizeConfig.scaleWidth(10),
                        ),
                        Center(
                          child: Text(
                            "دليل الوقاية من المخاطر الصحية",
                            style: TextStyle(
                              fontSize: SizeConfig.scaleTextFont(14),
                              color: AppColors.TEXT_LIST_COLOR,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: SizeConfig.scaleWidth(21),
                          width: SizeConfig.scaleWidth(21),
                          padding: EdgeInsetsDirectional.only(
                            top: SizeConfig.scaleHeight(5),
                            start: SizeConfig.scaleWidth(5),
                            end: SizeConfig.scaleWidth(5),
                            bottom: SizeConfig.scaleHeight(5),
                          ),
                          child: Image.asset(
                            "images/noun_download_3465420.png",
                            //width: SizeConfig.scaleWidth(11.4),
                            //height:  SizeConfig.scaleHeight(10),
                          ),
                          decoration: BoxDecoration(
                            color:
                                AppColors.DOWNLOAD_ICON_COLOR.withOpacity(0.34),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: SizeConfig.scaleHeight(4),
                      ),
                      Row(
                        children: [
                          Text(
                            "15-03-2020",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: SizeConfig.scaleTextFont(12),
                                color: AppColors.DATE_COLOR),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
