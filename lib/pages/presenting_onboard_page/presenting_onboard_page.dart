import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pylons_wallet/components/pylons_blue_button.dart';
import 'package:pylons_wallet/components/pylons_white_button.dart';
import 'package:pylons_wallet/components/space_widgets.dart';
import 'package:pylons_wallet/constants/constants.dart';
import 'package:pylons_wallet/forms/import_from_google_form.dart';
import 'package:pylons_wallet/pages/presenting_onboard_page/components/create_account_bottom_sheet.dart';
import 'package:pylons_wallet/stores/wallet_store.dart';
import 'package:pylons_wallet/utils/screen_size_utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

PageController _controller = PageController();

class PresentingOnboardPage extends StatelessWidget {
  WalletsStore get walletsStore => GetIt.I.get();

  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenSizeUtil(context);
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          SizedBox(
            height: screenSize.height(percent: 0.075),
            child: SmoothPageIndicator(
              controller: _controller, // PageController
              count: 3,
              effect: const WormEffect(
                dotHeight: 4,
                dotWidth: 4,
              ), // your preferred effect
            ),
          ),
          SizedBox(
            height: screenSize.height(percent: 0.72),
            child: OnboardingPageView(),
          ),
          PylonsBlueButton(
            onTap: () {
              final createAccountBottomSheet = CreateAccountBottomSheet(
                context: context,
                walletsStore: walletsStore,
              );
              createAccountBottomSheet.show();
            },
            text: "create_an_account".tr(),
          ),
          const VerticalSpace(10),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                builder: (context) => Wrap(children: [
                  ImportFromGoogleForm(
                    walletStore: walletsStore,
                  )
                ]),
              );
            },
            child: Text("i_already_have_an_account".tr(),
                style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    // decoration: TextDecoration.underline,
                    color: kBlue)),
          ),
          const VerticalSpace(10),
          GestureDetector(
            onTap: () {},
            child: Text("terms_of_service".tr(),
                style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    // decoration: TextDecoration.underline,
                    color: kBlue)),
          )
        ]),
      )),
    );
  }
}

class OnboardingPageView extends StatefulWidget {
  @override
  _OnboardingPageViewState createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  // static const TextStyle textLooks = TextStyle(fontFamily: 'Inter');

  var _currentPage = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    // TODO enable it later causing issue in testing
    const interval = Duration(seconds: 5);
    timer = Timer.periodic(interval, (Timer timer) {
      if (_currentPage <= 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    if (timer != null) {
      timer?.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      onPageChanged: (page) {
        _currentPage = page;
      },
      children: [
        Page1(),
        Page2(),
        Page3(),
      ],
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const Expanded(
        child: Image(
          image: AssetImage(
            'assets/images/image_001.png',
          ),
        ),
      ),
      const SizedBox(
        height: 29,
      ),
      Text(
        "manage_your_nft".tr(),
        style:
            Theme.of(context).textTheme.headline2!.copyWith(color: kDarkGrey),
      ),
      Text("pylons_infrastructure".tr(),
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: kSelectedIcon)),
      const SizedBox(
        height: 38,
      ),
    ]);
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const Expanded(
        child: Image(
          image: AssetImage('assets/images/image_002.png'),
        ),
      ),
      const SizedBox(
        height: 29,
      ),
      Text("sell_and_buy_artworks".tr(),
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: kDarkGrey)),
      Text("transactions_free".tr(),
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: kSelectedIcon)),
      Text("easy_for_everyone".tr(),
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: kSelectedIcon)),
      const SizedBox(
        height: 19,
      ),
    ]);
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenSizeUtil(context);
    return Column(children: <Widget>[
      const Expanded(
        child: Image(
          image: AssetImage('assets/images/image_001.png'),
          alignment: Alignment.bottomCenter,
        ),
      ),
      const SizedBox(
        height: 29,
      ),
      Text("it_stores_in_blockchain".tr(),
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: kDarkGrey)),
      SizedBox(
        height: screenSize.height(percent: 0.077),
      ),
    ]);
  }
}
