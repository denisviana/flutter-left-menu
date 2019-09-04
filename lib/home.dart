
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    debugPrint("Calling build");

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: Icon(Icons.menu, color: Colors.blueAccent),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[

            Positioned(
              bottom: 0.0,
              left: -150,
              child: Container(
                height: 400.0,
                width: 400.0,
                decoration: BoxDecoration(
                  color: Colors.yellow[700],
                  shape: BoxShape.circle
                ),
              ),
            ),


            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                /*SizedBox(
                  height: 100.0,
                  child: FlareActor(
                      "asset/snow_animation.flr",
                    animation: "Main",
                  ),
                ),*/

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image(image: AssetImage("images/flutter.png")),
                ),

                Image(image: AssetImage("images/snow.png"))

              ],
            ),

          ],
        )
      ),
    );
  }
}
