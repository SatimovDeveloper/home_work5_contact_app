import 'dart:math';

import 'package:flutter/material.dart';
import 'package:home_work5_contact_app/config/colors.dart';
import 'package:home_work5_contact_app/config/strings.dart';
import 'package:home_work5_contact_app/data/shared_pref.dart';
import 'package:home_work5_contact_app/repository/repository.dart';
import 'package:home_work5_contact_app/ui/screens/add_screen.dart';
import 'package:home_work5_contact_app/ui/screens/edit_screen.dart';
import 'package:home_work5_contact_app/ui/screens/login_screen.dart';
import 'package:home_work5_contact_app/ui/screens/splash_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final MyPref _myPref;
  List<Map<String, String>> contacts = [
    {"name": "dilshod", "phone": "+998900997530"}
  ];

  Future<void> init() async {
    _myPref = MyPref();
    await _myPref.initMyPref();
  }

  Future<void> nextEditScreen(int index) async {
    var contact = {
      "name": contacts[index]["name"].toString(),
      "phone": contacts[index]["phone"].toString(),
    };
    var newContact = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditScreen(
                  contact: contact,
                )));
    setState(() {
      contacts[index]["name"] = newContact["name"];
      contacts[index]["phone"] = newContact["phone"];
      _myPref.saveContact(contacts);
    });
  }

  void showAppDialogDelete(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            insetPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.only(top: 16),
            contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            actionsPadding: EdgeInsets.only(bottom: 16, right: 16, top: 12),
            title: Row(
              children: [
                SizedBox(width: 20),
                Icon(Icons.delete, color: Colors.red, size: 32),
                SizedBox(width: 12),
                Text(
                  'Delete contact',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: AppColor.borderColor),
                ),
                Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.cancel_rounded,
                    color: Colors.red,
                    size: 24,
                  ),
                ),
              ],
            ),
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text.rich(
                TextSpan(
                  text: 'Do you want to delete ',
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColor.borderColor,
                      fontWeight: FontWeight.w400),
                  children: [
                    TextSpan(
                      text: contacts[index]["name"],
                      style: TextStyle(
                          color: AppColor.borderColor,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '?'),
                  ],
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    contacts.removeAt(index);
                    _myPref.saveContact(contacts);
                  });
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Text(
                    'Delete',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          );
        });
  }

  void showDialogLogOut() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            content: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/logout.png",
                        width: 24,
                        height: 24,
                        fit: BoxFit.cover,
                      ),
                      Spacer(),
                      Text(
                        "Sign Out",
                        style: TextStyle(
                            color: AppColor.borderColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {Navigator.pop(context);},
                        icon: Icon(
                          Icons.cancel_rounded,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Text.rich(
                    TextSpan(
                      text: "do you want",
                      style: TextStyle(
                          color: AppColor.borderColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                            text: "Unregister",
                            style: TextStyle(
                                color: AppColor.borderColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w800)),
                        TextSpan(
                            text: " or ",
                            style: TextStyle(
                                color: AppColor.borderColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                          text: "logout",
                          style: TextStyle(
                              color: AppColor.borderColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              alignment: Alignment.center,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                      color: Color(0xffeb5757), width: 1)),
                            ),
                            onPressed: () {},
                            child: Text(
                              "UnRegister",
                              style: TextStyle(
                                  color: Color(0xffeb5757),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            )),
                        Spacer(),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              alignment: Alignment.center,
                              backgroundColor: Color(0xffeb5757),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide.none),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    init();
    contacts = _myPref.getContact();
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
                  onPressed: () {
                    showDialogLogOut();
                  },
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
                  return Column(
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
                                        color:
                                            AppColor.textColor.withOpacity(.5),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),

                            PopupMenuButton(
                                icon: Icon(Icons.more_horiz),
                                onSelected: (String value) {
                                  switch (value) {
                                    case "edit":
                                      {
                                        nextEditScreen(index);
                                        break;
                                      }
                                    case "delete":
                                      {
                                        showAppDialogDelete(index);
                                        break;
                                      }
                                    default:
                                      {
                                        break;
                                      }
                                  }
                                },
                                itemBuilder: (context) =>
                                    <PopupMenuEntry<String>>[
                                      PopupMenuItem<String>(
                                          value: "edit",
                                          child: Row(
                                            children: [
                                              Icon(Icons.edit),
                                              SizedBox(
                                                width: 12,
                                              ),
                                              Text("Edit")
                                            ],
                                          )),
                                      PopupMenuItem(
                                          value: "delete",
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                "Delete",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              )
                                            ],
                                          ))
                                    ]),
                            // IconButton(
                            //     onPressed: () {},
                            //     icon: Icon(
                            //       Icons.more_horiz,
                            //       color: AppColor.borderColor,
                            //     ))
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: AppColor.borderColor.withOpacity(0.5),
                      )
                    ],
                  );
                },
              ),
        floatingActionButton: SizedBox(
          width: 60,
          height: 60,
          child: FloatingActionButton(
            onPressed: () async {
              final newContact = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddScreen()));

              if (newContact is Map<String, String>) {
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
