import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page_customized/functions.dart';

class MyAccount extends StatefulWidget {
  @override
  MyAccountPage createState() => MyAccountPage();
}

class MyAccountPage extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text(translate(context, "my_account")),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ClipPath(
            clipper: HeaderColor(),
            child: Container(color:Colors.white,),
          ),
          
          CircleAvatar(
            //  backgroundImage: new NetworkImage("https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg"),
              backgroundColor: Colors.transparent,

            child: Image.asset(
              "assets/images/profile.png",
              width: 600,
              height: 600,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderColor extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path;
    path.lineTo(0.0, size.height - 360);
    path.lineTo(size.width, size.height - 420);
    path.lineTo(size.width, size.height - 520);
    path.lineTo(0.0, size.height - 460);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
