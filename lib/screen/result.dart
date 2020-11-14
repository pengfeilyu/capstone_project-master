import 'package:capstone_project/homepage.dart';
import 'package:capstone_project/screen/dailyinput.dart';
import 'package:capstone_project/screen/resulttrans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:capstone_project/model/flchart.dart';
import 'package:capstone_project/model/lineChart.dart';
import 'package:capstone_project/screen/cloudpage.dart';
import 'package:capstone_project/screen/userprofile.dart';



class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
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
          children: <Widget>[
            SizedBox(height: 10,),
            Text('pie Chart', style: TextStyle(fontFamily: 'Calibri', fontSize: 25,color: Colors.white),),

            FChart(),
            Text('Line Chart', style:TextStyle(fontFamily: 'Calibri', fontSize: 25,color: Colors.white),),

            LineChartSample3(),





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
