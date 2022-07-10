import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'package:travelapp1/buttons/menu_button.dart/my_drawer_header.dart';
import 'package:travelapp1/widgets/after_slider_list.dart';

import 'package:travelapp1/widgets/my_drawer_list.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../widgets/animation_builder.dart';
import '../widgets/item_menu.dart';
import '../widgets/rating_cards.dart';
import '../widgets/slider_widget.dart';

class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        reverse: false,
        slivers: [
          SliverAppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 1,
            backgroundColor: Colors.white,
            floating: false,
            pinned: true,
            centerTitle: true,
            title: const Text(
              'California',
              style: TextStyle(
                color: Colors.transparent,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Carousel(
                  boxFit: BoxFit.fill,
                  noRadiusForIndicator: true,
                  autoplay: true,
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: Duration(milliseconds: 1000),
                  dotSize: 6.0,
                  dotIncreasedColor: Colors.white,
                  dotColor: Colors.white38,
                  dotBgColor: Colors.transparent,
                  dotPosition: DotPosition.bottomCenter,
                  dotVerticalPadding: 8.0,
                  showIndicator: true,
                  indicatorBgPadding: 5.0,
                  images: [
                    Image.asset(
                      'assets/images/pexels-brayden-law-3329731(2).jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/15882405713_7a51be7dd6_o.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/pexels-enric-cruz-lópez-6039208(1).jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/pexels-ryan-3865192(1).jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/pexels-rodnae-productions-8783605(1).jpg',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            expandedHeight: 245,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 13,
              ),
              Text(
                'California',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.065,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      ItemMenu(
                        icons: const Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                        label: 'Tours',
                        ontap: () {},
                      ),
                      ItemMenu(
                        icons: const Icon(
                          Icons.bed_outlined,
                          color: Colors.blue,
                        ),
                        label: 'Hotels',
                        ontap: () {},
                      ),
                      ItemMenu(
                        icons: const Icon(
                          Icons.train_outlined,
                          color: Colors.blue,
                        ),
                        label: 'Metro maps ',
                        ontap: () {},
                      ),
                      ItemMenu(
                        icons: const Icon(
                          Icons.map_outlined,
                          color: Colors.blue,
                        ),
                        label: 'map',
                        ontap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Container(
                  height: 25,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue[600],
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Hotels in California',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: Material(
                  color: Colors.white,
                  elevation: 2,
                  child: InkWell(
                      onTap: () {},
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset(
                          "assets/images/wallpaperflare.com_wallpaper.jpg",
                          height: 165,
                          fit: BoxFit.fill,
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                child: Text(
                  'Best Tours',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Container(
                  color: Colors.transparent,
                  height: 220,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      RatingCards(
                        images: 'assets/images/3e.jpg',
                        label:
                            'Full-Day Iconic Sights of LA, Hollywood, Beverly Hills, Beaches and More',
                        rating: 4.5,
                        ontap: () {},
                      ),
                      RatingCards(
                        images: 'assets/images/6c.jpg',
                        label:
                            'Muir Woods & Sausalito Half-Day Tour (Return by Bus or Ferry from Sausalito)',
                        rating: 4,
                        ontap: () {},
                      ),
                      RatingCards(
                        images: 'assets/images/e2.jpg',
                        label:
                            'Napa and Sonoma Wine Country Full-Day Tour from San Francisco',
                        rating: 5,
                        ontap: () {},
                      ),
                      RatingCards(
                        images: 'assets/images/11.jpg',
                        label: 'Warner Bros. Studio Tour Hollywood',
                        rating: 2,
                        ontap: () {},
                      ),
                      RatingCards(
                        images: 'assets/images/f6.jpg',
                        label:
                            'Big Bus San Francisco Hop-on Hop-off Open Top Tour',
                        rating: 4,
                        ontap: () {},
                      ),
                      RatingCards(
                        images: 'assets/images/f2.jpg',
                        label: 'San Diego Harbor Cruise',
                        rating: 4,
                        ontap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AnimationBulding(),
            ]),
          ),
          //
        ],
      ),
      drawer: Drawer(
        backgroundColor: Color(0xfff303030),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyHeaderDrawer(),
              Align(alignment: Alignment.bottomLeft, child: myDrawerList()),
            ],
          ),
        ),
      ),
    );
  }
}
