import 'package:provider/provider.dart';
import 'providers/userWalletProvider.dart';
import 'providers/walletAddressProvider.dart';
import 'screens/home/homePageScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthDataProvider()),
        ChangeNotifierProvider(
            create: (context) => WalletAddressDataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Halloween Party',
        home: const HomePageWidget(),
      ),
    );
  }
}
