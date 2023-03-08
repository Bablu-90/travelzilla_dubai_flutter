class HotelListData{
  final String imagePath;
  final String titleTxt;
  final String subTxt;
  double dist;
  double rating;
  final reviews;
  final perNight;

  HotelListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = '',
    this.dist = 1.8,
    this.rating = 4.5,
    this.reviews = 80,
    this.perNight = 200,
  });

  List<HotelListData> hotelList = <HotelListData>[
    HotelListData(
      imagePath: 'assets/images/bikanervala 1.png',
      titleTxt: 'Bikanervala',
      subTxt: 'Dubai , United Arab Emirates',
      dist: 2.0,
      rating: 4.5,
      reviews: 80,
      perNight: 200,
    ),
    HotelListData(
      imagePath: 'assets/images/west crescent palm-jumerah.png',
      titleTxt: 'West-crescent Palm-Jumerah',
      subTxt: 'Dubai , United Arab Emirates',
      dist: 5.8,
      rating: 8.0,
      reviews: 69,
      perNight: 700,
    ),
    HotelListData(
      imagePath: 'assets/images/Mnadarin hotel.png',
      titleTxt: 'Mandarin Hotel',
      subTxt: 'Dubai , United Arab Emirates',
      dist: 15.0,
      rating: 3.0,
      reviews: 170,
      perNight: 9000,
    ),
    HotelListData(
      imagePath: 'assets/images/luxury hotels.png',
      titleTxt: 'Luxury Hotel',
      subTxt: 'Dubai , United Arab Emirates',
      dist: 11.0,
      rating: 3.8,
      reviews: 50,
      perNight: 6000,
    ),
    HotelListData(
      imagePath: 'assets/images/hyatt.png',
      titleTxt: 'Grand Hyatt Hotel',
      subTxt: 'Dubai , United Arab Emirates',
      dist: 8.0,
      rating: 8.5,
      reviews: 74,
      perNight: 800,
    ),
    HotelListData(
      imagePath: 'assets/images/hotel -atlantis.png',
      titleTxt: 'Hotel Atlantis',
      subTxt: 'Dubai , United Arab Emirates',
      dist: 3.0,
      rating: 4.5,
      reviews: 80,
      perNight: 200,
    ),
    HotelListData(
      imagePath: 'assets/images/emirates palace hotel.png',
      titleTxt: 'Emirates Palace',
      subTxt: 'Dubai , United Arab Emirates',
      dist: 6.0,
      rating: 4.4,
      reviews: 90,
      perNight: 180,
    ),
    HotelListData(
      imagePath: 'assets/images/Dive in Gevora hotel.png',
      titleTxt: 'Dive In Gevora Hotel',
      subTxt: 'Dubai , United Arab Emirates',
      dist: 4.0,
      rating: 4.5,
      reviews: 580,
      perNight: 270,
    )
  ];
}