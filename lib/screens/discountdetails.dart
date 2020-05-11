import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';
import '../env.dart' as env;

class DiscountDetails extends StatelessWidget {
  const DiscountDetails({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DiscountDetailsPage();
  }
}

class DiscountDetailsPage extends StatefulWidget {
  @override
  _DiscountDetailsState createState() => _DiscountDetailsState();
}

class _DiscountDetailsState extends State<DiscountDetailsPage>
    with TickerProviderStateMixin {
  double _ratingStar = 0;

  @override
  Widget build(BuildContext context) {
    final bool isRTL = Directionality.of(context) == TextDirection.rtl;
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * .7,
          decoration: const BoxDecoration(
              // gradient: LinearGradient(
              //   begin: Alignment.center,
              //   end: Alignment
              //       .bottomCenter, // 10% of the width, so there are ten blinds.
              //   colors: const <Color>[
              //     Colors.transparent,
              //     Color(0xFFFFFFFF)
              //   ], // whitish to gray
              //  // repeats the gradient over the canvas
              // ),
              image: DecorationImage(
            alignment: Alignment.center,
            matchTextDirection: true,
            image: AssetImage(
              "assets/images/discountbackground.png",
            ),
            fit: BoxFit.cover,
          )),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text("data"),
            centerTitle: true,
          ),
        ),
        Positioned.directional(
          top: 250,
          end: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[ 
              Image.asset(
                "assets/images/points.png",
                width: 30,
                height: 50,
              ),
              const SizedBox(
                height: 8,
              ),
              RatingBar(
                onRatingChanged: (double rating) {
                  setState(() => _ratingStar = rating);
                  // TODO(mislem): use this var to send raiting to API
                  print(_ratingStar);
                },
                filledIcon: Icons.star,
                emptyIcon: Icons.star_border,
                halfFilledIcon: Icons.star_half,
                isHalfAllowed: true,
                filledColor: Colors.amberAccent,
                emptyColor: Colors.grey,
                halfFilledColor: Colors.orange[300],
                size: 20,
              ),
                 const SizedBox(
                height: 8,
              ),
              Row(
                children: <Widget>[
                  Image.asset(
                    "assets/images/redaddreess_icon.png",
                    scale: 3.5,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  
                  Text(
                    "City",
                    style: env.mywhitestyle,
                  ),
                ],
              ),
                   const SizedBox(
                height: 8,
              ),
              Text("Discount Details",style: env.underHeadwhite,)
            ],
          ),
          textDirection: isRTL ? TextDirection.ltr : TextDirection.rtl,
        ),
      ],
    );
  }
}
