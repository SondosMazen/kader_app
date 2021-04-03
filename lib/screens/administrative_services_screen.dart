import 'package:flutter/material.dart';
import 'package:kader_app/custom_widgets/app_bar_screen.dart';
import 'package:kader_app/custom_widgets/app_row_list_view.dart';
import 'package:kader_app/custom_widgets/app_search_text_feild.dart';
import 'package:kader_app/locale/AppLocalizations.dart';
import 'package:kader_app/utlies/app_colors.dart';
import 'package:kader_app/utlies/size_config.dart';

class AdministrativeServicesScreen extends StatefulWidget {

  @override
  _AdministrativeServicesScreenState createState() =>
      _AdministrativeServicesScreenState();
}

class _AdministrativeServicesScreenState
    extends State<AdministrativeServicesScreen> {
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
          // bottom: SizeConfig.scaleHeight(10),
        ),
        decoration: BoxDecoration(
          color: AppColors.DOTS_HORIZANTAL_COLOR,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppSearchTextFeild(),
          SizedBox(
            height: SizeConfig.scaleHeight(39),
          ),
          ListView(
            shrinkWrap: true,
            children: [
              AppRowListView(
                text: AppLocalizations.of(context).translate("ApplyForLeave"),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(20),
              ),
              AppRowListView(
                text: AppLocalizations.of(context).translate("HolidaysDisplay"),
              ),

              SizedBox(
                height: SizeConfig.scaleHeight(20),
              ),
              AppRowListView(
              text: AppLocalizations.of(context).translate("AcknowledgmentToReturn"),

    ),
            ],
          ),
        ]),
      ),
    );
  }
}
