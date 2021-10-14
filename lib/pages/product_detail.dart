import 'package:flutter/material.dart';
import 'package:hayfood/pages/home.dart';
import 'package:hayfood/widgets/backIcon.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
        children: [
          Stack(
            children: [
              Image(
                width: double.infinity,
                height: 400,
                fit: BoxFit.cover,
                image: NetworkImage("https://estaticos.miarevista.es/media/cache/1140x_thumb/uploads/images/gallery/59a9469e5bafe86b2d3c9876/hamburguesa-ppal.jpg"),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: backIcon(context, Colors.white,1),
              )
            ],),
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
                            "Hamburguesa",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0),
                          ),
                          SizedBox(height: 20),
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam risus tellus, dignissim at est ut, dapibus tincidunt justo.\nNam eu nisl turpis. Donec in est rutrum, fringilla dui non, interdum mi. Proin vitae nulla ac eros porta cursus ut egestas metus.",
                          style: TextStyle(                        
                              fontSize: 15.0,
                              fontFamily: 'Roboto',
                              color: new Color(0xFF212121),
                            )),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            child: Column(
                              children: [
                                Row(children: [                                  
                                  Container(
                                    width: 70,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Theme.of(context).accentColor                                    
                                    ) ,
                                    child: Center(
                                      child: Text('Precio',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                fontFamily: 'Roboto',
                                                color: Colors.white,
                                                fontStyle: FontStyle.italic),
                                                textAlign: TextAlign.center,
                                              ),
                                    ),
                                  ),
                                  Text(' \$10.000',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: 'Roboto',
                                            color: new Color(0xFF212121),
                                            fontWeight: FontWeight.bold
                                  ))
                                ]),                            
                              ],
                            ),
                          ),                          
                        ],
                      ),
                    ),
                  ),
                )
        ]),
    );
  }
}