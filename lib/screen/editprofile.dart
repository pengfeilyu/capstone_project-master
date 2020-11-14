import 'dart:io';
import 'package:capstone_project/model/userprofileinfo.dart';
import 'package:capstone_project/screen/userprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';

class EditProfile extends StatefulWidget {

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final String user_id = FirebaseAuth.instance.currentUser.uid;

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();

  @override
  void initState() {
    super.initState();
    FirebaseDatabase.instance.reference().child('User_List').child(user_id).orderByKey().equalTo(user_id).once().then((DataSnapshot snapshot) {
      controller1.text = snapshot.value['userName'];
      controller2.text = snapshot.value['birthday'];
      controller3.text = snapshot.value['aboutMe'];
    });
  }

  File _image;
  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile.path);
    });
  }


  Future<String> uploadImageToFirebase() async {
    String fileName = basename(_image.path);
    firebase_storage.StorageReference firebaseStorageRef =
    firebase_storage.FirebaseStorage.instance.ref().child(user_id);
    firebase_storage.StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    firebase_storage.StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

    return (await taskSnapshot.ref.getDownloadURL());
  }

  @override
  Widget build(BuildContext context) {
    final databaseReference = FirebaseDatabase.instance.reference().child('User_List').child(user_id);
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        backgroundColor: Colors.indigo[400],
        centerTitle: true,
        title: Text('Edit Profile', style: TextStyle(fontFamily: 'Calibri', fontSize: 25,),),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          iconSize: 40.0,
          color: Colors.cyan[600],
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),

        child: FutureBuilder (
          future: databaseReference.once(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            else {
              Map<dynamic, dynamic> values = snapshot.data.value;
              return new SafeArea (
                  top: false,
                  bottom: false,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 40,),

                      CircleAvatar(
                        backgroundImage: NetworkImage(values['photoURL']),
                        radius: 60.0,
                        child: MaterialButton(
                          onPressed: () => pickImage(),
                          color: null,
                          textColor: Colors.white,
                          child: Icon(
                            Icons.camera_alt,
                            size: 30,
                          ),
                          padding: EdgeInsets.only(left: 90, top: 70),
                          shape: CircleBorder(),
                        )
                      ),

                      Expanded(
                          child: ListView (
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            children: <Widget> [

                            SizedBox(height: 30,),

                            TextFormField(
                              initialValue: values['userName'],
                              maxLength: 30,
                              decoration: InputDecoration(
                                icon: Icon(Icons.person, size: 35,),
                                labelText: 'Full Name',
                                labelStyle: TextStyle(color: Colors.deepPurple[900], fontFamily: 'Calibri', fontSize: 20,),
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple[900], width: 2.0,),),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple[900], width: 2.0,),),
                              ),
                              onFieldSubmitted: (value) {setState(() {controller1.text = value;});},
                            ),

                            SizedBox(height: 15.0,),

                            TextFormField(
                              initialValue: values['birthday'],
                              maxLength: 10,
                              decoration: InputDecoration(
                                icon: Icon(Icons.cake_outlined, size: 35,),
                                labelText: 'Birthday',
                                labelStyle: TextStyle(color: Colors.deepPurple[900], fontFamily: 'Calibri', fontSize: 20,),
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple[900], width: 2.0,),),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple[900], width: 2.0,),),
                              ),
                              onFieldSubmitted: (value) {setState(() {controller2.text = value;});},
                            ),

                            SizedBox(height: 15.0,),

                            TextFormField(
                              initialValue: values['aboutMe'],
                              maxLength: 100,
                              decoration: InputDecoration(
                                icon: Icon(Icons.wb_sunny, size: 35,),
                                labelText: 'About Me',
                                labelStyle: TextStyle(color: Colors.deepPurple[900], fontFamily: 'Calibri', fontSize: 20,),
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple[900], width: 2.0,),),
                                focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.deepPurple[900], width: 2.0,),),
                              ),
                              onFieldSubmitted: (value) {setState(() {controller3.text = value;});},
                            ),

                              SizedBox(height: 40.0,),

                              Container(
                                height: 50,
                                width:  50,
                                child: RaisedButton.icon(
                                  label: Text('Update Profile', style: TextStyle(fontFamily: 'Calibri', fontSize: 20, color: Colors.white),),
                                  icon: Icon(Icons.save, color: Colors.white, size: 30,),
                                  color: Colors.indigo[400],
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0),),
                                  onPressed: (){
                                    if (_image != null || values['photoURL'] != '') {
                                      var url = uploadImageToFirebase();
                                      print(url);
                                      if (_image == null) {
                                        final new_user = UserProfileInfo(
                                            userName: controller1.text,
                                            birthday: controller2.text,
                                            photoURL: values['photoURL'],
                                            aboutMe: controller3.text);
                                        databaseReference.update(
                                            new_user.toJson());
                                      }
                                      else {
                                        final new_user = UserProfileInfo(
                                            userName: controller1.text,
                                            birthday: controller2.text,
                                            photoURL: url.toString(),
                                            aboutMe: controller3.text);
                                        databaseReference.update(
                                            new_user.toJson());
                                      }
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Profile()),
                                      );
                                    }
                                    else {
                                      print('Error');
                                    }
                                  },
                                ),
                              )
                            ]
                      )
                      ),
                    ],
                  )
              );
            }
          }
        )
      )
    );
  }
}