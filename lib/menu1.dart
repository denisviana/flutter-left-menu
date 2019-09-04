import 'dart:math';

import 'package:flutter/material.dart';

import 'home.dart';
import 'menu_item.dart';



class Menu1Screen extends StatefulWidget {
  Menu1Screen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Menu1ScreenPageState createState() => _Menu1ScreenPageState();
}

class _Menu1ScreenPageState extends State<Menu1Screen> with SingleTickerProviderStateMixin{

  AnimationController _animationController;
  Animation<double> _scaleTween;
  Animation<double> _scaleTween2;
  Animation<Alignment> _positionTween;
  Animation<double> _rotateTween;
  Animation<double> _rotateTween2;
  Animation<double> _rotateTween3;
  Animation<double> _borderRadiusTween;
  Animation<Offset> _headerTween;
  Animation<Offset> _menuTween;
  List<MenuItem> _mainMenuItems = List();

  bool _menuIsOpened = false;
  var _counter = 0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
      reverseDuration: Duration(milliseconds: 200),
    )..addListener((){
      setState(() {});
    });

    _scaleTween = Tween(begin: 1.0, end: 0.9).animate(_animationController);
    _scaleTween2 = Tween(begin: 1.0, end: 0.85).animate(_animationController);
    _positionTween = Tween(begin: Alignment(0.0, 0.0), end: Alignment(17.0 , 0.0)).animate(_animationController);
    _rotateTween = Tween(begin: 0.0, end: -0.09).animate(_animationController);
    _rotateTween2 = Tween(begin: 0.0, end: -0.22).animate(_animationController);
    _rotateTween3 = Tween(begin: 0.0, end: -0.36).animate(_animationController);
    _borderRadiusTween = Tween(begin: 0.0, end: 30.0).animate(_animationController);
    _headerTween = Tween(begin: Offset(-250.0,0.0), end: Offset(0.0,0.0)).animate(_animationController);
    _menuTween = Tween(begin: Offset(-250.0,0.0), end: Offset(0.0,0.0)).animate(_animationController);

    _mainMenuItems.add(MenuItem(selected: true, icon: Icon(Icons.home, color: Colors.white,), title: "Home"));
    _mainMenuItems.add(MenuItem(selected: false, icon: Icon(Icons.insert_drive_file, color: Colors.white), title: "My Wishlist"));
    _mainMenuItems.add(MenuItem(selected: false, icon: Icon(Icons.settings_backup_restore, color: Colors.white), title: "History"));
    _mainMenuItems.add(MenuItem(selected: false, icon: Icon(Icons.notifications, color: Colors.white), title: "Notifications"));
    _mainMenuItems.add(MenuItem(selected: false, icon: Icon(Icons.settings, color: Colors.white), title: "Settings",));


  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.blueAccent[700],
      body: GestureDetector(
          onTap: (){
            if(!_menuIsOpened){
              _animationController.forward();
              _menuIsOpened = true;
            }else {
              _animationController.reverse();
              _menuIsOpened = false;
            }
          },
          child: Stack(
            children: <Widget>[

              Positioned(
                left: -100,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 230,
                    width: 230,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent[100].withOpacity(0.2),
                        shape: BoxShape.circle
                    ),
                  ),
                ),
              ),

              //Background1
              Transform.scale(
                  alignment: Alignment(10.5, 0.3),
                  scale: _scaleTween2.value,
                  child: Transform.rotate(
                      angle: _rotateTween3.value,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0), color: Colors.white30))
                  )
              ),

              //Background2
              Transform.scale(
                  alignment: Alignment(10.5, 0.1),
                  scale: 0.85,
                  child: Transform.rotate(
                      angle: _rotateTween2.value,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.blueGrey[50]))
                  )
              ),

              //Home
              Transform.scale(
                alignment: _positionTween.value,
                scale: _scaleTween.value,
                child: Transform.rotate(
                  angle: _rotateTween.value,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(_borderRadiusTween.value),
                        child: Container(
                          color: Colors.red[400],
                        )
                    ),
                  ),
                ),
              ),

              //Menu
              Transform.translate(
                offset: _headerTween.value,
                child: _buildMenu(),
              ),

              //Logout
              Transform.translate(
                offset: _headerTween.value,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: InkWell(
                      onTap: (){

                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        padding: EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0, right: 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            Icon(
                              Icons.exit_to_app, color: Colors.white,
                            ),

                            SizedBox(width: 15.0,),

                            Text("Log Out", style: TextStyle(fontSize: 14, color: Colors.white)),

                          ],
                        ),
                      )
                  ),
                ),
              ),

            ],
          )
      ),
    );
  }

  Widget _buildMenu(){
    return Container(
        padding: EdgeInsets.only(left: 5.0, top: 50.0, bottom: 16.0, right: 5.0),
        constraints: BoxConstraints(maxWidth: 230.0),
        child: Container(
          child: ListView(
            children: <Widget>[

              Stack(
                children: <Widget>[

                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.circle
                      ),
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      Center(
                        child: SizedBox(
                          height: 80,
                          width: 80,
                          child: CircleAvatar(
                            backgroundImage: AssetImage("images/image.jpeg"),
                          ),
                        ),
                      ),

                      SizedBox(height: 15.0),

                      Center(child: Text("Denis Costa", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.white), textAlign: TextAlign.center)),

                      SizedBox(height: 10.0),

                      Container(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[

                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green
                              ),
                              height: 8.0,
                              width: 8.0,
                            ),

                            SizedBox(width: 10.0),

                            Text("Online", style: TextStyle(color: Colors.blueAccent[700])),

                            SizedBox(width: 10.0),

                            Icon(Icons.keyboard_arrow_down, color: Colors.black38,)

                          ],
                        ),
                      ),

                      SizedBox(height: 30.0),

                      Transform.translate(
                        offset: _menuTween.value,
                        child: Opacity(
                            opacity: _animationController.value,
                            child: _buildMenuList()),
                      ),

                    ],
                  ),

                ],
              ),
            ],
          ),
        )
    );
  }

  Widget _buildMenuList(){
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _mainMenuItems.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          return InkWell(
              onTap: (){
                setState(() {
                  _mainMenuItems.forEach((item) => item.selected = false);
                  _mainMenuItems[index].selected = true;
                  _menuIsOpened = false;
                });
                _animationController.reverse();
              },
              child: Container(
                margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                decoration: BoxDecoration(
                    color: _mainMenuItems[index].selected ? Colors.white : Colors.blueAccent[700],
                    borderRadius: BorderRadius.circular(20.0)
                ),
                padding: EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0, right: 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Row(
                      children: <Widget>[

                        Icon(
                          _mainMenuItems[index].icon.icon, color: _mainMenuItems[index].selected ? Colors.blueAccent[700] : Colors.white,
                        ),

                        SizedBox(width: 15.0,),

                        Text(_mainMenuItems[index].title, style: TextStyle(fontSize: 14, color: _mainMenuItems[index].selected ? Colors.blueAccent[700] : Colors.white)),
                      ],
                    ),

                  ],
                ),
              )
          ) ;
        });
  }
}