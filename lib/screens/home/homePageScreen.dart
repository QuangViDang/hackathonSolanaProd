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

  static route() => MaterialPageRoute(
        builder: (context) => HomePageWidget(),
      );

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  var isSignInDialogShown = false;

  AuthModel? userAuthModel;
  String imageAccUrl = ''
      "https://upload.wikimedia.org/wikipedia/en/b/b9/Solana_logo.png";
  String imagePremiumUrl =
      "https://img.pikbest.com/png-images/qiantu/vip-golden-crown-icon-member-golden-crown-champion-first-ranking-exclusive-icon_2688758.png!sw800";
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void loginOnPress() {
    Future.delayed(
      const Duration(milliseconds: 800),
      () {
        setState(() {
          isSignInDialogShown = true;
        });
        customSigninDialog(context, onClosed: (_) {});
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
    return Scaffold(
      body: GestureDetector(
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
                    Container(
                      width: 50,
                      height: 50,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: userAuthModel != null &&
                                userAuthModel.email!.isNotEmpty
                            ? Image.network(
                                imageAccUrl,
                                width: 130,
                                height: 130,
                                fit: BoxFit.cover,
                              )
                            : Icon(
                                Icons.account_circle_outlined,
                                color: Colors.black,
                                size: 40,
                              ),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Image.network(
                          imagePremiumUrl,
                          width: 130,
                          height: 130,
                          fit: BoxFit.cover,
                        ),
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
                      'Analos Tekcit',
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
                  itemCount: ticketProvider.listTicketData.length,
                  itemBuilder: (context, index) {
                    final TicketModel ticket =
                        ticketProvider.listTicketData[index];
                    return TicketItem(ticket: ticket);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle FloatingActionButton click
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient:
                LinearGradient(colors: [Color(0xffFFE072), Color(0xffFEBE19)]),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.orange,
          ),
        ),
        shape: CircleBorder(),
      ),
    );
  }
}
