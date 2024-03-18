import 'package:flutter/material.dart';

import '../models/ticketModel.dart';

class TicketProvider extends ChangeNotifier {
  late List<TicketModel> _ticketData;

  TicketProvider() {
    _ticketData = [
      TicketModel(
        title: 'Ticket 1',
        price: '\$50',
        imageUrl:
            'https://lh3.googleusercontent.com/proxy/heuoM1QWJpWwKsV39Y-e0k7phls_M12iBXG-s3RAwXGqq1t8Mou0xuLn5GQO-bZOqKFvu1H80Gv4tFUwMofaOL5tpO_iCz7ftT2hWMnbf66ncuURl5F_DlvUZgxqovS6aXwTiJrk8Wwzp5TIR8pXcIpV0Q',
      ),
      TicketModel(
        title: 'Ticket 2',
        price: '\$75',
        imageUrl:
            'https://images.prestigeonline.com/wp-content/uploads/sites/6/2024/02/22150231/Taylor-Swift-themed-party-and-events-1.jpg',
      ),
      TicketModel(
        title: 'Ticket 3',
        price: '\$75',
        imageUrl:
            'https://cdn.tgdd.vn/Files/2023/06/27/1535956/bo-tui-ngay-nhung-mon-do-can-thiet-phai-mang-khi-di-concert-blackpink-o-ha-noi-202306270921181420.jpg',
      ),
    ];
  }

  List<TicketModel> get ticketData => _ticketData;
}
