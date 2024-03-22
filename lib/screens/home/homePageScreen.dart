import 'package:auto_tickets_solana/models/userModel.dart';
import 'package:auto_tickets_solana/providers/userWalletProvider.dart';
import 'package:auto_tickets_solana/screens/connectWallet/loginDialogScreen.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/homePageModel.dart';
import '../../models/ticketModel.dart';
import '../../providers/listTicketProvider.dart';
import '../../widgets/ticketItemWidget.dart';
export '../../models/homePageModel.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  var isSignInDialogShown = false;

  AuthModel? userAuthModel;
  var imageAccUrl =
      "https://upload.wikimedia.org/wikipedia/en/b/b9/Solana_logo.png";

  final scaffoldKey = GlobalKey<ScaffoldState>();

  void loginOnPress() {
    Future.delayed(
      const Duration(milliseconds: 800),
      () {
        setState(() {
          isSignInDialogShown = true;
        });
        Navigator.push(context, ConnectWallet.route());
      },
    );
  }

  void showProfile() {
    loginOnPress();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ticketProvider = TicketProvider();
    final authProvider = Provider.of<AuthDataProvider>(context);
    final userAuthModel = authProvider.getAuth();
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 40, 20, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 60,
                    icon: Icon(
                      Icons.menu_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: userAuthModel!.email!.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              print("Show Profile");
                              showProfile();
                            },
                            child: Image.network(
                              imageAccUrl,
                              width: 160,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          )
                        : FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: Icon(
                              Icons.access_alarm_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              print("LOGIN");
                              loginOnPress();
                            },
                          ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Rent a Kayak',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Outfit',
                          fontSize: 25,
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: ticketProvider.ticketData.length,
                itemBuilder: (context, index) {
                  final TicketModel ticket = ticketProvider.ticketData[index];
                  return TicketItem(ticket: ticket);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
