import 'package:news/generated/json/base/json_convert_content.dart';

class DtoItemEntity with JsonConvert<DtoItemEntity> {
	String by;
	int descendants;
	int id;
	List<int> kids;
	List<int> parts;
	int score;
	String text;
	int time;
	String title;
	String type;
	bool dead;
	bool deleted;
	String url;
	int parent;
}
