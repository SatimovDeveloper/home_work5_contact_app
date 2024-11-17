import 'dart:math';

import 'package:flutter/material.dart';
import 'package:home_work5_contact_app/config/colors.dart';
import 'package:home_work5_contact_app/config/strings.dart';
import 'package:home_work5_contact_app/data/shared_pref.dart';
import 'package:home_work5_contact_app/repository/repository.dart';
import 'package:home_work5_contact_app/ui/screens/add_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final MyPref _myPref;
   List<Map<String, String>> contacts = [{"name":"dilshod","phone":"+998900997530"}];


  Future<void> init() async {
    _myPref = MyPref();
    await _myPref.initMyPref();
  }

  @override
  void initState() {
    super.initState();
    init();
    contacts = _myPref.getContact();
  }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   _myPref.saveContact(contacts);
  // }



  //
  // int randomNumber() {
  //   return Random().nextInt(90) + 10;
  // }
  //
  // String generateRandomName(int length) {
  //   const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  //   final random = Random();
  //   String name = '';
  //
  //   for (int i = 0; i < length; i++) {
  //     int index = random.nextInt(letters.length); // Tasodifiy indeks
  //     name += letters[index]; // Tasodifiy harfni qo'shish
  //   }
  //
  //   return name;
  // }

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
        body: contacts.isEmpty
            ? Center(
                child: Image.asset(
                  "assets/images/empty_list.png",
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                  color: Colors.grey.withOpacity(.6),
                ),
              )
            : ListView.builder(
                itemCount: contacts.length,
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
                                    contacts[index]["name"]!,
                                    style: TextStyle(
                                        color: AppColor.textColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Text(
                                      contacts[index]["phone"]!,
                                      style: TextStyle(
                                          color: AppColor.textColor
                                              .withOpacity(.5),
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
              ),
        floatingActionButton: SizedBox(
          width: 60,
          height: 60,
          child: FloatingActionButton(
            onPressed: () async {
              final  newContact = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddScreen()));

            if(newContact is Map<String, String>) {
              setState(() {
                contacts.add(newContact);
                _myPref.saveContact(contacts);
              });
            }

            },
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
