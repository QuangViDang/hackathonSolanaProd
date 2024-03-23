import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import '../screens/home/ticketPageScreen.dart';

class TicketPageModel extends FlutterFlowModel<TicketPageWidget> {

  final unfocusNode = FocusNode();
  double? ratingBarValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
