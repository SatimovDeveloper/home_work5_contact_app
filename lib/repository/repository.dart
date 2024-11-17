import 'package:home_work5_contact_app/data/shared_pref.dart';

class Repository{
  static final List _data = [];

static void setData(String name, String phone){
    _data.add({"name":name, "phone":phone});
}

static List getData(){
    return _data;
}





}