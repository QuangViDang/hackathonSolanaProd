import 'package:auto_tickets_solana/models/ticketModel.dart';
import 'package:auto_tickets_solana/screens/home/ticketPageScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

import '../util/util_constant.dart';

class TicketItem extends StatelessWidget {
  final TicketModel ticket;
  const TicketItem({required this.ticket});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.white;
    Color textColor = Colors.white;
    return FutureBuilder<Color?>(
      future: getDominantColorFromImageUrl(ticket.imageUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Hiển thị màn hình loading hoặc widget tương tự trong quá trình tải màu
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Hiển thị thông báo lỗi nếu xảy ra lỗi khi tải màu
          return Text('Error: ${snapshot.error}');
        } else {
          final dominantColor = snapshot.data;
          backgroundColor = dominantColor ?? Colors.transparent;
          textColor = calculateContrastColor(backgroundColor);
        }

        return Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            decoration: const BoxDecoration(),
            child: Stack(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Navigator.push(context, TicketPageWidget.route(ticket));
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 190,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    backgroundColor.withOpacity(0.9),
                                    backgroundColor.withOpacity(0.7),
                                  ],
                                  stops: [0, 1],
                                  begin: const AlignmentDirectional(0, -1),
                                  end: const AlignmentDirectional(0, 1),
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 60,
                                          icon: Icon(
                                            Icons.favorite_border,
                                            color: textColor,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(20, 0, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                ticket.title,
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: textColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(20, 0, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                ticket.price,
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: textColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 10, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        // Điều chỉnh giá trị để bo tròn các cạnh
                        child: Image.network(
                          ticket.imageUrl,
                          width: 200,
                          height:
                              160, // Đảm bảo chiều cao và chiều rộng là như nhau để tạo hình vuông
                          fit: BoxFit
                              .cover, // Đảm bảo ảnh bị cắt để vừa với kích thước hình vuông
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
