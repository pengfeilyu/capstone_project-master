import 'package:capstone_project/screen/cloudpage.dart';
import 'package:capstone_project/screen/userprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:capstone_project/screen/dailyinput.dart';
import 'package:capstone_project/screen/resulttrans.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.lightBlue[100],
        body:  Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column (
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 100,),
              Text(
                'Home',
                style: TextStyle(fontFamily: 'Calibri', fontSize: 40,color: Colors.white),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  child: GridView.count (
                    physics: new NeverScrollableScrollPhysics(),
                    //primary: false,
                    padding: const EdgeInsets.all(65),
                    crossAxisSpacing: 60,
                    mainAxisSpacing: 40,
                    crossAxisCount: 2,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          // Stat Button
                          // Color codes: 0xFFF8BBD0 & 0xFFE91E63
                          // Icon link: <a target="_blank" href="https://icons8.com/icons/set/graph">Graph icon</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
                          width: 220.0,
                          height: 220.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/statbutton.png'),
                            ),
                          ),
                          child: TextButton(
                            onPressed: (){
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) => ResultTrans())
                              );
                            },
                            child: null,
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          // Cloud Button
                          // Color codes: 0xFFC8E6C9 & 0xFF4CAF50
                          // Icon link: <a target="_blank" href="https://icons8.com/icons/set/cloud">Cloud icon</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
                          width: 220.0,
                          height: 220.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/cloudbutton.png'),
                            ),
                          ),
                          child: TextButton(
                            onPressed: (){
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) => CloudPage())
                              );
                            },
                            child: null,
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          // Add Button
                          // Color codes: 0xFFFFF9C4 & 0xFFFDD835
                          // Icon link: <a target="_blank" href="https://icons8.com/icons/set/plus">Cloud icon</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
                          width: 220.0,
                          height: 220.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/addbutton.png'),
                            ),
                          ),
                          child: TextButton(
                            onPressed: (){
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) => DailyInput())
                              );
                            },
                            child: null,
                          ),                    ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          // Profile Button
                          // Color codes: 0xFFFFE0B2 & 0xFFFF9800
                          // Icon link: <a target="_blank" href="https://icons8.com/icons/set/person-male">Person icon</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
                          width: 220.0,
                          height: 220.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/profilebutton.png'),
                            ),
                          ),
                          child: TextButton(
                            onPressed: (){
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) => Profile())
                              );
                            },
                            child: null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //SizedBox(height: 10,),
              Container(
                  child: Image.asset(
                    'assets/images/spectrum.png',
                    height: 280,
                    width: 340,
                  )
              ),
            ],
          ),
        )
    );
  }

}