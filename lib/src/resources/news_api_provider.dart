import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:news/generated/json/base/json_convert_content.dart';
import 'package:news/src/models/dto_item_entity.dart';
import 'package:news/src/models/item_model.dart';

class NewsApiProvider{
  static const _ROOT = "https://hacker-news.firebaseio.com/v0/";
  static const _TOP_URL = "topstories.json";

  Client client = Client();

  fetchTopIds() async {
    final response = await client.get("$_ROOT$_TOP_URL");
    final ids = json.decode(response.body);
    return ids;
  }

  fetchItem(int id) async {
    final response = await client.get("${_ROOT}item/$id.json");
    DtoItemEntity dto = JsonConvert.fromJsonAsT<DtoItemEntity>(json.decode(response.body));
    return ModelItem.fromDto(dto);
  }
}