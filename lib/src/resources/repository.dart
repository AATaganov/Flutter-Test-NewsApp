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
    sourcesList.forEach((element) {
      var items = element.fetchTopIds();
      if(items != null){
        return items;
      }
    });
    return null;
  }

  Future<ModelItem> fetchItem(int itemId) async {
    ModelItem item;
    for(Source source in sourcesList){
      item = await source.fetchItem(itemId);
      if(item != null){
        for(Cache cache in cachesList){
          cache.addItem(item);
        }
        break;
      }
    }
    return item;
  }
}

abstract class Source {
  Future<List<int>> fetchTopIds();
  Future<ModelItem> fetchItem(int id);
}

abstract class Cache {
  Future<int> addItem(ModelItem item);
}