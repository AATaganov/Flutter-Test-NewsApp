import 'package:news/src/models/dto_item_entity.dart';

dtoItemEntityFromJson(DtoItemEntity data, Map<String, dynamic> json) {
	if (json['by'] != null) {
		data.by = json['by']?.toString();
	}
	if (json['descendants'] != null) {
		data.descendants = json['descendants']?.toInt();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['kids'] != null) {
		data.kids = json['kids']?.map((v) => v?.toInt())?.toList()?.cast<int>();
	}
	if (json['parts'] != null) {
		data.parts = json['parts']?.map((v) => v?.toInt())?.toList()?.cast<int>();
	}
	if (json['score'] != null) {
		data.score = json['score']?.toInt();
	}
	if (json['text'] != null) {
		data.text = json['text']?.toString();
	}
	if (json['time'] != null) {
		data.time = json['time']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}

	if (json['dead'] != null) {
		data.dead = json['dead']?.toBool();
	}
	if (json['deleted'] != null) {
		data.deleted = json['deleted']?.toBool();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['parent'] != null) {
		data.parent = json['parent']?.toInt();
	}
	return data;
}

Map<String, dynamic> dtoItemEntityToJson(DtoItemEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['by'] = entity.by;
	data['descendants'] = entity.descendants;
	data['id'] = entity.id;
	data['kids'] = entity.kids;
	data['parts'] = entity.parts;
	data['score'] = entity.score;
	data['text'] = entity.text;
	data['time'] = entity.time;
	data['title'] = entity.title;
	data['type'] = entity.type;

	data['dead'] = entity.dead;
	data['deleted'] = entity.deleted;
	data['url'] = entity.url;
	data['parent'] = entity.parent;
	return data;
}