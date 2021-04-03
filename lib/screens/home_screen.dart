import 'package:flutter/material.dart';
import 'package:kader_app/api/api_builder.dart';
import 'package:kader_app/api/api_controller.dart';
import 'package:kader_app/api/api_settings.dart';
import 'package:kader_app/custom_widgets/app_search_text_feild.dart';
import 'package:kader_app/custom_widgets/app_stack_home.dart';
import 'package:kader_app/locale/AppLocalizations.dart';
import 'package:kader_app/models/result.dart';
import 'package:kader_app/screens/additional_services%20_screen.dart';
import 'package:kader_app/screens/administrative_services_screen.dart';
import 'package:kader_app/screens/custody_screen.dart';
import 'package:kader_app/screens/details_of_the_news_screen.dart';
import 'package:kader_app/screens/home_base.dart';
import 'package:kader_app/screens/news_screen.dart';
import 'package:kader_app/screens/permanence_screen.dart';
import 'package:kader_app/screens/protocols_screen.dart';
import 'package:kader_app/screens/shifts_screen.dart';
import 'package:kader_app/utlies/app_colors.dart';
import 'package:kader_app/utlies/size_config.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();
  int currentIndex;
  Future<List<Result>> _resultListFuture;
  List<Result> _result = [];
  // final List<Result> result;
  //
  // _HomeScreenState(this.result);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _resultListFuture = ApiController().indexPost();
    // _resultListFuture = ApiBuilder.initialize.url(ApiSettings.API_POST)
    // .requestType(RequestType.GET)
    // .performListRequest<Result>();

  }

  @override
  Widget build(BuildContext context) {
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
          // AppSearchTextFeild(),
          // SizedBox(
          //   height: SizeConfig.scaleHeight(16),
          // ),
          Container(
            width: double.infinity,
            height: SizeConfig.scaleHeight(215),
            color: Colors.white,
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
                    return Container(
                      margin: EdgeInsetsDirectional.zero,
                      height: SizeConfig.scaleHeight(215),
                      width: double.infinity,
                      child: ListView.builder(
                        //  physics: AlwaysScrollableScrollPhysics(), // new
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: _result.length,
                              itemBuilder: (context, index) {

                                currentIndex = index;
                                return GestureDetector(
                                  // onTap: () {
                                  //
                                  //   // Navigator.push(
                                  //   //   context,
                                  //   //   MaterialPageRoute(
                                  //   //     builder: (context) => DetailsNewsScreen(result: _result[index]),
                                  //   //   ),
                                  //   // );
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute (
                                  //         builder: (context) => DetailsNewsScreen(news: _result[index]),
                                  //       )
                                  //   );
                                  //   // Navigator.pushReplacementNamed(
                                  //   //     context, '/details_of_the_news_screen');
                                  // },
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: SizeConfig.scaleHeight(215),
                                        child: Image.network(
                                            _result[index].imageUrl),
                                         decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                      ),
                                      PositionedDirectional(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadiusDirectional.only(
                                              bottomEnd: Radius.circular(16),
                                              bottomStart: Radius.circular(16),
                                            ),
                                            color: AppColors.MAIN_COLOR
                                                .withOpacity(0.78),
                                          ),
                                          height: SizeConfig.scaleHeight(54),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.only(
                                              top: SizeConfig.scaleHeight(5),
                                              start: SizeConfig.scaleWidth(19),
                                              end: SizeConfig.scaleWidth(25),
                                            ),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  child: Center(
                                                    child: Text(
                                                      _result[index].postTitle,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize:
                                                        SizeConfig.scaleTextFont(
                                                            10),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    children: [
                                                      for(int i = 0; i < _result.length; i++)
                                                        Container(
                                                            height: 10, width: 10,
                                                            margin: EdgeInsetsDirectional.only(end:SizeConfig.scaleWidth(5)),
                                                            decoration: BoxDecoration(
                                                                color: i == currentIndex ? Colors.white : Colors.grey,
                                                                borderRadius: BorderRadius.circular(5),
                                                              
                                                            )
                                                        )
                                                      // Container(
                                                      //   height: SizeConfig
                                                      //       .scaleHeight(6),
                                                      //   width:
                                                      //   SizeConfig.scaleWidth(
                                                      //       6),
                                                      //   decoration: BoxDecoration(
                                                      //     borderRadius:
                                                      //     BorderRadius
                                                      //         .circular(16),
                                                      //     color: AppColors
                                                      //         .DOTS_HORIZANTAL_COLOR,
                                                      //   ),
                                                      // ),
                                                      // SizedBox(
                                                      //   width:
                                                      //   SizeConfig.scaleWidth(
                                                      //       4),
                                                      // ),
                                                      // Container(
                                                      //   height: SizeConfig
                                                      //       .scaleHeight(6),
                                                      //   width:
                                                      //   SizeConfig.scaleWidth(
                                                      //       6),
                                                      //   decoration: BoxDecoration(
                                                      //       borderRadius:
                                                      //       BorderRadius
                                                      //           .circular(16),
                                                      //       color: Colors.white
                                                      //           .withOpacity(
                                                      //           0.47)),
                                                      // ),
                                                      // SizedBox(
                                                      //   height: SizeConfig
                                                      //       .scaleHeight(7),
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                            ),
                                          ),
                                          alignment: AlignmentDirectional.center,
                                        ),
                                        bottom: SizeConfig.scaleHeight(0),
                                        start: SizeConfig.scaleWidth(0),
                                        end: SizeConfig.scaleWidth(0),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                    );
                  }
                }
              },
            ),
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(16),
          ),

          GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: SizeConfig.scaleHeight(20),
              crossAxisSpacing: SizeConfig.scaleWidth(21),
            ),
            children: [
              AppStackHome(
                changeScreen:()=> HomeBaseScreen.changeBaseWidget(context, AdministrativeServicesScreen(),"AdministrativeServices"),
                image: Image.asset(
                  'images/group_232.png',
                  color: AppColors.SHADOW_CONTAINER_COLOR,
                ),
                text: AppLocalizations.of(context).translate("AdministrativeServices"),

                color: AppColors.SHADOW_CONTAINER_COLOR,
              ),
              AppStackHome(
                changeScreen:()=> HomeBaseScreen.changeBaseWidget(context, CustodyScreen(),"Custody"),
                image: Image.asset(
                  'images/path_194.png',
                  color: AppColors.SHADOW_CONTAINER_COLOR,
                ),
                 text: AppLocalizations.of(context).translate("Custody"),
                color: AppColors.SHADOW_CONTAINER_COLOR,
              ),
              AppStackHome(
                changeScreen:()=> HomeBaseScreen.changeBaseWidget(context, NewsScreen(),"News"),
                image: Image.asset(
                  'images/group_225.png',
                  color: AppColors.SHADOW_CONTAINER_COLOR,
                ),
                text: AppLocalizations.of(context).translate("News"),
                color: AppColors.SHADOW_CONTAINER_COLOR,
              ),
              AppStackHome(
                changeScreen:()=> HomeBaseScreen.changeBaseWidget(context, ProtocolsScreen(),"Protocols"),
                image: Image.asset(
                  'images/group_225.png',
                  color: AppColors.SHADOW_CONTAINER_COLOR,
                ),
                text: AppLocalizations.of(context).translate("Protocols"),
                color: AppColors.SHADOW_CONTAINER_COLOR,
              ),
              AppStackHome(
                changeScreen:()=> HomeBaseScreen.changeBaseWidget(context, ShiftsScreen(),"Shifts"),
                image: Image.asset(
                  'images/noun_time_3182552.png',
                  color: AppColors.SHADOW_CONTAINER_COLOR,
                ),
                text: AppLocalizations.of(context).translate("Shifts"),
                color: AppColors.SHADOW_CONTAINER_COLOR,
              ),
              AppStackHome(
                changeScreen:()=> HomeBaseScreen.changeBaseWidget(context, PermanencsScreen(),"Permanence"),
                image: Image.asset(
                  'images/group_235.png',
                  color: AppColors.SHADOW_CONTAINER_COLOR,
                ),
                text: AppLocalizations.of(context).translate("Permanence"),
                color: AppColors.SHADOW_CONTAINER_COLOR,
              ),
              AppStackHome(
                changeScreen:()=> HomeBaseScreen.changeBaseWidget(context, AdditionalServicesScreen(),"AdditionalServices"),
                image: Image.asset(
                  'images/noun_more_1751209.png',
                  color: AppColors.HINT_TEXT_STACK_HOME_COLOR,
                ),
                text: AppLocalizations.of(context).translate("AdditionalServices"),
                color: AppColors.HINT_TEXT_STACK_HOME_COLOR,
              ),

            ],
          ),

        ],
      ),
    );
  }

}



