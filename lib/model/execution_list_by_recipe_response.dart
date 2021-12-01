import 'package:pylons_wallet/modules/Pylonstech.pylons.pylons/module/client/pylons/execution.pb.dart';

class ExecutionListByRecipeResponse {
  final List<Execution> completedExecutions;
  final List<Execution> pendingExecutions;

  ExecutionListByRecipeResponse({required this.completedExecutions, required this.pendingExecutions});


  Map<String, dynamic> toJson() => {
    "completedExecutions" :  completedExecutions.map((execution) => execution.toProto3Json()),
    "pendingExecutions" : pendingExecutions.map((execution) => execution.toProto3Json())
  };
}