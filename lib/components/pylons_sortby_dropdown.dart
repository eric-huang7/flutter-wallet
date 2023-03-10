import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pylons_wallet/constants/constants.dart';

class PylonsSortByDropDown extends StatefulWidget {
  @override
  PylonsSortByDropDownWidget createState() => PylonsSortByDropDownWidget();
}

class PylonsSortByDropDownWidget extends State {
  String dropdownValue = 'Recommended';

  List<String> spinnerItems = [
    'what_is_new'.tr(),
    'trending'.tr(),
    "${'price'.tr()} : ${'low_to_high'.tr()}",
    "${'price'.tr()} : ${'high_to_low'.tr()}"
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const ImageIcon(AssetImage('assets/images/icon/chevron-down.png'),
          size: 24, color: kSelectedIcon),
      elevation: 16,
      underline: const SizedBox(),
      style: const TextStyle(color: kSelectedIcon, fontSize: 14),
      onChanged: (String? data) {
        setState(() {
          dropdownValue = data!;
        });
      },
      items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
