import 'package:capstone_project/screen/userprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:capstone_project/screen/resulttrans.dart';
import 'package:capstone_project/screen/cloudpage.dart';
import 'package:capstone_project/homepage.dart';
import 'package:capstone_project/test/inputformat.dart';

class DailyInput extends StatefulWidget {
  @override
  _DailyInputState createState() => _DailyInputState();
}

class _DailyInputState extends State<DailyInput> {

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
      // Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (context) => DailyInput())
      // );
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
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,

          ),
        ),


        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton.icon(onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BasicDateTimeField())
                  );
                },

                  icon: Icon(Icons.audiotrack),
                  label: Text('input test for now'),
                  color: Colors.blue[400],

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)
                  ),

                ),

                Text('Daily Input',style: TextStyle(fontFamily: 'Calibri', fontSize: 25,color: Colors.white),),

                RaisedButton.icon(onPressed: (){

                },

                  icon: Icon(Icons.video_call),
                  label: Text(''),
                  color: Colors.blue[400],

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)
                  ),

                ),

              ],
            ),

            Text('input', style: GoogleFonts.mcLaren(
              fontSize: 10,
            )),

            Container(
              width: 200,
              child: TextField(

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'enter here',
                  isDense: true,                      // Added this
                ),
              ),
            ),


            Text('input', style: GoogleFonts.mcLaren(
              fontSize: 10,
            )),

            Container(
              width: 200,
              child: TextField(

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'enter here',
                  isDense: true,                      // Added this
                ),
              ),
            ),

            Text('input', style: GoogleFonts.mcLaren(
              fontSize: 10,
            )),

            Container(
              width: 200,
              child: TextField(

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'enter here',
                  isDense: true,                      // Added this
                ),
              ),
            ),


            Text('input', style: GoogleFonts.mcLaren(
              fontSize: 10,
            )),

            Container(
              width: 200,
              child: TextField(

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'enter here',
                  isDense: true,                      // Added this
                ),

              ),
            ),


            Text('input', style: GoogleFonts.mcLaren(
              fontSize: 10,
            )),

            Container(
              width: 200,
              child: TextField(

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'enter here',
                  isDense: true,                      // Added this
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton.icon(onPressed: (){

                },

                  icon: Icon(Icons.save),
                  label: Text(''),
                  color: Colors.blue[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)
                  ),

                ),

                RaisedButton.icon(onPressed: (){

                },

                  icon: Icon(Icons.delete),
                  label: Text(''),
                  color: Colors.blue[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)
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
