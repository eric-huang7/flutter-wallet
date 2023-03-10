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

const Color kDarkGrey = Color(0xFF333333);

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
const String kStripeIcon = 'assets/icons/stripe.png';
const String kCardBG1 = "assets/icons/purple_card.png";
const String kCardBG2 = "assets/icons/orange_card.png";
const String kCardBG3 = "assets/icons/black_card.png";
const String kCardBG4 = "assets/icons/grey_card.png";
const List<String> kCardBGList = [kCardBG1, kCardBG2, kCardBG3, kCardBG4];

const String kPylonDenom = "upylon";
const String kPylonCoinName = "pylon";
const String kUSDDenom = "ustripeusd";
const String kUSDCoinName = "usd";
const int kBigIntBase = 1000000;

const Map<String, dynamic> kCoinDenom = {
    'upylon': {
      "name": "Pylon",
      "denom": "upylon",
      "short": "pylon",
      "icon": "assets/icons/ico_pylon.png",
      "faucet" : true
    },

    'BTC': {
      "name": "Bitcoin",
      "denom": "BTC",
      "short": "BTC",
      "icon": "assets/svg/coins_svg/bitcoin.svg",
      "faucet" : false
    },
    'ustripeusd': {
      'name': "USD",
      "denom": "ustripeusd",
      "short": "usd",
      "icon": "assets/icons/ico_usd.png"
    }
  };

const String kUnilinkUrl = "https://wallet.pylons.tech";
const String kUnilinkUrl2 = "http://wallet.pylons.tech";
const String kUnilinkUrl3 = "pylons://";
const String kUnilinkSender = "wallet";
const String kUnilinkPurchaseTrade = "%s?action=purchase_trade&trade_id=%s";
const String kUnilinkPurchaseNftView = "%s?action=nft_view&cookbook_id=%s&item_id=%s";

const String kStripeMerchantCountry = "US";
const String kStripeMerchantDisplayName = 'Pylons';

const String kStripeLoginLinkPrefix = "https://connect.stripe.com/express/";
const String kStripeAccountLinkPrefix = "https://connect.stripe.com/express/onboarding/";
const String kStripeEditSuffix = "/edit";
const String kStripeAccountSuffix = "#/account";
const String kStripeSignoutJS = "const hidebutton = ()=>{  var ret=false; [...document.querySelectorAll('button')].filter(e=>e.innerHTML.toUpperCase().indexOf('SIGN OUT') > -1).forEach(button=>{button.style.display='none'; ret=true;});  setTimeout(hidebutton, 500);}; hidebutton();";



const String NO_INTERNET = 'No internet';
const String RECIPE_NOT_FOUND = 'Recipe not found';
const String USERNAME_NOT_FOUND = 'Username not found';
const String COOK_BOOK_NOT_FOUND = 'Cookbook not found';
const String WALLET_CREATION_FAILED = 'Wallet creation failed';
const String EXECUTION_NOT_FOUND = 'Execution not found';
const String ITEM_NOT_FOUND = 'Item not found';
const String TRADE_NOT_FOUND = 'Trade not found';



//STRIPE ERROR STRING
const String UNKNOWN_EXCEPTION = 'Unknown Exception';
const String CREATE_PAYMENTINTENT_FAILED = 'Stripe PaymentIntent Creation Failed';
const String GEN_PAYMENTRECEIPT_FAILED = 'Stripe Payment Receipt Generation Failed';
const String GEN_PAYOUTTOKEN_FAILED = 'Stripe Payout Token Generation Failed';
const String GEN_REGISTRATIONTOKEN_FAILED = 'Stripe Regitration Token Generation Failed';
const String GEN_UPDATETOKEN_FAILED = 'Stripe Update Token Generation Failed';
const String GET_ACCOUNTLINK_FAILED = 'Stripe Get Connected Account Link Failed';
const String GET_LOGINLINK_FAILED = 'Stripe Get Connected Account LOGIN Link Failed';
const String PAYOUT_FAILED = 'Stripe Payout Request Failed';
const String REGISTERACCOUNT_FAILED = 'Stripe Register Connected Account Failed';
const String UPDATEACCOUNT_FAILED = 'Stripe Update Account Failed';
