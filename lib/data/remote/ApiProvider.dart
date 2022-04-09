import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/item_model.dart';
import '../model/movie_detail_model.dart';
import '../model/movie_image_model.dart';

class ApiProvider {
  static late ApiProvider _instance;

  final _apiKey = '583b84cf614e7b7c0f0d1f4138399cd5';
  final _baseURL = "http://api.themoviedb.org/3/movie";

  static const int connectTimeOut = 10 * 1000;
  static const int receiveTimeout = 15 * 1000;

  Dio? _client;

  ApiProvider.internal() {
    if (_client == null) {
      BaseOptions options = BaseOptions();
      options.connectTimeout = connectTimeOut;
      options.receiveTimeout = receiveTimeout;
      options.baseUrl = _baseURL;
      _client = Dio(options);
      _client!.interceptors.add(LogInterceptor(
          responseBody: true,
          requestHeader: true,
          responseHeader: true,
          request: true));
    }
  }

  Future<ItemModel> fetchMovieList(String type) async {
    final response = await _client!
        .get("$_baseURL/$type?api_key=$_apiKey");
    // print(response.request.url);
    // print(response.body.toString());
    print("Status ${response.statusCode}");
    if (response.statusCode == 200) {
      print("Hihi ");
      return ItemModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<MovieDetailModel> fetchMovieDetail(int movieId) async {
    final response = await _client!
        .get("$_baseURL/$movieId?api_key=$_apiKey");
    // print(response.body.toString());
    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load post');
    }
  }


  Future<MovieImageModel> fetchMovieImages(int movieId) async {
    final response = await _client!
        .get("$_baseURL/$movieId/images?api_key=$_apiKey");
    // print(response.body.toString());
    if (response.statusCode == 200) {
      return MovieImageModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Dio get client => _client!;

  static const String GET = "get";
  static const String POST = "post";

  // static String getBaseUrl() {
  //   return _baseURL;
  // }

  void get(String url, Function callBack,
      {Map<String, String>? params,
      Function? errorCallBack,
      CancelToken? token}) async {
    _request(url, callBack,
        method: GET,
        params: params,
        errorCallBack: errorCallBack,
        token: token);
  }

  void _request(
    String url,
    Function callBack, {
    String? method,
    Map<String, String>? params,
    FormData? formData,
    Function? errorCallBack,
    ProgressCallback? progressCallBack,
    CancelToken? token,
  }) async {
    if (params != null && params.isNotEmpty) {
      print("<net> params :" + params.toString());
    }
  }

  //处理异常
  static void _handError(Function errorCallback, String errorMsg) {
    if (errorCallback != null) {
      errorCallback(errorMsg);
    }
    print("<net> errorMsg :" + errorMsg);
  }
}
