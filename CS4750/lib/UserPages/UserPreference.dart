import 'package:shared_preferences/shared_preferences.dart';

class UserPref
{
  static late SharedPreferences _preferences;
  //locally stored info
  static const AID="AuthID";
  static const UID="UserID";
  static const UserN="UserName";
  static const UserE="UserEmail";

  static const UserPic= "UserPic";
  static List<String> imageUrlList=[];

  static Future init() async=>
      _preferences= await SharedPreferences.getInstance();
  //setting uid,username,useremail
  static Future setUserID(String userid) async
  => await _preferences.setString(UID, userid);
  static Future setUserAID(String Auid) async
  => await _preferences.setString(AID, Auid);
  static Future setUserName(String userName) async
  =>await _preferences.setString(UserN, userName);
  static Future setUserEmail(String userE) async
  =>await _preferences.setString(UserE, userE);
  static Future setUserPic(String userP) async
  =>await _preferences.setString(UserPic, userP);

  static Future setImageUrlList(String userP) async
  {
    imageUrlList.add(userP);
  }



  //getting
  static String? getAuthID() => _preferences.getString(AID);
  static String? getUserID() => _preferences.getString(UID);
  static String? getUserName() => _preferences.getString(UserN);
  static String? getUserEmail() => _preferences.getString(UserE);
  static String? getUserPic() => _preferences.getString(UserPic);

  static List<String> getImageUrlList()
  {
    return imageUrlList;
  }
}