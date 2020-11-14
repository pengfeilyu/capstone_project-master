import 'package:firebase_database/firebase_database.dart';

class UserProfileInfo {
  String userName;
  String birthday;
  String photoURL;
  String aboutMe;

  UserProfileInfo({this.userName, this.birthday, this.photoURL, this.aboutMe});

  UserProfileInfo.fromSnapshot(DataSnapshot snapshot) {
    userName = snapshot.value['userName'];
    birthday = snapshot.value['birthday'];
    photoURL = snapshot.value['photoURL'];
    aboutMe = snapshot.value['aboutMe'];
  }

  UserProfileInfo.fromData(Map<String, dynamic> data) {
    userName = data['userName'];
    birthday = data['birthday'];
    photoURL = data['photoURL'];
    aboutMe = data['aboutMe'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'birthday': birthday,
      'photoURL': photoURL,
      'aboutMe': aboutMe,
    };
  }
}
