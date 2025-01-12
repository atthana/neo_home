import 'dart:async';
import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:neo_home/models/service.dart';
import 'package:neo_home/pages/select_service.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  List<Service> services = [
    Service('Air-con',
        'https://cdn-icons-png.flaticon.com/128/8866/8866925.png'),
    Service('Light ',
        'https://cdn-icons-png.flaticon.com/128/2988/2988036.png'),
    Service('CCTV',
        'https://cdn-icons-png.flaticon.com/128/394/394620.png'),
    Service('IOT',
        'https://cdn-icons-png.flaticon.com/128/10355/10355721.png'),
    Service('Developer', 'https://cdn-icons-png.flaticon.com/128/4661/4661320.png'),
    Service('Astrology',
        'https://cdn-icons-png.flaticon.com/128/3924/3924420.png'),
    Service('Cooking', 'https://cdn-icons-png.flaticon.com/128/1830/1830839.png'),
    Service('Exercise', 'https://cdn-icons-png.flaticon.com/128/2860/2860983.png'),
    Service('Love',
        'https://cdn-icons-png.flaticon.com/128/3199/3199998.png'),
  ];

  int selectedService = 4;

  @override
  void initState() {
    // Randomly select from service list every 2 seconds
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        selectedService = Random().nextInt(services.length);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: services.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FadeInUp(
                        delay: Duration(milliseconds: index * 100),
                        child: serviceContainer(services[index].imageURL,
                            services[index].name, index));
                  }),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                      topRight: Radius.circular(80),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    FadeInUp(
                        child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Center(
                        child: Text(
                          'Easy to take care \nof things in NEO home',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade900,
                          ),
                        ),
                      ),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    FadeInUp(
                        child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 60),
                      child: Center(
                        child: Text(
                          'Home application by GRASSROOT.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    )),
                    FadeInUp(
                        child: Padding(
                      padding: EdgeInsets.all(50.0),
                      child: MaterialButton(
                        elevation: 0,
                        color: Colors.black,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectService(),
                            ),
                          );
                        },
                        height: 55,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  serviceContainer(String image, String name, int index) {
    return GestureDetector(
      onTap: () {
        debugPrint('--------Pressed--------');
        debugPrint(name);
        debugPrint(index.toString());
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: selectedService == index ? Colors.white : Colors.grey.shade100,
          border: Border.all(
            color: selectedService == index
                ? Colors.blue.shade100
                : Colors.grey.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(image, height: 30),
              SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 14),
              )
            ]),
      ),
    );
  }
}
