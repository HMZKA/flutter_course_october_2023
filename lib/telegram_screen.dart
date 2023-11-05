import 'package:flutter/material.dart';
import 'package:flutter_course_october/constants.dart';

class TelegramScreen extends StatelessWidget {
  const TelegramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 48, 84),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 48, 84),
        elevation: 0.0,
        title: const Text("Telegram"),
        leading: const Icon(Icons.menu),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: users.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            thickness: 2,
            color: Colors.white,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return buildChat(users[index]);
        },
      ),
    );
  }

  Padding buildChat(model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(model["image"]),
              ),
              const CircleAvatar(
                radius: 8,
                backgroundColor: Color.fromARGB(255, 3, 48, 84),
              ),
              const CircleAvatar(
                radius: 7.5,
              )
            ],
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    model["name"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 2.5,
                  ),
                  Text(
                    model["message"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  )
                ],
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          const Text(
            "14:00",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
