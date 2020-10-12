import 'package:news/src/models/item_model.dart';
import 'package:news/src/resources/news_api_provider.dart';
import 'package:news/src/resources/news_db_provider.dart';

class Repository{
  List<Source> sourcesList = <Source>[
    dbProvider,
    NewsApiProvider()
  ];
  List<Cache> cachesList = <Cache>[
    dbProvider
  ];
  // NewsDbProvider dbProvider = NewsDbProvider();
  // NewsApiProvider apiProvider = NewsApiProvider();

  Future<List<int>> fetchTopIds(){
    for(Source source in sourcesList){
      var items = source.fetchTopIds();
      print("ITEMS FOR SOURCE: $source items: $items");
      if(items != null){
        print("IN RETURN $items");
        return items;
      }
    }
    print("IN EXTERNAL RETURN");
    return null;
  }

  Future<ModelItem> fetchItem(int itemId) async {
    ModelItem item;
    print("fetchItem: $itemId");
    for(Source source in sourcesList){
      item = await source.fetchItem(itemId);
      if(item != null){
        for(Cache cache in cachesList){
          if(!(source is Cache)) {
            cache.addItem(item);
          }
        }
        break;
      }
    }
    print("fetchedItem: $item");
    return item;
  }

  clearCache() async{
    for( var cache in cachesList) {
      await cache.clear();
    }
  }
}

abstract class Source {
  Future<List<int>> fetchTopIds();
  Future<ModelItem> fetchItem(int id);
}

abstract class Cache {
  Future<int> addItem(ModelItem item);
  Future<int> clear();
}