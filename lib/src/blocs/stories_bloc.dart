import 'package:flutter/cupertino.dart';
import 'package:news/src/models/item_model.dart';
import 'package:news/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class StoriesBloc{
  final _repository = Repository();
  final _topIds = PublishSubject<List<int>>();
  final _itemsOutput = BehaviorSubject<Map<int, Future<ModelItem>>>();
  final _itemsFetcher = PublishSubject<int>();


  Stream<List<int>> get topIds => _topIds.stream;
  Stream<Map<int, Future<ModelItem>>> get itemModels => _itemsOutput.stream;

  Function(int) get fetchItem => _itemsFetcher.sink.add;

  StoriesBloc(){
    _itemsFetcher.stream.transform(_itemsTransformer()).pipe(_itemsOutput);
  }

  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  clearCache() {
    return _repository.clearCache();
  }

  _itemsTransformer() {
    return ScanStreamTransformer(
        (Map<int, Future<ModelItem>> cache, int id, index) {
          print("Index: $index");
          cache[id] = _repository.fetchItem(id);
          return cache;
        },
      <int, Future<ModelItem>>{}
    );
  }

  dispose(){
    _topIds.close();
    _itemsFetcher.close();
    _itemsOutput.close();
  }

}