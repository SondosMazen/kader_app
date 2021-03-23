// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:kader_app/api/api_controller.dart';
// import 'package:kader_app/custom_widgets/app_bar_screen.dart';
// import 'package:kader_app/main.dart';
// import 'package:kader_app/models/result.dart';
// import 'package:kader_app/utlies/app_colors.dart';
// import 'package:kader_app/utlies/size_config.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// void main() => runApp(MainApp());
//
// class DetailsNewsScreen extends StatefulWidget {
//   @override
//   _DetailsNewsScreenState createState() => _DetailsNewsScreenState();
// }
//
// class _DetailsNewsScreenState extends State<DetailsNewsScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   Future<List<Result>> _resultListFuture;
//   List<Result> _result = [];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _resultListFuture = ApiController().indexPost();
//     //Future.delayed(Duration(seconds: 3), () {
//     //   Navigator.pushReplacementNamed(context, '/protocols_screen');
//     //   //Navigator.pushReplacementNamed(context, '/administrative_services_screen');
//     // });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       key: _scaffoldKey,
//       appBar: AppBar(
//           leading: Builder(
//             builder: (BuildContext context) {
//               return IconButton(
//                   icon: const Icon(Icons.arrow_back),
//                   onPressed: () {
//                     Navigator.pushReplacementNamed(context, '/home_screen');
//                     //Navigator.pop(context, true);
//                   });
//             },
//           ),
//           backgroundColor: AppColors.MAIN_COLOR,
//           title: Center(
//               child: Text(
//                 "تفاصيل الخبر",
//               )),
//           actions: [
//             IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
//           ]),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsetsDirectional.only(
//             start: SizeConfig.scaleWidth(16),
//             end: SizeConfig.scaleWidth(16),
//             top: SizeConfig.scaleHeight(18),
//             // bottom: SizeConfig.scaleHeight(10),
//           ),
//           decoration: BoxDecoration(
//             color: AppColors.DOTS_HORIZANTAL_COLOR,
//           ),
//           child: FutureBuilder(
//             future: _resultListFuture,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(
//                   child: CircularProgressIndicator(
//                     backgroundColor: Colors.blue,
//                     strokeWidth: SizeConfig.scaleWidth(1),
//                   ),
//                 );
//               } else {
//                 if (snapshot.hasError || snapshot.data == null) {
//                   return Center(
//                     child: Text("ERROR"),
//                   );
//                 } else {
//                   _result = snapshot.data;
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         _result[1].postTitle,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w500,
//                           fontSize: SizeConfig.scaleTextFont(20),
//                         ),
//                       ),
//                       SizedBox(
//                         height: SizeConfig.scaleHeight(5),
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             _result[1].postDate,
//                             style: TextStyle(
//                               color: AppColors.HINT_TEXT_STACK_HOME_COLOR,
//                               fontWeight: FontWeight.w400,
//                               fontSize: SizeConfig.scaleTextFont(14),
//                             ),
//                           ),
//                           SizedBox(
//                             width: SizeConfig.scaleWidth(5),
//                           ),
//                           // Text(
//                           //   "08:55:27",
//                           //   style: TextStyle(
//                           //     color: AppColors.HINT_TEXT_STACK_HOME_COLOR,
//                           //     fontWeight: FontWeight.w400,
//                           //     fontSize: SizeConfig.scaleTextFont(14),
//                           //   ),
//                           // ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: SizeConfig.scaleHeight(16),
//                       ),
//                       Container(
//                         margin: EdgeInsetsDirectional.zero,
//                         height: SizeConfig.scaleHeight(215),
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: NetworkImage(_result[1].imageUrl),
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: SizeConfig.scaleHeight(16),
//                       ),
//                       Text(
//                         _result[1].postContent,
//                         style: TextStyle(
//                           color: AppColors.HINT_TEXT_STACK_HOME_COLOR,
//                           fontWeight: FontWeight.w400,
//                           fontSize: SizeConfig.scaleTextFont(14),
//                         ),
//                       ),
//                       SizedBox(
//                         height: SizeConfig.scaleHeight(16),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           _launchURL();
//                         },
//                         child: Center(
//                           child: Text(
//                             "للانتقال لصفحة الموقع اضغط هنا",
//                             style: TextStyle(
//                               color: AppColors.MAIN_COLOR,
//                               fontWeight: FontWeight.w500,
//                               fontSize: SizeConfig.scaleTextFont(20),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: SizeConfig.scaleHeight(20),
//                       ),
//                     ],
//                   );
//                 }
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// _launchURL() async {
//   const url = 'https://www.moh.gov.ps/portal/category/it-unit/';
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
