import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
class RatingCards extends StatelessWidget {
  final String images;
  final String label;
  final double rating;
  final VoidCallback ontap;
  const RatingCards({
    Key? key,
    required this.images,
    required this.label,
    required this.rating,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      color: Colors.transparent,
      margin: const EdgeInsets.only(
        left: 4,
        right: 4,
      ),
      child: Material(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: ontap,
          splashColor: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 5,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      child: Image.asset(
                        images,
                        fit: BoxFit.fill,
                      ))),
              Expanded(
                  flex: 2,
                  child: Container(
                      padding: const EdgeInsets.only(
                        top: 15,
                        right: 10,
                        left: 10,
                      ),
                      child: Text(
                        label,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ))),
              Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10, bottom: 15, right: 52),
                  child: SmoothStarRating(
                    rating: rating,
                    isReadOnly: true,
                    size: 18,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    color: Color.fromARGB(255, 255, 230, 0),
                    borderColor: Colors.yellow,
                    starCount: 5,
                    allowHalfRating: true,
                    spacing: 2.0,
                    onRated: (value) {
                      print("rating value -> $value");
                      // print("rating value dd -> ${value.truncate()}");
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}