import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelzilla_dubai_flutter/widgets/restaurant_details.dart';

class RestaurantCard extends StatefulWidget {
  const RestaurantCard({Key? key}) : super(key: key);

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  Widget buildCard(
    final String name,
    final String addressinfo,
    final String imgPath,
    final bool added,
    final bool isFavorite,
    context,
    final String descriptions,
  ) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {
          Get.to(
              RestaurantDetails(
                  assetPath: [imgPath],
                  address: addressinfo,
                  placename: name,
                  description: descriptions),
              transition: Transition.circularReveal);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              )
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(5.0),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    isFavorite
                        ? Icon(Icons.favorite, color: Colors.red)
                        : Icon(
                            Icons.favorite_border_rounded,
                            color: Colors.black,
                          )
                  ])),
              Hero(
                  tag: imgPath,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(imgPath), fit: BoxFit.contain)),
                  )),
              SizedBox(height: 4.0),
              Text(
                name,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Desolate',
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                addressinfo,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Desolate',
                    fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent.shade200,
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.all(15.0),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildCard(
                    'Armani/Mediterranio',
                    'Lobby Level, 1 Sheikh Mohammed bin Rashid Blvd - Downtown Dubai ',
                    'assets/images/armani 2.png',
                    false,
                    false,
                    context,
                    'Quiet possibly the best Indian fine dining venue in the The food ...Dine In Take Away'),
                buildCard(
                    'Scape Restaurant',
                    'Burj Al Arab, Ground Mezzanine Floor - Jumeirah St - Dubai ',
                    'assets/images/scape.png',
                    false,
                    false,
                    context,
                    'Immerse yourself in the atmosphere of Côte d Azure At Scape restaurant on Burj Al-Arab Terace'),
                buildCard(
                    'The Pavilion ',
                    'Port Rashid - Dubai',
                    'assets/images/The pavilion 1.png',
                    true,
                    false,
                    context,
                    'Here for the brunch on a special day to try out the Mediterranean food with a la carte menu . Near museum of the future'),
                buildCard(
                    'Al Ammor Reataurant',
                    '155 Sheikh Rashid Rd - Al Karama - Dubai',
                    'assets/images/al ammor 1.png',
                    false,
                    true,
                    context,
                    'It was such a great experience, food is authentic, fresh ... Nearby Dubai Frame'),
                buildCard(
                    'Beresta Indian cousine & Biryanis',
                    'Shop No. 3, The 9 Tower - Marasi Dr - next to Pullman Downtown Hotel - Business Bay - Dubai',
                    'assets/images/barishta 1.png',
                    false,
                    false,
                    context,
                    'The service was amazing. They have seating area outside.Defineatly i come back to crave Indian food'),
                buildCard(
                    'Bikanervala Dubai Mall',
                    'Dubai mall - Sheikh Mohammed bin Rashid Blvd - Downtown Dubai,Burj Khalifa',
                    'assets/images/bikanervala 1.png',
                    false,
                    false,
                    context,
                    'The food is very good, amazing array of curries and breads.Very cheap and hidden in the Dubai Mall food area upstairs on the third floor.Staff are quick and helpful.'),
                buildCard(
                    'Aprons & Hammers Restaurant',
                    'La Mer Central - Jumeirah-Jumeirah 1 - Dubai',
                    'assets/images/aprons & hammers 1.png',
                    true,
                    false,
                    context,
                    'One of the delicious sea food restaurants in Dubai, however, it is over expensive. Shrimp & lobster are delicious. Service is good and nice outside seating in the good weather'),
                buildCard(
                    'Seagrill Bistro',
                    'Palm Jumeirah - The Palm Jumeirah - Dubai',
                    'assets/images/seagrill 1.png',
                    false,
                    true,
                    context,
                    'Very nice ambiance with light and elegant seating. Slightly difficult to find entrance as it is somewhat overshadowed by the Little Miss India grander entrance but look carefully to the side and you will see the small alleyway entrance to Seagrill.'),
                buildCard(
                    'Arabica Restaurant',
                    '86 Sheikh Zayed Rd, Dubai United Arab Emirates',
                    'assets/images/Arabica 1.png',
                    false,
                    false,
                    context,
                    'The first % Arabica in the United Arab Emirates is here in the futuristic and extravagant city of Dubai. Dubai is home to a diverse community of locals, expats, and foreigners, making it a vibrantly global city where different cultures, religions, and cuisine come together'),
                buildCard(
                    'Food Park Restaurant',
                    'Arjan - near Miracle Garden Gate 3 - Dubai',
                    'assets/images/Food park 2.png',
                    false,
                    false,
                    context,
                    'Always crowded , which clearly shows the quality and taste of the food Near Miracle garden'),
              ],
            ),
          ),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }
}
