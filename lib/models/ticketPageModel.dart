import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';

import '../widgets/ticketPageWidget.dart';

class TicketPageModel extends FlutterFlowModel<TicketPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
