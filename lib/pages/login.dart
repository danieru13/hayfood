import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hayfood/widgets/headerText.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://international-experience.es/wp-content/uploads/2019/08/comidas-mundo.jpg'),
          )),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: double.infinity,
                      child: headerText(
                          'HAY FOOD!', Colors.white, FontWeight.bold, 45.0)),
                  Container(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Inicia sesión y encuentra los mejores platos a tu alcance',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 19.0),
                    ),
                  ),
                ],
              ),
              Column(
                children: [buttonSignIn(context)],
              )
            ],
          ),
        )
      ],
    ));
  }
}

Widget buttonSignIn(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 45.0,
    margin: EdgeInsets.only(top: 20.0),
    child: ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, 'home-page');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://ragsdalemartin.com/wp-content/uploads/2020/07/white-google-logo.png',
            width: 20.0,
            height: 20.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Text(
              'Iniciar sesion con Google',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          )
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).accentColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    ),
  );
}
