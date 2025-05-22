import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("Sản phẩm của Công ty Cổ Phần FTI Sài Gòn"),
                  Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      Text(" infosg@ftisg.com.vn"),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}