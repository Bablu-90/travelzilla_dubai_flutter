class HotelPopularList {
  final String titleTxt;
  bool isSelected;

  HotelPopularList({required this.titleTxt, required this.isSelected});

  static List<HotelPopularList> popularList = <HotelPopularList>[
    HotelPopularList(titleTxt: 'Free BreakFast', isSelected: false),
    HotelPopularList(titleTxt: 'Parking', isSelected: false),
    HotelPopularList(titleTxt: 'Pool', isSelected: true),
    HotelPopularList(titleTxt: 'PetFriendly', isSelected: false),
    HotelPopularList(titleTxt: 'Free Wi-fi', isSelected: true),
    HotelPopularList(titleTxt: 'Car Parking', isSelected: false),
  ];

  static List<HotelPopularList> accomodationList = [
    HotelPopularList(titleTxt: 'All', isSelected: false),
    HotelPopularList(titleTxt: 'Apartments', isSelected: false),
    HotelPopularList(titleTxt: 'Home', isSelected: true),
    HotelPopularList(titleTxt: 'Villa', isSelected: false),
    HotelPopularList(titleTxt: 'Guest House', isSelected: false),
    HotelPopularList(titleTxt: 'Resort', isSelected: true),
  ];
}
