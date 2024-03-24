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
        price: '50',
        currency: "SQL",
        ticket_code_to_attend: "A0001",
        publisher: "EventPublisher",
      ),
      TicketModel(
        title: 'Taylor Swift',
        imageUrl:
            'https://images.prestigeonline.com/wp-content/uploads/sites/6/2024/02/22150231/Taylor-Swift-themed-party-and-events-1.jpg',
        address: "",
        timeEvent: "",
        aboutEvent: "",
        price: '75',
        currency: "SQL",
        ticket_code_to_attend: "A0001",
        publisher: "EventPublisher",
      ),
      TicketModel(
        title: 'Born Pink',
        imageUrl:
            'https://cdn.tgdd.vn/Files/2023/06/27/1535956/bo-tui-ngay-nhung-mon-do-can-thiet-phai-mang-khi-di-concert-blackpink-o-ha-noi-202306270921181420.jpg',
        address: "Ha Noi, VN",
        timeEvent: "28/03",
        aboutEvent:
            "BlackPink sẽ quay lại Việt Nam vào năm 2024 \nTài khoản X mang tên 'BlackPink tour updates' đăng thông tin nhóm nhạc nữ hàng đầu Hàn Quốc sẽ trở lại Việt Nam vào năm 2024.",
        price: '10',
        currency: "SQL",
        ticket_code_to_attend: "A0001",
        publisher: "YG Entertainment",
      ),
    ];
  }

  List<TicketModel> get listTicketData => _ticketData;
}
