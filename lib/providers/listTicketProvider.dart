import 'package:flutter/material.dart';

import '../models/ticketModel.dart';

class TicketProvider extends ChangeNotifier {
  late List<TicketModel> _ticketData;

  TicketProvider() {
    _ticketData = [
      TicketModel(
        title: 'Event',
        imageUrl:
            'https://blog.topcv.vn/wp-content/uploads/2021/07/sk2uEvents_Page_Header_2903ed9c-40c1-4f6c-9a69-70bb8415295b.jpg',
        address: "",
        timeEvent: "",
        aboutEvent: "",
        price: '\$50',
      ),
      TicketModel(
        title: 'Taylor Swift',
        price: '\$75',
        imageUrl:
            'https://images.prestigeonline.com/wp-content/uploads/sites/6/2024/02/22150231/Taylor-Swift-themed-party-and-events-1.jpg',
        address: "",
        timeEvent: "",
        aboutEvent: "",
      ),
      TicketModel(
        title: 'Born Pink',
        price: '\$75',
        imageUrl:
            'https://cdn.tgdd.vn/Files/2023/06/27/1535956/bo-tui-ngay-nhung-mon-do-can-thiet-phai-mang-khi-di-concert-blackpink-o-ha-noi-202306270921181420.jpg',
        address: "",
        timeEvent: "",
        aboutEvent: "",
      ),
    ];
  }

  List<TicketModel> get listTicketData => _ticketData;
}
