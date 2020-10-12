import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: buildContainer(),
          subtitle: buildContainer(),
        ),
        Divider(height: 8.0,)
      ],
    );
  }

  Widget buildContainer({double width = 150.0, double height = 24.0}){
    return Container(
      color: Colors.grey[300],
      height: height,
      width: width,
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
    );
  }

}