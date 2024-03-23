import 'package:auto_tickets_solana/apis/auth_api.dart';
import 'package:auto_tickets_solana/models/userModel.dart';
import 'package:auto_tickets_solana/screens/home/homePageScreen.dart';
import 'package:auto_tickets_solana/screens/home/ticketPageScreen.dart';
import 'package:auto_tickets_solana/util/util_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

import '../providers/walletAddressProvider.dart';
// import 'package:flutter_svg/svg.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isShowLoading = false;
  bool isShowConfetti = false;
  String email = '';
  String reference = '';
  late StatusMessage statusRes;

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;

  late SMITrigger confetti;

  StateMachineController getRiveController(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);
    return controller;
  }

  void signIn(BuildContext context) {
    setState(() {
      isShowLoading = true;
      isShowConfetti = true;
    });
    Future.delayed(
      Duration(seconds: 1),
      () async {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          check.fire();
          Future.delayed(
            Duration(seconds: 2),
            () {
              setState(
                () {
                  isShowLoading = false;
                },
              );
              confetti.fire();
            },
          );
          statusRes = (await checkAuth(context, email, reference))!;
          if (!statusRes.isSuccess) {
            // print("Loading");
            error.fire();
            Future.delayed(
              Duration(seconds: 2),
              () {
                setState(() {
                  isShowLoading = false;
                });
              },
            );
          } else {
            // print("Move");
            Navigator.push(context, HomePageWidget.route());
          }
        } else {
          // print("Error");
          error.fire();
          Future.delayed(
            Duration(seconds: 2),
            () {
              setState(() {
                isShowLoading = false;
              });
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Email",
                style: TextStyle(color: Colors.black54),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    email = value!;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SvgPicture.asset("assets/icons/email.svg"),
                    ),
                  ),
                ),
              ),
              const Text(
                "Password",
                style: TextStyle(color: Colors.black54),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  onSaved: (password) {
                    reference = password!;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SvgPicture.asset("assets/icons/password.svg"),
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 24),
                child: ElevatedButton.icon(
                  onPressed: () {
                    signIn(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 4, 245),
                      minimumSize: const Size(double.infinity, 56),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25)))),
                  icon: const Icon(
                    CupertinoIcons.arrow_right,
                    color: Color(0xFFFE0037),
                  ),
                  label: const Text(
                    "Connect Wallet",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
        isShowLoading
            ? CustomPositioned(
                child: RiveAnimation.asset(
                "assets/RiveAssets/check.riv",
                onInit: (artboard) {
                  StateMachineController controller =
                      getRiveController(artboard);
                  check = controller.findSMI("Check") as SMITrigger;
                  error = controller.findSMI("Error") as SMITrigger;
                  reset = controller.findSMI("Reset") as SMITrigger;
                },
              ))
            : const SizedBox(),
        isShowConfetti
            ? CustomPositioned(
                child: Transform.scale(
                scale: 6,
                child: RiveAnimation.asset(
                  "assets/RiveAssets/confetti.riv",
                  onInit: (artboard) {
                    StateMachineController controller =
                        getRiveController(artboard);
                    confetti =
                        controller.findSMI("Trigger explosion") as SMITrigger;
                  },
                ),
              ))
            : const SizedBox()
      ],
    );
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key, required this.child, this.size = 100});
  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          Spacer(),
          SizedBox(
            height: size,
            width: size,
            child: child,
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
