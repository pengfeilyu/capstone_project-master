import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:capstone_project/authentication/auth.dart';
import 'package:capstone_project/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:capstone_project/homepage.dart';
import 'package:capstone_project/screen/dailyinput.dart';
import 'package:capstone_project/screen/resulttrans.dart';
import 'package:capstone_project/screen/cloudpage.dart';
import 'editprofile.dart';



class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage())
        );
      }
    });
    super.initState();
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    switch(index){
      case 0:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage())
        );
        break;

      case 1:
      // Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (context) => Profile())
      // );
        break;

      case 2:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => DailyInput())
        );
        break;

      case 3:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ResultTrans())
        );
        break;

      case 4:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => CloudPage())
        );
        break;

      default:
        print("error");
        break;
    }

  }

  @override
  Widget build(BuildContext context) {
    var auth_service = Provider.of<Auth>(context);
    final String user_id = FirebaseAuth.instance.currentUser.uid;
    final databaseReference = FirebaseDatabase.instance.reference().child('User_List').child(user_id);

    return Scaffold(
      backgroundColor: Colors.blue[100],

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            SizedBox(height: 50,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  color: Colors.white,
                  child: Text('Sign Out', style: TextStyle(fontFamily: 'Calibri', fontSize: 15,),),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white)
                  ),
                  onPressed: () => auth_service.logout(),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child:
                  Text('Profile', style: TextStyle(fontFamily: 'Calibri', fontSize: 40,color: Colors.white),),
                ),

                RaisedButton.icon(
                  label: Text('Edit', style: TextStyle(fontFamily: 'Calibri', fontSize: 15,),),
                  icon: Icon(Icons.edit),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white)
                  ),
                  onPressed: (){
                    Navigator.push (
                      context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                ),
              ],
            ),

            SizedBox(height: 30.0,),

            FutureBuilder (
                future: databaseReference.once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                else {

                  Map<dynamic, dynamic> values = snapshot.data.value;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(values['photoURL']),
                        radius: 60.0,
                      ),

                      SizedBox(height: 25,),

                      Text(values['userName'],
                        style: TextStyle(fontFamily: 'Calibri', fontSize: 30),),

                      SizedBox(height: 20,),

                      Text(values['birthday'],
                        style: TextStyle(fontFamily: 'Calibri', fontSize: 15),),

                      SizedBox(height: 20,),

                      Text(values['aboutMe'],
                        style: TextStyle(fontFamily: 'Calibri', fontSize: 15),),

                      SizedBox(height: 50,),

                      FlatButton(onPressed: () {},
                          child: Text('privacy setting', style: TextStyle(
                              fontFamily: 'Calibri', fontSize: 15),)),

                      SizedBox(height: 10,),

                      FlatButton(onPressed: () {},
                          child: Text('Notifications', style: TextStyle(
                              fontFamily: 'Calibri', fontSize: 15),)),

                      SizedBox(height: 10,),

                      FlatButton(onPressed: () {},
                          child: Text('Your Activity', style: TextStyle(
                              fontFamily: 'Calibri', fontSize: 15),)),
                    ],
                  );
                }
              }
            ),
        ]),

      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: 'create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'result',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_queue),
            label: 'cloud',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
