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
        deleted = dto.deleted,
        url = dto.url,
        dead = dto.dead,
        parent = dto.parent,
        type = dto.type,
        by = dto.by,
        time = dto.time,
        text = dto.text,
        kids = dto.kids,
        score = dto.score,
        title = dto.title,
        descendants = dto.descendants;
}
