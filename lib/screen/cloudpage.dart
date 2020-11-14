import 'package:capstone_project/screen/resulttrans.dart';
import 'package:capstone_project/screen/userprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:capstone_project/homepage.dart';
import 'package:capstone_project/screen/dailyinput.dart';

class CloudPage extends StatefulWidget {
  @override
  _CloudPageState createState() => _CloudPageState();
}

class _CloudPageState extends State<CloudPage> {
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
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ResultTrans())
        );
        break;

      case 4:
      /*
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => CloudPage())
        );
        */
        break;

      default:
        print("error");
        break;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
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
            //SizedBox(height: 100,),
            Text(
              'Cloud Storage',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Calibri', fontSize: 80,color: Colors.white),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  elevation: 0.0,
                  color: Colors.green[100],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  padding: EdgeInsets.only(
                      top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),

                  onPressed: () {

                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        // Import Button
                        // Color codes: 0xFFF8BBD0 & 0xFFE91E63
                        // Icon link: <a target="_blank" href="https://icons8.com/icons/set/upload-to-cloud">Graph icon</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
                        'assets/images/import.png',
                        height: 60.0,
                        width: 60.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Import',
                          style:TextStyle(fontFamily: 'Calibri', fontSize: 30,color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50,),
                RaisedButton(
                  elevation: 0.0,
                  color: Colors.green[100],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  padding: EdgeInsets.only(
                      top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                  onPressed: () {

                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        // Export Button
                        // Color codes: 0xFFC8E6C9 & 0xFF4CAF50
                        // Icon link: <a target="_blank" href="https://icons8.com/icons/set/download-from-cloud">Graph icon</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
                        'assets/images/export.png',
                        height: 60.0,
                        width: 60.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Export',
                          style: TextStyle(fontFamily: 'Calibri', fontSize: 30,color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
