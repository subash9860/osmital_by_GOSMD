import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<dynamic> emeButt(BuildContext context, String url) async {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ExpansionTile(
                title: const Text(
                  "Budhanilkantha Medical Center",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                subtitle:
                    const Text("Budhanilkantha School Main Rd, kathmandu "),
                children: <Widget>[
                  ListTile(
                    onTap: () async {
                      // launchUrl(Uri.parse("9803394579"));
                      final Uri launchUri = Uri(
                        scheme: 'tel',
                        path: '9809884579',
                      );
                      await launchUrl(launchUri);
                    },
                    title: const Text(
                      "Call:  9809884579",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
              const ExpansionTile(
                title: Text(
                  "Budhanilkantha Community Hospital",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
              // ExpansionTile(
              //   title: Text(
              //     "Karuna Hospital",
              //     style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
              //   ),
              //   subtitle: Text("Budhanilkantha School Main Rd, kathmandu "),
              //   children: <Widget>[
              //     ListTile(
              //       title: Text(
              //         "",
              //
              //  style: TextStyle(fontWeight: FontWeight.w700),
              //       ),
              //     )
              //   ],
              // ),
              const ExpansionTile(
                title: Text(
                  "Chapali Health Post",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      });
}
