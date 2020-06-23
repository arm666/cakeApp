import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(body: HomeScreen()),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, initialIndex: 1, vsync: this);
  }

  final menuImg = [
    "assets/images/birthday-cake.png",
    "assets/images/sandwich.png",
    "assets/images/bread.png",
    "assets/images/cookie.png",
    "assets/images/cake-pop.png",
  ];

  final menuTitle = [
    "Anniversary",
    "Birthday",
    "Marriage",
    "Promotion",
    "Winner",
    "Propose",
    "Appointed",
    "Others",
  ];

  final cakes = [
    {
      "name": "Black Forest",
      "price": "1200",
      "detail":
          "Made of all-purpose flour, cocoa powder, sugar, eggs, vanilla extract, butter, milk",
      "image": "assets/images/cakes/Black_Forest.jpg",
    },
    {
      "name": "Chocolate Cake",
      "price": "1000",
      "detail": "Made of butter, all purpose flour, cocoa powder, eggs & sugar",
      "image": "assets/images/cakes/Chocolate.jpg",
    },
    {
      "name": "Fruit Cake",
      "price": "1500",
      "detail":
          "Made with chocolate and white chocolate decorative flowers and cherries elegantly centered on top",
      "image": "assets/images/cakes/Fruit_Cake.jpg",
    },
    {
      "name": "Wedding Cake",
      "price": "2000",
      "detail": "All the cakes are made with egg and without egg (eggless).",
      "image": "assets/images/cakes/Wedding.jpg",
    },
  ];

  final fav = [
    "assets/images/cakes/Black_Forest.jpg",
    "assets/images/cake-pop.png",
    "assets/images/cakes/Fruit_Cake.jpg",
    "assets/images/birthday-cake.png",
    "assets/images/sandwich.png",
  ];

  int menuImgSelect = 0;
  int menuTitleSelect = 1;

  double v8 = .8;
  double v5 = .5 - .3;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.orangeAccent, Colors.orange, Colors.red])),
      child: Stack(
        fit: StackFit.loose,
        children: [
          ClipPath(
            clipper: CustomClipClipper(),
            child: Container(
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Colors.red[400].withOpacity(0.5),
                    Colors.red[800].withOpacity(.5)
                  ])),
            ),
          ),
          homepageContent()
        ],
      ),
    );
  }

  Widget homepageContent() => Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.chevron_left, size: 40, color: Colors.white),
                  Icon(Icons.search, size: 40, color: Colors.white),
                ],
              )),
          //title
          title("Choose type\n of sweet"),
          circularTitle(),
          titleSecondary("SELECT THE EVENT"),
          menuSecondary(),
          SizedBox(height: 20),
          //tab-Bar
          Expanded(
            child: Container(
                child: DefaultTabController(
              length: 3,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  shadowColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  titleSpacing: 0.0,
                  title: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: <Widget>[
                      Icon(Icons.home, size: 50),
                      Icon(Icons.restaurant_menu, size: 50),
                      Icon(Icons.favorite, size: 50),
                    ],
                  ),
                ),
                body: TabBarView(controller: _tabController, children: [
                  //first tab bar
                  Container(
                      child: GridView.count(
                          crossAxisCount: 3,
                          children: menuImg
                              .map((item) => Container(
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color.fromRGBO(255, 255, 255, .4),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              item,
                                            )),
                                      ),
                                    ),
                                  ))
                              .toList())),

                  //second tab bar
                  Container(
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (scroll) {
                      scroll.disallowGlow();
                      return true;
                    },
                    child: ListView.builder(
                      itemCount: cakes.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.8),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                              color: Colors.white.withOpacity(.3),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  child: Image.asset(cakes[index]['image'],
                                      fit: BoxFit.fill),
                                ),
                                Expanded(
                                    child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(cakes[index]['name'],
                                            style: GoogleFonts.lora(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w200)),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Text(
                                          cakes[index]['detail'],
                                          textAlign: TextAlign.right,
                                          style: GoogleFonts.heebo(
                                              fontSize: 14,
                                              textStyle: TextStyle()),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "Rs." + cakes[index]['price'] + "/Kg",
                                          style: GoogleFonts.sriracha(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(50, 0, 50, 1)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                              ],
                            ));
                      },
                    ),
                  )),

                  //third tab bar
                  Container(
                      child: GridView.count(
                          crossAxisCount: 3,
                          children: fav
                              .map((item) => Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color.fromRGBO(255, 255, 255, .3),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                              item,
                                            )),
                                      ),
                                    ),
                                  ))
                              .toList())),
                ]),
              ),
            )),
          )
        ]),
      );

// user defined widgets
  Widget title(title) => Container(
      margin: EdgeInsets.only(top: 5, left: 50),
      child: Text(title,
          style: GoogleFonts.sacramento(
              textStyle: TextStyle(
            letterSpacing: 2,
            fontSize: 55,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ))));

  Widget circularTitle() => Container(
      margin: EdgeInsets.only(top: 20),
      height: 90,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (scroll) {
          scroll.disallowGlow();
          return true;
        },
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: menuImg.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  menuImgSelect = index;
                });
              },
              child: Container(
                  margin: EdgeInsets.only(right: 20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: menuImgSelect == index
                          ? Colors.white.withOpacity(.9)
                          : Colors.white.withOpacity(.4)),
                  child: Container(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      menuImg[index],
                      fit: BoxFit.fill,
                    ),
                  )),
            );
          },
        ),
      ));

  Widget titleSecondary(title) => Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          title,
          style: GoogleFonts.ubuntu(
              textStyle: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )),
        ),
      );

  Widget menuSecondary() => Container(
      margin: EdgeInsets.only(top: 10),
      height: 45,
      child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (scroll) {
            scroll.disallowGlow();
            return true;
          },
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: menuTitle.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    menuTitleSelect = index;
                  });
                },
                child: Container(
                    margin: EdgeInsets.only(right: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomCenter,
                            colors: menuTitleSelect == index
                                ? [
                                    Colors.deepOrange.withOpacity(v8),
                                    Colors.purple.withOpacity(v8 - .1),
                                  ]
                                : [
                                    Colors.redAccent.withOpacity(v5),
                                    Colors.red.withOpacity(v5),
                                  ])),
                    child: Container(
                        child: Text(
                      menuTitle[index],
                      style: GoogleFonts.ubuntu(
                          textStyle:
                              TextStyle(fontSize: 20, color: Colors.white)),
                    ))),
              );
            },
          )));
}

class CustomClipClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var h = size.height;
    var w = size.height;

    path.lineTo(0, h - 50);
    path.quadraticBezierTo(w * .2, h, w * .4, h * .8);
    path.quadraticBezierTo(w * .8 + 40, h * .6, w * .8 + 80, h * .4);
    path.quadraticBezierTo(w * .8 + 100, h * .2, w * .75, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
