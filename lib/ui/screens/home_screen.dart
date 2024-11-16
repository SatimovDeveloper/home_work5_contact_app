import 'dart:math';

import 'package:flutter/material.dart';
import 'package:home_work5_contact_app/config/colors.dart';
import 'package:home_work5_contact_app/config/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int randomNumber() {
    return Random().nextInt(90) + 10;
  }

  String generateRandomName(int length) {
    const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    final random = Random();
    String name = '';

    for (int i = 0; i < length; i++) {
      int index = random.nextInt(letters.length); // Tasodifiy indeks
      name += letters[index]; // Tasodifiy harfni qo'shish
    }

    return name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppText.homeTitle,
            style: TextStyle(
                color: AppColor.borderColor,
                fontSize: 24,
                fontWeight: FontWeight.w700),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/logout.png",
                    width: 28,
                    height: 28,
                    fit: BoxFit.cover,
                  )),
            )
          ],
        ),
        body: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 24,
                            foregroundImage:
                                AssetImage("assets/images/person2.png"),
                            backgroundColor: Colors.grey.withOpacity(.5),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                generateRandomName(Random().nextInt(7) + 3),
                                style: TextStyle(
                                    color: AppColor.textColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                  "+99890123${randomNumber()}${randomNumber()}",
                                  style: TextStyle(
                                      color: AppColor.textColor.withOpacity(.5),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.more_horiz,
                                color: AppColor.borderColor,
                              ))
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: AppColor.borderColor.withOpacity(0.5),
                    )
                  ],
                ),
              );
            },
            itemCount: 100),
        floatingActionButton: SizedBox(
          width: 60,
          height: 60,
          child: FloatingActionButton(
            onPressed: () {},
            shape: const CircleBorder(),
            backgroundColor: AppColor.buttonColor,
            child: Icon(
              Icons.add_rounded,
              size: 56,
              color: Colors.white,
            ),
          ),
        ));
  }
}
