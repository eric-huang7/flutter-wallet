import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pylons_wallet/components/buttons/next_button.dart';
import 'package:pylons_wallet/components/user_image_widget.dart';
import 'package:pylons_wallet/constants/constants.dart';

class DetailTabHistoryWidget extends StatelessWidget {
  const DetailTabHistoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      //margin: const EdgeInsets.only(bottom: 100.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 20,
        padding: EdgeInsets.zero,
        itemBuilder: (_, index) => _HistoryCard(userName: "Linda", artWorkTitle: "Medusa ArtWork", userImage: kImage3, date: "23 Dec 2020", onTap: () {}),
      ),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  final String userName;
  final String artWorkTitle;
  final String userImage;
  final String date;
  final VoidCallback onTap;
  const _HistoryCard({Key? key, required this.userName, required this.artWorkTitle, required this.userImage, required this.date, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(16, 5, 16, 5),
        decoration: BoxDecoration(
          border: Border.all(
            color: kDarkBG, // red as border color
          ),
        ),
        child: ListTile(
          leading: UserImageWidget(
            imageUrl: userImage,
          ),
          title: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(text: userName, style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' ${'purchased'.tr()} '),
                TextSpan(text: artWorkTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          subtitle: Text(date, style: const TextStyle(color: kUnselectedIcon)),
          trailing: NextButton(onTap: onTap),
        ));
  }
}
