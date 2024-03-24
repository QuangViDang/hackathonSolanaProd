// Định nghĩa model dữ liệu cho mỗi vé
class TicketModel {
  String title;
  String imageUrl;
  String address;
  String timeEvent;
  String aboutEvent;
  String price;
  String currency;
  String ticket_code_to_attend;
  String publisher;

  TicketModel({
    required this.title,
    required this.imageUrl,
    required this.address,
    required this.timeEvent,
    required this.aboutEvent,
    required this.price,
    required this.currency,
    required this.ticket_code_to_attend,
    required this.publisher,
  });
}
