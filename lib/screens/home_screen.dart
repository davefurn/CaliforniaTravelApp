import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:travelapp1/screens/next_page.dart';
import 'package:travelapp1/widgets/my_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final _pageController = PageController(initialPage: 0);
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween(
      begin: 1.0,
      end: 2.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 244, 242),
      body: SafeArea(
        child: SingleChildScrollView(
          child: PageView(
            physics: const ClampingScrollPhysics(),
            controller: _pageController,
            scrollDirection: Axis.vertical,
            children: [
              Stack(
                children: [
                  //Pageview for image
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          "assets/images/pexels-erica-zhao-2670273.jpg"),
                    )),
                  ),
                  //Contents
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height * 0.5,
                        maxHeight: MediaQuery.of(context).size.height * 0.6,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: FadeTransition(
                          opacity: _animation,
                          child: Text(
                            'California',
                            style: GoogleFonts.lato(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //custom button
                  Scaffold(
                    backgroundColor: Colors.transparent,
                    key: _key,
                    drawer: myDrawer(),
                    body: Container(
                      color: Colors.transparent,
                      height: 38.6,
                      margin: const EdgeInsets.only(left: 13.8, right: 13.8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              _key.currentState!.openDrawer();
                            },
                            child: SizedBox(
                              height: 20.6,
                              width: 20.6,
                              child: SvgPicture.asset(
                                'assets/svg/icon_drawer.svg',
                                color: const Color(0xFF359c8b),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.6,
                            width: 20.6,
                            child: SvgPicture.asset(
                              'assets/svg/icon_search.svg',
                              color: const Color(0xFF359c8b),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
        
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          color: const Color(0xFF359c8b),
                        ),
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height * 0.08,
                          maxHeight: MediaQuery.of(context).size.height * 0.09,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              _pageController.animateToPage(1,
                                  duration: const Duration(milliseconds: 2000),
                                  curve: Curves.bounceInOut);
                            },
                            child: SizedBox(
                              height: 20.6,
                              width: 20.6,
                              child: SvgPicture.asset(
                                'assets/svg/down-arrow-thin.svg',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              NextPage(),
            ],
          ),
        ),
      ),
    );
  }
}
