import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pylons_wallet/components/loading.dart';
import 'package:pylons_wallet/ipc/handler/base_handler.dart';
import 'package:pylons_wallet/ipc/models/sdk_ipc_message.dart';
import 'package:pylons_wallet/ipc/models/sdk_ipc_response.dart';
import 'package:pylons_wallet/stores/wallet_store.dart';

class CreateRecipeHandler implements BaseHandler {
  CreateRecipeHandler(this.sdkipcMessage);

  @override
  Future<SDKIPCResponse> handle() async {
    final jsonMap = jsonDecode(sdkipcMessage.json) as Map;

    jsonMap.remove('nodeVersion');
    final loading = Loading()..showLoading(message: "${'creating_recipe'.tr()}...");

    final walletsStore = GetIt.I.get<WalletsStore>();

    final response = await walletsStore.createRecipe(jsonMap);
    loading.dismiss();
    response.sender = sdkipcMessage.sender;
    response.action = sdkipcMessage.action;

    if (response.error == "") {
      SnackbarToast.show("Recipe ${jsonMap['name']} Created");
    } else {
      SnackbarToast.show("Recipe ${jsonMap['name']} error: ${response.error}");
    }
    return SynchronousFuture(response);
  }

  @override
  SDKIPCMessage sdkipcMessage;
}
