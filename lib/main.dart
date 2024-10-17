import 'package:flutter/material.dart';
import 'package:get_api_info/data/ip_info_data.dart';
import 'package:get_api_info/wigets/infoData.dart';
import 'package:get_api_info/wigets/info_text.dart';
import 'package:get_api_info/wigets/my_button.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController ipInputFieldController = TextEditingController();

  String ipAddress = "No IP";
  String city = "None";
  String region = "None";
  String country = "None";
  String latlong = "None";
  String operator = "None";
  String postalCode = "None";
  String timeZone = "None";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg_highlight.png"),
            ),
            color: Color(0xff0F0817),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.png",
                height: 120.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  style: const TextStyle(color: Colors.white, fontSize: 16.0),
                  controller: ipInputFieldController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                    fillColor: Color(0xff1E133E),
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                      text: "My IP",
                      icon: Image.asset(
                        "assets/my_ip.png",
                        width: 30.0,
                      ),
                      onPressed: () async {
                        String ipFromData = await IpData.getMyIpAddress();
                        ipInputFieldController.text = ipFromData;

                        setState(() {
                          ipAddress = ipFromData;
                        });
                      },
                    ),
                    const SizedBox(width: 15.0),
                    MyButton(
                      text: "Get Info",
                      icon: Image.asset(
                        "assets/get_info.png",
                        width: 30.0,
                      ),
                      onPressed: () async {
                        Map IPInfo = await IpData.getIpInfo(
                          ipInputFieldController.text,
                        );
                        setState(() {
                          city = IPInfo["city"] ?? "N/A";
                          region = IPInfo["region"] ?? "N/A";
                          country = IPInfo["country"] ?? "N/A";
                          latlong = IPInfo["loc"] ?? "N/A";
                          operator = IPInfo["org"] ?? "N/A";
                          postalCode = IPInfo["postal"] ?? "N/A";
                          timeZone = IPInfo["timezone"] ?? "N/A";
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Column(
                  children: [
                    const Text(
                      "Information about the IP",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    Text(
                      ipAddress,
                      style:
                          const TextStyle(fontSize: 32.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InfoText(text: "City"),
                          InfoText(text: "Region"),
                          InfoText(text: "Country"),
                          InfoText(text: "Lat & Long"),
                          InfoText(text: "Operator"),
                          InfoText(text: "Postal Code"),
                          InfoText(text: "Time Zone"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InfoData(text: city),
                          InfoData(text: region),
                          InfoData(text: country),
                          InfoData(text: latlong),
                          InfoData(
                            text: operator.length > 10
                                ? operator.substring(0, 10)
                                : operator,
                          ),
                          InfoData(text: postalCode),
                          InfoData(text: timeZone),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
