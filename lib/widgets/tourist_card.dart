import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelzilla_dubai_flutter/screens/place_detail_screen.dart';

class TouristCard extends StatefulWidget {
  const TouristCard({Key? key}) : super(key: key);

  @override
  State<TouristCard> createState() => _TouristCardState();
}

class _TouristCardState extends State<TouristCard> {
  @override
  Widget build(BuildContext context) {
    Widget _buildCard(
      final String name,
      final String addressinfo,
      final List<String> imgPath,
      final bool added,
      final bool isFavorite,
      context,
      final String descriptions,
    ) {
      return Padding(
          padding: const EdgeInsets.only(
              top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
          child: InkWell(
              onTap: () {
                Get.to(
                    () => PlaceDetailScreen(
                          address: addressinfo,
                          description: descriptions,
                          placename: name,
                          assetPath: imgPath,
                        ),
                    transition: Transition.rightToLeft);
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3.0,
                            blurRadius: 5.0)
                      ],
                      color: Colors.grey.shade300),
                  child: Column(children: [
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              isFavorite
                                  ? Icon(Icons.favorite,
                                      color: Colors.red.shade400)
                                  : const Icon(Icons.favorite_border,
                                      color: Colors.black)
                            ])),
                    Hero(
                        tag: imgPath.first,
                        child: Container(
                            height: Get.size.height / 4,
                            width: Get.size.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(imgPath.first),
                                    fit: BoxFit.contain)))),
                    const SizedBox(height: 4.0),
                    Text(name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Desolate',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(addressinfo,
                        style: const TextStyle(
                            color: Color(0xFF575E67),
                            fontFamily: 'Desolate',
                            fontSize: 14.0)),
                  ]))));
    }

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.all(15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildCard(
                    'Burj Khalifa',
                    'Dubai mall',
                    ['assets/images/burj khalifa.jpg'],
                    false,
                    false,
                    context,
                    'Burj Khalifa (Arabic: برج خليفة, "Khalifa Tower") is an extremely tall skyscraper in Dubai, United Arab Emirates named after Khalifa bin Zayed Al Nahyan, and is the tallest building ever built, at 828 metres (2,717 feet). Before the building opened, it was called Burj Dubai. The building is 162 stories high.'),
                _buildCard(
                    'Museum Of Future',
                    'Emirates Tower',
                    ['assets/images/museum of the future outlook 2.png'],
                    true,
                    false,
                    context,
                    'Museum of the Future (Arabic: متحف المستقبل)is an exhibition space for innovative and futuristic ideologies, services, and products. Located in the Financial District of Dubai, UAE, the Museum of the Future has three main elements: green hill, building, and void.[2] Founded by the Dubai Future Foundation.[3] It was set to open in 2021, but as of December of that year had yet to fully do so.[4][5] The Government of the United Arab Emirates later opened the museum on 22nd February of 2022.[6] The choice of the date was officially made because the 22nd of February 2022 is a palindrome date.'),
                _buildCard(
                    'Dubai Frame',
                    'Zabeel Park',
                    ['assets/images/dubai frame 2.png'],
                    false,
                    true,
                    context,
                    'The Dubai Frame (Arabic: برواز دبي) is an architectural landmark in Zabeel Park, Dubai.[4] It holds the record for the largest frame in the world.[4] Whilst described by The Guardian newspaper as "the biggest picture frame on the planet,”[4] it is also controversial as the "biggest stolen building of all time.”[4]'),
                _buildCard(
                    'Global Village',
                    'Sheikh Mohamed Bin Zayed Road',
                    ['assets/images/global village 1.png'],
                    false,
                    false,
                    context,
                    'Global Village is the first family destination for culture, entertainment, dining and shopping in the region. It is a unique and integrated destination to enjoy the world\'s finest shopping, dining and entertainment experiences and offers guests a wide range of events, shows and activities that are the largest and most varied in the region. All its exceptional experiences can be enjoyed by purchasing a ticket worth only AED 15. The Global Village operating season starts in November each year and runs until April the following year.'),
                _buildCard(
                    'Dubai Mall',
                    'Burj khalifa',
                    ['assets/images/dubai mall 1.png'],
                    false,
                    false,
                    context,
                    'The Dubai Mall (Arabic: دبي مول "Dubai Mall") is a shopping mall in Dubai. It is the second largest mall in the world after the Iran Mall by total land area,[1] and the 26th-largest shopping mall in the world by gross leasable area, tying with West Edmonton Mall and Fashion Island (Bangkok)—both of which are older than it. It has a total retail floor area of 502,000 square metres (5,400,000 sq ft). Located in Dubai, United Arab Emirates, it is part of the 20-billion-dollar Downtown complex (called Downtown Dubai) adjacent to the iconic Burj Khalifa, and includes over 1,200 shops.[2][3][4] In 2011, it was the most visited building on the planet, attracting over 54 million visitors each year.[5]'),
                _buildCard(
                    'La Mer Beach',
                    'Jumeirah',
                    ['assets/images/LA-MER beach outlook view 2.png'],
                    true,
                    false,
                    context,
                    'La Mer beachfront is one of the most popular beach destinations in the city with a picturesque tropical ambience. The beach has novel landscaping and artistic features with an array of towering palm trees and waterfront features. The signature fish motifs of the La Mer development can be seen in many of the elements near the beach too. '),
                _buildCard(
                    'Palm Jumeirah',
                    'jumeirah',
                    ['assets/images/PALM-JUMERAH BEACH outlook view 1.png'],
                    false,
                    true,
                    context,
                    'Palm Jumeirah is a worldwide symbol of Dubai’s energy, growth, and ambition. The truly iconic development stretches out into the Arabian Gulf in the shape of a date palm – the national plant of the United Arab Emirates.'),
                _buildCard(
                    'Dubai Aquarium',
                    'Down Town',
                    ['assets/images/dubai aquarium inside view 4.png'],
                    false,
                    false,
                    context,
                    'The Dubai Aquarium is a suspended aquarium and proves to be a fascinating experience for visitors. Home to a diverse collection of marine life - both, flora and fauna - the Dubai Aquarium is an experience that almost makes you believe that you are within the ocean, yourself! With over 33,000 aquatic animals and about 140 different species, you can only imagine how large the aquarium is. The Aquarium also offers to you some incredible and unique aquatic experiences, which you can opt to try out.'),
                _buildCard(
                    'Miracle Garden',
                    'Street 3 - Al Barsha',
                    ['assets/images/dubai miracle garden 2.jpg'],
                    false,
                    false,
                    context,
                    'The Dubai Miracle Garden is a flower garden located in the district of Dubailand, Dubai, United Arab Emirates. The garden was launched on Valentine Day in 2013. '),
                _buildCard(
                    'Deep-Dive',
                    'Diving center NAS sports complex',
                    ['assets/images/deep dive dubai 2.png'],
                    false,
                    false,
                    context,
                    'Deep Dive Dubai is the latest record-breaking attraction to make a splash in Dubai.Explore a stunning underwater attraction that is themed to resemble an abandoned sunken city.'),
              ],
            ),
          ),
          const SizedBox(height: 15.0)
        ],
      ),
    );
  }
}
