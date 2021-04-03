// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:kader_app/models/base_generic_array_response.dart';
// import 'package:kader_app/models/base_generic_object_response.dart';
//
// enum RequestType { GET, POST, PUT, DELETE }
// enum ResponseType { OBJECT, LIST }
//
// class ApiBuilder {
//   String _url;
//   Map<String, dynamic> _body = Map<String, dynamic>();
//   RequestType _requestType;
//   ResponseType _responseType;
//   bool _withToken = false;
//   String _token;
//
//   ApiBuilder._();
//
//   static ApiBuilder _instance;
//
//   static ApiBuilder get initialize {
//     if (_instance != null) return _instance;
//
//     return _instance = ApiBuilder._();
//   }
//
//   ApiBuilder requestType(RequestType requestType) {
//     this._requestType = requestType;
//     return this;
//   }
//
//   ApiBuilder url(String url) {
//     this._url = url;
//     return this;
//   }
//
//   ApiBuilder addParam(String key, dynamic value) {
//     this._body[key] = value;
//     return this;
//   }
//
//   ApiBuilder addToken(String token) {
//     this._withToken = true;
//     this._token = token;
//     return this;
//   }
//
//   ApiBuilder responseType(http.Response responseType) {
//     this._responseType = _responseType;
//     return this;
//   }
//
//   Future<bool> performProcessRequest() async {
//     var response = await _initializeRequest();
//     if (response.statusCode < 400) {
//       print(response.statusCode);
//       // var genericResponse = BaseResponse.fromJson(jsonDecode(response.body));
//       return true;
//     } else {
//       print('Request failed with status: ${response.body}.');
//     }
//     return false;
//   }
//
//   // Future<T> performObjectRequest<T>() async {
//   //   var response = await _initializeRequest();
//   //   if (response.statusCode == 200) {
//   //     print(response.statusCode);
//   //     var genericResponse =
//   //     BaseGenericObjectResponse<T>.fromJson(jsonDecode(response.body));
//   //     return genericResponse.object;
//   //   } else {
//   //     print('Request failed with status: ${response.statusCode}.');
//   //   }
//   // }
//   //
//   // Future<List<T>> performListRequest<T>() async {
//   //   var response = await _initializeRequest();
//   //   if (response.statusCode == 200) {
//   //     var genericResponse =
//   //     BaseGenericArrayResponse<T>.fromJson(jsonDecode(response.body));
//   //     return genericResponse.list;
//   //   } else {
//   //     print('Request failed with status: ${response.statusCode}.');
//   //   }
//   // }
//
//   Future<http.Response> _initializeRequest() async {
//     if (_requestType == RequestType.GET) {
//       return await http.get(_url, headers: _generateHeader());
//     } else if (_requestType == RequestType.POST) {
//       return await http.post(_url, headers: _generateHeader(), body: _body);
//     } else if (_requestType == RequestType.PUT) {
//       return await http.put(_url, headers: _generateHeader(), body: _body);
//     } else {
//       return await http.delete(_url, headers: _generateHeader());
//     }
//   }
//
//   Map<String, String> _generateHeader() {
//     return _withToken
//         ? {
//       'Authorization': _token,
//       'X-Requested-With': 'XMLHttpRequest',
//     }
//         : {
//       'X-Requested-With': 'XMLHttpRequest',
//     };
//   }
// }
