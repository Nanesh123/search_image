import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:search_image/core/constant.dart';
import 'package:search_image/model/imagemodel.dart';

class Repo {
  static Future<List<Imagemodel>> fetchApi(String search, int limit) async {
    try {
      final Response response = await Dio(BaseOptions()).get(
          '${AppConstant().apiUrl}&q=$search&image_type=photo&per_page=10&page=$limit');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = response.data['hits'] as List;
        return result
            .map<Imagemodel>((imageItem) => Imagemodel.fromJson(imageItem))
            .toList();
      } else {
        throw Exception("Failed!");
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }
}
