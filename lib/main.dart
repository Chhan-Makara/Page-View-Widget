import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageViewScreen(),
    );
  }
}

class PageViewScreen extends StatefulWidget {
  PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  var lstImages = [
    "https://cloudfront-ap-southeast-2.images.arcpublishing.com/nzme/2KFLVYTSOHP33WSY6BII7P2KCM.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtIvHy_ieOmwVLknoWPsveO1q_0oOOdDMpGL7gbI3BqutihGEbfjy3S7LPWDNi4l3HSpw&usqp=CAU",
    "https://static2.tripoto.com/media/filter/tst/img/48388/TripDocument/angkor_wat_temple_complex_ta_prohm.jpg",
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Page View"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.4,
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  activeIndex = index;
                });
              },
              children: lstImages
                  .map((img) => Image.network(
                        img,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              lstImages.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                    radius: 10,
                    backgroundColor:
                        activeIndex == index ? Colors.red : Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
