import 'package:cosmos_utils/mnemonic.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pylons_wallet/components/buttons/pylons_blue_button_with_loader.dart';
import 'package:pylons_wallet/components/pylons_text_input_widget.dart';
import 'package:pylons_wallet/components/space_widgets.dart';
import 'package:pylons_wallet/pages/new_screens/new_home.dart';
import 'package:pylons_wallet/stores/wallet_store.dart';

import '../pylons_app.dart';

// Define a custom Form widget.
class NewUserForm extends StatefulWidget {
  final WalletsStore walletsStore;

  const NewUserForm({Key? key, required this.walletsStore}) : super(key: key);

  @override
  NewUserFormState createState() => NewUserFormState();
}

class NewUserFormState extends State<NewUserForm> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();

  final isLoadingNotifier = ValueNotifier(false);



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 50, bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                children: [
                  const Image(
                    image: AssetImage('assets/images/pylons_logo.png'),
                    alignment: Alignment.bottomCenter,
                  ),
                  Container(
                    height: 100,
                  ),
                  PylonsTextInput(controller: usernameController, label: "user_name".tr()),
                  const VerticalSpace(50),
                  PylonsBlueButtonLoading(onTap: onStartPylonsPressed, text: "start_pylons".tr(), loader: isLoadingNotifier, ),
                  const VerticalSpace(30)
                ],
              )) // Add TextFormFields and ElevatedButton here.
        ],
      ),
    );
  }

  void onStartPylonsPressed() {
    if (usernameController.text.isEmpty) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(const SnackBar(
          content: Text('User name is Empty'),
        ));
      Navigator.of(context).pop();
      return;
    }


    _registerNewUser(usernameController.value.text);

  }


  /// Create the new wallet and associate the choosen username with it.
  Future _registerNewUser(String userName) async {
    isLoadingNotifier.value = true;
    final _mnemonic = await generateMnemonic();
    final _username = userName;

    PylonsApp.currentWallet = await widget.walletsStore.importAlanWallet(_mnemonic, _username);
    isLoadingNotifier.value = false;
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const NewHomeScreen()), (route) => true);
  }
}
