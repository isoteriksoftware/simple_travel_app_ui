import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: TravelApp(),
    );
  }
}

class TravelApp extends StatelessWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTopLayer(),
        buildContent(),
        Expanded(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: buildFooter(context),
        )),
      ],
    );
  }

  Widget buildFooter(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildText(text: 'Book Now', size: 20, color: Colors.white),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTopLayer() {
    const radius = 30.0;

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/tahiti.jpg'),
                fit: BoxFit.cover,
              )),
          height: 400,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildButton(Icons.arrow_back),
                    Row(
                      children: [
                        buildButton(Icons.share_outlined),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                        buildButton(Icons.favorite_outline_rounded)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black.withOpacity(.3),
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildRoundedImage('assets/images/paris.jpg'),
                  buildRoundedImage('assets/images/nassau.jpg'),
                  buildRoundedImage('assets/images/rome.jpg'),
                  buildRoundedImage('assets/images/mykonos.jpg'),
                  buildRoundedImage('assets/images/london.jpg'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildRoundedImage(String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          image,
          width: 50,
          height: 50,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget buildButton(IconData icon) {
    const size = 40.0;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * .5),
        color: Colors.white,
      ),
      child: Center(
        child: Icon(
          icon,
        ),
      ),
    );
  }

  Widget buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildText(
                    text: 'United Kingdom',
                    size: 22,
                    weight: FontWeight.w700,
                    color: Colors.black.withOpacity(.8),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                  ),
                  buildText(
                    text: 'Tahiti',
                    size: 18,
                    weight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  buildText(
                    text: '\$20',
                    size: 22,
                    weight: FontWeight.w700,
                    color: Colors.black.withOpacity(.8),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                  ),
                  buildText(
                    text: 'per person',
                    size: 18,
                    weight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              height: 1,
              color: Colors.grey.withOpacity(.3),
            ),
          ),
          Row(
            children: [
              buildInfoIcon(Icons.location_on_outlined),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              buildText(
                  text: 'Somewhere in London',
                  color: Colors.black.withOpacity(.7),
                  weight: FontWeight.w500,
                  size: 18)
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Row(
            children: [
              buildInfoIcon(Icons.access_time),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildText(
                      text: 'OPEN',
                      color: Colors.grey.withOpacity(.8),
                      weight: FontWeight.w500,
                      size: 18),
                  buildText(
                      text: '9:00 AM',
                      color: Colors.black.withOpacity(.7),
                      weight: FontWeight.w500,
                      size: 18),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildText({
    required String text,
    FontWeight weight = FontWeight.w400,
    double size = 15,
    Color color = Colors.black,
  }) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: weight,
          fontSize: size,
          color: color,
          fontFamily: 'Montserrat'),
    );
  }

  Widget buildInfoIcon(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfff0f0f0),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(7),
      child: Icon(icon),
    );
  }
}
