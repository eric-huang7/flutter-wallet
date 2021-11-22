import 'dart:ui';

const Color kDarkBG = Color(0xFFF1F1F2);
const Color kSelectedIcon = Color(0xFF616161);
const Color kUnselectedIcon = Color(0xFFC4C4C4);
const Color kTextColor = Color(0xFF201D1D);

const Color kTextBlackColor = Color(0xFF080830);
const Color kBlue = Color(0xFF1212C4);
const Color kPeach = Color(0xFFFFB094);
const Color kPeachDark = Color(0xFFED8864);
const Color kWhite = Color(0xFFFFFFFF);

const double kIconSize = 24.0;
const double kSmallIconSize = 18.0;
const double kAppBarSize = 100.0;
const double kAppBarNormalSize = 60.0;

const String kImage = "https://images.unsplash.com/photo-1581092787765-e3feb951d987?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80";
const String kImage1 = "https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=736&q=80";
const String kImage2 = "https://images.unsplash.com/photo-1632765265861-55e0726bfa43?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80";
const String kImage3 = "https://images.unsplash.com/photo-1632687222219-93f0ecb7dab0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80";
const List<String> kImageList = [kImage, kImage1, kImage2, kImage3];

//image card

class Constants {
  static String kCardBG1 = "assets/icons/purple_card.png";
  static String kCardBG2 = "assets/icons/orange_card.png";
  static String kCardBG3 = "assets/icons/black_card.png";
  static String kCardBG4 = "assets/icons/grey_card.png";
  static List<String> kCardBGList = [kCardBG1, kCardBG2, kCardBG3, kCardBG4];

  static Map<String, dynamic> kCoinDenom = {
    'upylon': {
      "name": "Pylon",
      "denom": "upylon",
      "short": "pylon",
      "icon": "assets/icons/ico_pylon.png"
    },
  };
}



const String NO_INTERNET = 'No internet';
const String RECIPE_NOT_FOUND = 'Recipe not found';
const String USERNAME_NOT_FOUND = 'Username not found';
const String COOK_BOOK_NOT_FOUND = 'Cookbook not found';