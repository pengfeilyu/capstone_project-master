import 'package:capstone_project/homepage.dart';
import 'package:capstone_project/screen/dailyinput.dart';
import 'package:capstone_project/screen/userprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:capstone_project/screen/result.dart';
import 'package:capstone_project/screen/cloudpage.dart';


class ResultTrans extends StatefulWidget {
  @override
  _ResultTransState createState() => _ResultTransState();
}



class _ResultTransState extends State<ResultTrans> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    switch(index){
      case 0:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage())
        );

        break;

      case 1:

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Profile())
        );

        break;

      case 2:

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => DailyInput())
        );

        break;

      case 3:

      // Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (context) => ResultTrans())
      // );

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
    return Scaffold(

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,

          ),
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,


          children: <Widget>[
            Text(
              'Result',
              style: TextStyle(fontFamily: 'Calibri', fontSize: 50,color: Colors.white),
            ),

            RaisedButton(onPressed: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Result())
              );
            },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  side: BorderSide(color: Colors.blue[900])
              ),
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                ),
                height: 70,
                width: 310,
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child:
                Text('Old View', style: TextStyle(fontFamily: 'Calibri', fontSize: 50,color: Colors.white),),
              ),

            ),
            RaisedButton(onPressed: (){

              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Result())
              );

            },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  side: BorderSide(color: Colors.blue[900])
              ),
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                ),
                padding: const EdgeInsets.all(10.0),
                child:
                Text('Generate New', style: TextStyle(fontFamily: 'Calibri', fontSize: 50,color: Colors.white),),
              ),

            ),

          ],
        ),



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
