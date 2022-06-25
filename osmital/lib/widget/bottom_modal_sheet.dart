import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../provider/osmital_data_provider.dart';

Future<dynamic> newMethod(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ExpansionTile(
                title: Text(
                  // "Budhanilkantha Medical Center",
                  Provider.of<OsmitalData>(context, listen: false)
                      .items[0]
                      .name,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  // "Budhanilkantha School Main Rd, kathmandu ",
                  Provider.of<OsmitalData>(context, listen: false)
                      .items[0]
                      .address,
                ),
                children: <Widget>[
                  ListTile(
                    onTap: () async {
                      // launchUrl(Uri.parse("9803394579"));
                      final Uri launchUri = Uri(
                        scheme: 'tel',
                        path:
                            // '9809884579',
                            Provider.of<OsmitalData>(context, listen: false)
                                .items[0]
                                .phone,
                      );
                      await launchUrl(launchUri);
                    },
                    title: Text(
                      // "Call:  9809884579",
                      "Call:  ${Provider.of<OsmitalData>(context, listen: false).items[0].phone}",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  // "Chapali Health Post",
                  Provider.of<OsmitalData>(context, listen: false)
                      .items[1]
                      .name,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  // "Budhanilkantha-1, Kathmandu",
                  Provider.of<OsmitalData>(context, listen: false)
                      .items[1]
                      .address,
                ),
                children: <Widget>[
                  ListTile(
                    onTap: () async {
                      // launchUrl(Uri.parse("9803394579"));
                      final Uri launchUri = Uri(
                        scheme: 'tel',
                        path:
                            // '9809884579',
                            Provider.of<OsmitalData>(context, listen: false)
                                .items[1]
                                .phone,
                      );
                      await launchUrl(launchUri);
                    },
                    title: Text(
                      // "Call:  9809884579",
                      "Call:  ${Provider.of<OsmitalData>(context, listen: false).items[1].phone}",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  // "Budhanilkantha Healthpost",
                  Provider.of<OsmitalData>(context, listen: false)
                      .items[2]
                      .name,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  // "Golfutar Main Rd,budhanilkantha ",
                  Provider.of<OsmitalData>(context, listen: false)
                      .items[2]
                      .address,
                ),
                children: <Widget>[
                  ListTile(
                    onTap: () async {
                      // launchUrl(Uri.parse("9803394579"));
                      final Uri launchUri = Uri(
                        scheme: 'tel',
                        path:
                            // '9809884579',
                            Provider.of<OsmitalData>(context, listen: false)
                                .items[2]
                                .phone,
                      );
                      await launchUrl(launchUri);
                    },
                    title: Text(
                      // "Call:  9809884579",
                      "Call:  ${Provider.of<OsmitalData>(context, listen: false).items[2].phone}",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  // "Neuro Hospital",
                  Provider.of<OsmitalData>(context, listen: false)
                      .items[3]
                      .name,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  // "Bansbari, Kathmandu",
                  Provider.of<OsmitalData>(context, listen: false)
                      .items[3]
                      .address,
                ),
                children: <Widget>[
                  ListTile(
                    onTap: () async {
                      // launchUrl(Uri.parse("9803394579"));
                      final Uri launchUri = Uri(
                        scheme: 'tel',
                        path:
                            // '014373850',
                            Provider.of<OsmitalData>(context, listen: false)
                                .items[3]
                                .phone,
                      );
                      await launchUrl(launchUri);
                    },
                    title: Text(
                      // "Call:  014373850",
                      "Call:  ${Provider.of<OsmitalData>(context, listen: false).items[3].phone}",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  // "Shahid Gangalal National Heart Centre",
                  Provider.of<OsmitalData>(context, listen: false)
                      .items[4]
                      .name,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  // "Bansbari Rd, kathmandu ",
                  Provider.of<OsmitalData>(context, listen: false)
                      .items[4]
                      .address,
                ),
                children: <Widget>[
                  ListTile(
                    onTap: () async {
                      // launchUrl(Uri.parse("9803394579"));
                      final Uri launchUri = Uri(
                        scheme: 'tel',
                        path: 
                        // '01-4371322',
                            Provider.of<OsmitalData>(context, listen: false)
                                .items[4]
                                .phone,
                      );
                      await launchUrl(launchUri);
                    },
                    title:  Text(
                      // "Call:  01-4371322",
                      "Call:  ${Provider.of<OsmitalData>(context, listen: false).items[4].phone}",
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
