import 'package:flutter/material.dart';
import 'package:flutter_course_october/webview_screen.dart';

Widget buildNewsItem(model, context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => WebViewScreen(url: model.url),
      ));
    },
    child: Card(
      //   color: Colors.amber,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 5.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            "${model?.urlToImage}",
            errorBuilder: (context, error, stackTrace) =>
                Image.asset("images/3.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${model?.title}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    ),
  );
}
