import 'package:flutter/material.dart';
import 'package:kader_app/utlies/app_colors.dart';
import 'package:kader_app/utlies/size_config.dart';


class AppSearchTextFeild extends StatelessWidget {
  final String hint;
  TextEditingController _searchTextController;

  AppSearchTextFeild({this.hint = "بحث"});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.scaleHeight(36),
      child: TextField(
        controller: _searchTextController,
       // onChanged: searchOperation,
        style: TextStyle(
          fontSize: SizeConfig.scaleTextFont(16),
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.w500,
          color: AppColors.HINT_TEXTFEILD_COLOR,
        ),
        decoration: InputDecoration(

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          contentPadding: EdgeInsetsDirectional.only(
            start: SizeConfig.scaleWidth(20),
          ),
          suffixIcon: Icon(
            Icons.search,
            color: AppColors.HINT_TEXTFEILD_COLOR,
          ),
          // prefixIcon: Icon(
          //   Icons.search,
          //   color: AppColors.HINT_TEXTFEILD_COLOR,
          // ),
          hintText: hint,
          // prefixText: ' ',
          hintStyle: TextStyle(
            fontSize: SizeConfig.scaleTextFont(16),
            fontFamily: 'Tajawal',
            color: AppColors.HINT_TEXTFEILD_COLOR,
            fontWeight: FontWeight.w500,

          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(26),
            borderSide: BorderSide(
              color: AppColors.HINT_TEXTFEILD_COLOR,
              width: SizeConfig.scaleWidth(1),
            ),
          ),
          //getBorder(AppColors.HINT_TEXTFEILD_COLOR),
          focusedBorder: getBorder(),
        ),

      ),
    );
  }

  OutlineInputBorder getBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(26),
      borderSide: BorderSide(
        color: AppColors.HINT_TEXTFEILD_COLOR,
        width: SizeConfig.scaleWidth(1),
      ),
    );
  }
  // void searchOperation(String searchText){
  //   searchResult.clear();
  //   if(_isSearching != null){
  //     for(int i=0; i < _list.length; i++){
  //       String data = _list[i];
  //       if(data.toLowerCase().contains(searchText.toLowerCase())){
  //         searchResult.add(data);
  //       }
  //     }
  //   }
  // }
  // Widget _editTitleTextField() {  if (_isEditingText)    return Center(
  //   child: TextField(        onSubmitted: (newValue){          setState(() {
  //     initialText = newValue;            _isEditingText =false;          });        },
  //     autofocus: true,        controller: _editingController,      ),    );  return InkWell(
  //     onTap: () {
  //   setState(() {
  //     _isEditingText = true;      });    },
  //   child: Text(  initialText,  style: TextStyle(
  //   color: Colors.black,    fontSize: 18.0,  ), );}
}
