import 'dart:io';

import 'package:news/src/models/item_model.dart';
import 'package:news/src/resources/repository.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class NewsDbProvider implements Source, Cache{
  static const TABLE_ITEMS = "Items";
  Database db;
  NewsDbProvider(){
    init();
  }

  void init() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, "items.db");
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb.execute("""
          CREATE TABLE $TABLE_ITEMS
            (
              id INTEGER PRIMARY KEY,
              type TEXT,
              by TEXT,
              time INTEGER,
              text TEXT,
              parent INTEGER,
              kids BLOB,
              dead INTEGER,
              deleted INTEGER,
              url TEXT,
              score INTEGER,
              title TEXT,
              descendants INTEGER
            )
            """);

    },);
  }

  Future<ModelItem> fetchItem(int id) async {
    var dbMaps = await db?.query(TABLE_ITEMS,
        columns: null,
    where: "id = ?",
    whereArgs: [id]);
    if(dbMaps == null){
      return null;
    }
    if(dbMaps.length > 0){
      return ModelItem.fromDbMap(dbMaps.first);
    }
    return null;
  }

  Future<int> addItem(ModelItem item){
    return db.insert(TABLE_ITEMS, item.toMapForDb());
  }

  @override
  Future<List<int>> fetchTopIds() {
    return null;
  }
}
final dbProvider = NewsDbProvider();