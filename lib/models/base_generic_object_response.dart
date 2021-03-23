//
// import 'package:kader_app/models/base_response.dart';
// import 'package:kader_app/models/result.dart';
//
// class BaseGenericObjectResponse<T> extends BaseResponse {
//   T object;
//
//   BaseGenericObjectResponse.fromJson(Map<String, dynamic> json)
//       : super.fromJson(json){
//     if (json['data'] != null) {
//         if(T == Result){
//           object = Result.fromJson(json) as T;
//
//       }
//
//     }
//   }
// }