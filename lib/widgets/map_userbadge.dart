import 'package:flutter/material.dart';

class MapUserBadge extends StatelessWidget {
  const MapUserBadge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset.zero)
          ]),
      child: Row(children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                  image:
                      AssetImage('assets/images/external-tourism-icons 2.png'),
                  fit: BoxFit.cover),
              border: Border.all(color: Colors.blueGrey, width: 1)),
        ),
        SizedBox(width: 10),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Welcome To TraveLZilla',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
            Text(
              'My Location',
              style: TextStyle(color: Colors.black),
            ),
          ]),
        ),
        Icon(Icons.location_pin, color: Colors.deepPurpleAccent, size: 40)
      ]),
    );
  }
}
