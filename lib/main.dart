import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_http_provider/background/background.dart';
import 'package:flutter_http_provider/constant/constants.dart';
import 'package:flutter_http_provider/model/jobs_model.dart';
import 'package:flutter_http_provider/provider/jobprovider.dart';
import 'package:flutter_http_provider/screen/detailscreen.dart';
import 'package:provider/provider.dart';
import 'package:slide_button/slide_button.dart';

import 'screen/homepage.dart';


void main() {
  runApp(ChangeNotifierProvider(create: (_)=>JobProvider(),child:JobsApp()));
}

class JobsApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _JobsAppState();
}

class _JobsAppState extends State<JobsApp> {
  var args;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoardScreen(),
      routes: {
        "/homepage":(BuildContext context)=> HomePage(),

      },
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Capriola'),
    );
  }
}



class OnBoardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Background(
        child: Padding(
          child: Column(
            children: [
              Expanded(
                  child: Container(
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(32),
                                      topRight: Radius.circular(32),
                                      bottomLeft: Radius.circular(72),
                                      bottomRight: Radius.circular(72))),
                              child: Padding(
                                padding: EdgeInsets.all(30),
                                child: Column(
                                  children: [
                                    Spacer(),
                                    Image.network(
                                      Constants.contentImage,
                                      height: 150,
                                      width: 250,
                                    ),
                                    Center(
                                      child: Text(
                                        Constants.heading,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(Constants.subHeading
                                      ,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey[400]),
                                    )
                                  ],
                                ),
                              ))),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  Constants.bgImage)),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(28),
                              topRight: Radius.circular(28),
                              bottomLeft: Radius.circular(68),
                              bottomRight: Radius.circular(68))))),
              SizedBox(
                height: 20,
              ),
              SlideButton(
                height: 30,
                backgroundChild: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Constants.slide_to_continue,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                     /* Icon(
                        Icons.double_arrow_outlined,
                        color: Colors.white,
                        size: 20,
                      )*/
                    ],
                  ),
                ),
                slidingChild: Center(
                    child: Icon(
                      Icons.double_arrow_outlined,
                  color: Colors.white,
                  size: 20,
                )),
                backgroundColor: Colors.transparent,
                slidingBarColor: Color(0xFF323b78),
                slideDirection: SlideDirection.RIGHT,
                onButtonOpened: () {
                  /*textController1.text = "Opened";*/
                  //TODO : Do Changes as per Requirement
                  print("onButtonOpened : ");
                  Navigator.pushReplacementNamed(context, '/homepage');
                },
                onButtonClosed: () {
                  /* textController1.text = "Closed";*/
                  //TODO : Do Changes as per Requirement
                  print("onButtonClosed");
                },
                onButtonSlide: (value) {
                  /*  textController2.text = value.toString();*/
                  //TODO : Do Changes as per Requirement
                  print("onButtonSlide");
                },
              ),
            ],
          ),
          padding: EdgeInsets.only(top: 4, left: 4, right: 4, bottom: 20),
        ),
      ),
    );
  }



}
