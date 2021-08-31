import 'package:flutter/material.dart';
import 'package:hayfood/widgets/backIcon.dart';
import 'package:hayfood/widgets/headerText.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:hayfood/widgets/signOutButton.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      //   leading: Builder(builder: (BuildContext context) {
      //     return Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 15.0,vertical:5.0),
      //       child: Row(              
      //         children: [
      //           backIcon(context),
      //           signOutWidget(context),
      //         ],
      //       )
      //     );
      //   }),
      // ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                child: Column(
                  children: [
                    customAppBar(context),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 8.0),
                            child: headerText('Platos recomendados',
                                Colors.black, FontWeight.bold, 30.0),
                          ),
                          sliderFoodCard(),
                        ],
                      ),
                    ),
                    headerRes(context, 'Restaurantes cercanos'),
                    nearRestaurants(
                        context,
                        "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1314&q=80",
                        'Restaurante 1',
                        'Calle 44 # 8997',
                        '4.3 233 comentarios'),
                    nearRestaurants(
                        context,
                        "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1314&q=80",
                        'Restaurante 2',
                        'Calle 0 # 00 00',
                        '4.5 10 comentarios'),
                    nearRestaurants(
                        context,
                        "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1314&q=80",
                        'Restaurante 3',
                        'Carrera 12 # 999999',
                        '4.7 100 comentarios')
                  ],
                ),
              )
            ]))
          ],
        ),
      ),
    );
  }
}

Widget sliderFoodCard() {
  return Container(
    height: 300.0,
    child: new Swiper(
      itemCount: 4,
      layout: SwiperLayout.DEFAULT,
      itemBuilder: (BuildContext context, int index) {
        return new ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext contex, int index) {
              return _tarjeta(context);
            });
      },
    ),
  );
}

Widget _tarjeta(context) {
  return Container(
    margin: EdgeInsets.all(5.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              width: 270.0,
              height: 200.0,
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80'),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Text("Postre de almendras",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("Restaurante 1",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0)),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 16,
                  ),
                  Text("4.8",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0)),
                  Text(" (233 comentarios)",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0)),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget headerRes(BuildContext context, String textHeader) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
    child: Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: headerText(textHeader, Colors.black, FontWeight.bold, 20.0),
        ),
      ],
    ),
  );
}

Widget nearRestaurants(context, String urlImage, String restaurantName,
    String direction, String rating) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'menu');
    },
    child: Column(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 7.0),
                child: Container(
                  decoration: boxDecoration(),
                  height: 100.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          imageRestaurant(urlImage),
                          infoRestaurant(
                              context, restaurantName, direction, rating)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )),
      ],
    ),
  );
}

BoxDecoration boxDecoration() {
  return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
            color: Colors.black26, offset: Offset(2.0, 2.0), blurRadius: 8.0)
      ]);
}

Widget imageRestaurant(String url) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Image.network(url),
  );
}

Widget infoRestaurant(BuildContext context, String restaurantName,
    String direction, String rating) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        restaurantName,
        style: Theme.of(context).textTheme.headline4,
      ),
      Row(
        children: [
          Icon(
            Icons.location_on,
            color: Color(0XFFB7B7D2),
            size: 14.0,
          ),
          SizedBox(
            width: 3.0,
          ),
          Text(
            direction,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
      SizedBox(
        height: 3.0,
      ),
      Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 14.0,
          ),
          SizedBox(
            width: 3.0,
          ),
          Text(rating, style: Theme.of(context).textTheme.subtitle1)
        ],
      )
    ],
  );
}
Widget customAppBar(BuildContext context){
  return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0,vertical:5.0),        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                backIcon(context),
                signOutWidget(context),
          ],
        ),);        
}