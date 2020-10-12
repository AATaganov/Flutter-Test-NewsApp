import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/src/blocs/stories_provider.dart';
import 'package:news/src/models/item_model.dart';
import 'package:news/src/widgets/loading_container.dart';

class NewsListTile extends StatelessWidget {
  final int itemId;

  NewsListTile({this.itemId});

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    return StreamBuilder(
      stream: bloc.itemModels,
      builder: (context, AsyncSnapshot<Map<int, Future<ModelItem>>> snapshot) {
        if (!snapshot.hasData) {
          return LoadingContainer();
        }
        return FutureBuilder(
          future: snapshot.data[itemId],
          builder: (context, AsyncSnapshot<ModelItem> itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return LoadingContainer();
            } else {
              return buildTile(itemSnapshot.data);
              return Text(itemSnapshot.data.title);
            }
          },
        );
      },
    );
  }

  Widget buildTile(ModelItem item){

    return Column(
      children: [
        ListTile(
          title: Text(item.title),
          subtitle: Text("${item.score} votes"),
          trailing: Column(
            children: [
              Icon(Icons.comment),
              Text('${item.descendants}')
            ],
          ),
        ),
        Divider(height: 8.0,)
      ],
    );
  }
}