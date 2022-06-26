import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AfterSliderList extends StatefulWidget {
  const AfterSliderList({Key? key}) : super(key: key);

  @override
  State<AfterSliderList> createState() => _AfterState();
}

class _AfterState extends State<AfterSliderList> {
  List<AfterSlider> afterSliders = [
    AfterSlider(
      name: 'The City',
      desc:
          'I want to create a scrollable horizontal listview in my sliverlist; which is in my customscrollview that has sliverappbar.  i used sliverlist first nut it kept throwing errors, then i used, listview.builder but a renderobject cant be placed in a rendersliver. i saw a similar issue on flutter issues on github and tried it in my sliverlist threw this errors; tried it as a sliver on its own; didnt show anything and the whole screen white',
      photoLink: 'assets/images/123.jpg',
    ),
    AfterSlider(
      name: 'Districts',
      desc: 'Chemistry',
      photoLink: 'assets/images/234.jpg',
    ),
    AfterSlider(
        name: 'Discover',
        desc: 'Microbiology',
        photoLink: 'assets/images/567.jpg'),
  ];

  var keyTile;
  bool isExpanded = false;
  void expandTile() {
    setState(() {
      isExpanded = true;
      keyTile = UniqueKey();
    });
  }

  void shrinkTile() {
    setState(() {
      isExpanded = false;
      keyTile = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Container(
            height: 40,
            color: Colors.blue,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'About California',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 180),
                  child: SvgPicture.asset(
                    'assets/svg/arrow-pointing-up-svgrepo-com.svg',
                    color: Colors.white,
                    width: 25.6,
                    height: 25.6,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: true,
              itemCount: afterSliders.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => isExpanded ? shrinkTile() : expandTile(),
                          child: Stack(children: [
                            Image.asset(
                              afterSliders[index].photoLink,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  color: Colors.black12,
                                  width: double.maxFinite,
                                  child: Text(
                                    afterSliders[index].name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      backgroundColor: Colors.black12,
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                        ConfigurableExpansionTile(
                          kExpand: const Duration(seconds: 5),
                          header: Text(''),
                          headerBackgroundColorStart: Colors.white,
                          expandedBackgroundColor: Colors.white,
                          key: keyTile,
                          initiallyExpanded: isExpanded,
                          headerExpanded: Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: AnimatedTextKit(
                                  displayFullTextOnTap: true,
                                  totalRepeatCount: 1,
                                  animatedTexts: [
                                    FadeAnimatedText(
                                      afterSliders[index].desc,
                                      textStyle: const TextStyle(
                                        backgroundColor: Colors.white,
                                        color: Colors.black,
                                        fontSize: 10,
                                        height: 1.4,
                                      ),
                                      duration: const Duration(minutes: 2),
                                      fadeInEnd: 0.01,
                                      fadeOutBegin: 0.9,
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AfterSlider {
  String name;
  String desc;
  String photoLink;
  AfterSlider({
    required this.name,
    required this.desc,
    required this.photoLink,
  });
}
