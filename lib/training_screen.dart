import 'package:flutter/material.dart';
import 'package:flutter_course_october/constants.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Find Places"),
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_alt)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
      body: ListView.separated(
        itemCount: users.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return buildItem(context, users[index]);
        },
      ),
    );
  }

  Container buildItem(BuildContext context, model) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(12.0),
      child: Column(children: [
        Image.asset(model["image"]),
        const SizedBox(
          height: 5,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Door of toma",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star_half),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(model["name"]), const Text("7.6mi")],
        )
      ]),
    );
  }
}
