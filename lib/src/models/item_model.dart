import 'dart:convert';

import 'package:news/generated/json/base/json_convert_content.dart';
import 'package:news/src/models/dto_item_entity.dart';

class ModelItem {

  final int id;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final bool deleted;
  final String url;
  final List<dynamic> kids;
  final int parent;
  final int score;
  final String title;
  final int descendants;

  ModelItem.fromDto(DtoItemEntity dto) : id = dto.id,
        deleted = dto.deleted ?? false,
        url = dto.url,
        dead = dto.dead ?? false,
        parent = dto.parent,
        type = dto.type,
        by = dto.by,
        time = dto.time,
        text = dto.text ?? '',
        kids = dto.kids ?? [],
        score = dto.score,
        title = dto.title,
        descendants = dto.descendants ?? 0;

  ModelItem.fromDbMap(Map<String, dynamic> dbMap) :
        id = dbMap['id'],
        deleted = dbMap['deleted'] == 1,
        url = dbMap['url'],
        dead = dbMap['dead'] == 1,
        parent = dbMap['parent'],
        type = dbMap['type'],
        by = dbMap['by'],
        time = dbMap['time'],
        text = dbMap['text'],
        kids = jsonDecode(dbMap['kids'] ?? "[]"),
        score = dbMap['score'],
        title = dbMap['title'],
        descendants = dbMap['descendants'];

  Map<String, dynamic> toMapForDb(){
    return <String, dynamic>{
      "id": id,
      "deleted": deleted ? 1 : 0,
      "url": url,
      "dead": dead ? 1 : 0,
      "parent": parent,
      "type": type,
      "by": by,
      "time": time,
      "text": text,
      "kids": jsonEncode(kids),
      "score": score,
      "title": title,
      "descendants": descendants
    };
  }
}
