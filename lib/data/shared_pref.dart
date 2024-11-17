import 'package:shared_preferences/shared_preferences.dart';

class MyPref{
  static final MyPref _instance = MyPref._internal();
  late final SharedPreferences _pref;
  MyPref._internal();
  factory MyPref(){
    return _instance;
  }

  Future<void> initMyPref() async{
    _pref = await SharedPreferences.getInstance();
  }

  Future<void> saveLoginPassword(String login, String password) async{
    await _pref.setString("login", login);
    await _pref.setString("password", password);
  }

  Future<void> saveContact(List<Map<String, String>> ls) async{
     List<String> tempNames = [];
    List<String> tempPhones = [];
    for (var item in ls) {
      tempNames.add(item["name"] ?? "default");
      tempPhones.add(item["phone"] ?? "+12345678998");
    }
    await _pref.setStringList("names", tempNames);
    await _pref.setStringList("phones", tempPhones);
  }

  List<Map<String, String>> getContact(){
    List<Map<String, String>> ls = [];
    var tempNames = _pref.getStringList("names") ?? [];
    var tempPhones = _pref.getStringList("phones") ?? [];

    if(tempPhones.isEmpty || tempNames.isEmpty){
      return ls;
    }

    int minLength = tempNames.length < tempPhones.length ? tempNames.length : tempPhones.length;
    for(int i=0; i < minLength; i++) {
      ls.add({"name":tempNames[i],"phone":tempPhones[i]});
    }
    return ls;
  }

  String getLogin(){
    return _pref.getString("login") ?? "@";
  }

  String getPassword(){
    return _pref.getString("password") ?? "@";
  }

}