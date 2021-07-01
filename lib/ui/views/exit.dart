import 'dart:io';


import 'package:chat/ui/shared/colors.dart';
import 'package:flutter/material.dart';


class ExitScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(

              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50,),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                    child: Icon(
                      Icons.chat,
                      color: KPrimaryColor2,
                      size: 100,
                    ),
                  ),

                  Text(
                    "Let's Chat ",
                    style: TextStyle(
                      // color: Color(0xFF33BB80),
                        color: KPrimaryColor2,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        fontFamily: "PoppinsRegular"
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    "Logout Sucessful",

                    style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: 20,
                        fontFamily: "PoppinsMedium"
                    ),
                  ),

                  Text(
                    "Simple Secure",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "PoppinsMedium"
                    ),
                  ),

                  Text(
                    "Reliable Messaging",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "PoppinsMedium"
                    ),
                  ),
                  Text(
                    "Thanks for using this Application",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "PoppinsMedium"
                    ),
                  ),


                  SizedBox(
                    height: 60,

                  ),


              GestureDetector(
                onTap: () =>exit(0),

                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: KPrimaryColor2,
                    borderRadius: BorderRadius.circular(25),
                  ),

                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 1),

                      decoration: BoxDecoration(
                        color: KPrimaryColor2,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Container(

                        child: Text(
                           " Exit Now",

                          style: TextStyle(
                            fontSize: 20,
                              color: KPrimaryWhite,
                              fontFamily: "PoppinsRegular",
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                  ),
              )],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
