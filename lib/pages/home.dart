import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hayfood/models/Restaurant.dart';
import 'package:hayfood/pages/restaurant_page.dart';
import 'package:hayfood/widgets/backIcon.dart';
import 'package:hayfood/widgets/headerText.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:hayfood/widgets/signOutButton.dart';
import 'package:http/http.dart' as http;

List<Restaurant> recommended = [];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Restaurant>> restaurnantList;

  Future<List<Restaurant>> getRestaurants() async {
    var uri = Uri.https(
        'travel-advisor.p.rapidapi.com', '/restaurants/list-by-latlng', {
      "latitude": "6.230833",
      "longitude": "-75.590553",
      "limit": "30",
      "lunit": "km"
    });
    final response = await http.get(uri, headers: {
      'x-rapidapi-host': 'travel-advisor.p.rapidapi.com',
      'x-rapidapi-key': '93972cb058msh80de6121537d885p1dad52jsn7cc516a98142'
    });
    List<Restaurant> restaurants = [];

    if (response.statusCode == 200) {
      String body = response.body;
      final jsonData = jsonDecode(body);
      for (var item in jsonData["data"]) {
        var name = item["name"] != null ? item["name"] : "";
        if (name != "") {
          var description = item["description"];
          if (description == "" || description == null) {
            description = "Descripción actualmente no disponible";
          }
          var address =
              item["address"] != null ? item["address"] : "No disponible";
          var phone = item["phone"] != null ? item["phone"] : "No disponible";
          var rating = item["rating"] != null ? item["rating"] : "0.0";
          var open = item["open_now_text"] != null ? item["open_now_text"] : "";
          var image = item["photo"] != null
              ? item["photo"]["images"]["original"]["url"]
              : "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1314&q=80";
          restaurants.add(Restaurant(
              name, description, address, phone, rating, open, image));
          if (double.parse(rating) >= 4.5) {
            recommended.add(Restaurant(
                name, description, address, phone, rating, open, image));
          }
        }
      }
      recommended.shuffle();
      return restaurants;
    } else {
      throw Exception("Falló la conexión");
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: restaurnantList,
            builder: (context, AsyncSnapshot<List<Restaurant>> snapshot) {
              if (snapshot.hasData) {
                return CustomScrollView(
                  slivers: [
                    SliverList(
                        delegate: SliverChildListDelegate([
                      Column(
                        children: [
                          customAppBar(context),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: headerText('Recomendados',
                                      Colors.black, FontWeight.bold, 30.0),
                                ),
                                sliderFoodCard(),
                              ],
                            ),
                          ),
                          headerRes(context, 'Restaurantes cercanos'),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 1,
                              childAspectRatio: (itemWidth / itemHeight),                              
                              children: [restaurantList(context, snapshot.data)],
                            ),
                          ),
                        ],
                      ),
                    ]))
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("Error");
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    restaurnantList = getRestaurants();
  }
}

Widget sliderFoodCard() {
  return Container(
    height: 300.0,
    child: new Swiper(
      itemCount: 5,
      layout: SwiperLayout.DEFAULT,
      itemBuilder: (BuildContext context, int index) {
        return new ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext contex, int index) {
              return _tarjeta(context, recommended[index]);
            });
      },
    ),
  );
}

Widget _tarjeta(context, Restaurant res) {
  return GestureDetector(
      onTap:(){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RestaurantPage(res)));
      },
      child: Container(
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
                image: NetworkImage(res.image),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  width: 270,
                  child: Text(
                    res.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  width: 270,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    res.address,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 16,
                    ),
                    Text(res.rating,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0)),
                    Text(" " + res.open,
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

Widget restaurantList(context, data) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) => Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RestaurantPage(data[index])));
              },
              child: Container(
                decoration: boxDecoration(),
                height: 100.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        imageRestaurant(data[index].image),
                        infoRestaurant(context, data[index].name,
                            data[index].address, data[index].rating)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ));
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
    child: Image.network(
      url,
      width: 60,
      height: 60,
    ),
  );
}

Widget infoRestaurant(BuildContext context, String restaurantName,
    String direction, String rating) {
  return Container(
    width: 240,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                restaurantName,
                style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'Roboto',
                  color: new Color(0xFF212121),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
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
            Expanded(
              child: Text(
                direction,
                style: TextStyle(
                  fontSize: 13.0,
                  fontFamily: 'Roboto',
                  color: new Color(0xFF212121),
                  fontWeight: FontWeight.normal,
                ),
                overflow: TextOverflow.ellipsis,
              ),
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
            Expanded(
                child: Text(rating,
                    style: TextStyle(
                      fontSize: 13.0,
                      fontFamily: 'Roboto',
                      color: new Color(0xFF212121),
                      fontWeight: FontWeight.bold,
                    )))
          ],
        )
      ],
    ),
  );
}

Widget customAppBar(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        backIcon(context, Colors.black,0),
        signOutWidget(context),
      ],
    ),
  );
}
