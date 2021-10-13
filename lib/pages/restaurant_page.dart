import 'package:flutter/material.dart';
import 'package:hayfood/pages/menu.dart';
import 'package:hayfood/widgets/backIcon.dart';

class RestaurantPage extends StatelessWidget {
  final res;
  RestaurantPage(this.res);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Column(
              children: [
                Stack(
                  children: [
                    Image(
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                      image: NetworkImage(res.image),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: backIcon(context),
                    )
                  ],
                ),
                Transform.translate(
                  offset: Offset(0, -20.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            res.name,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0),
                          ),
                          SizedBox(height: 20),
                          Text(res.description),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            child: Column(
                              children: [
                                Row(children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Color(0XFFB7B7D2),
                                    size: 14.0,
                                  ),
                                  SizedBox(
                                    width: 3.0,
                                  ),
                                  Expanded(
                                      child: Text(res.address,
                                          style: TextStyle(
                                            fontSize: 13.0,
                                            fontFamily: 'Roboto',
                                            color: new Color(0xFF212121),
                                          )))
                                ]),
                                SizedBox(height: 5),
                                Row(children: [
                                  Icon(
                                    Icons.phone,
                                    color: Colors.black,
                                    size: 14.0,
                                  ),
                                  SizedBox(
                                    width: 3.0,
                                  ),
                                  Expanded(
                                      child: Text(res.phone,
                                          style: TextStyle(
                                            fontSize: 13.0,
                                            fontFamily: 'Roboto',
                                            color: new Color(0xFF212121),
                                          )))
                                ]),
                                SizedBox(height: 5),
                                Row(children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 14.0,
                                  ),
                                  SizedBox(
                                    width: 3.0,
                                  ),
                                  Expanded(
                                      child: Text(res.rating,
                                          style: TextStyle(
                                            fontSize: 13.0,
                                            fontFamily: 'Roboto',
                                            color: new Color(0xFF212121),
                                            fontWeight: FontWeight.bold,
                                          )))
                                ]),
                                SizedBox(height: 10),
                                Row(children: [
                                  Text(res.open,
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontFamily: 'Roboto',
                                        color: Colors.green,
                                      ))
                                ]),
                              ],
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MenuPage()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.restaurant_menu,
                                    color: Colors.white,
                                    size: 14.0,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Ver menú',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.0),
                                    ),
                                  )
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).accentColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ]))
        ],
      ),
    ));
  }
}
