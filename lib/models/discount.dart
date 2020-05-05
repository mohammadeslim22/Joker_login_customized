import 'dart:ui';
import 'package:intl/intl.dart' as intl;
import 'package:flutter/material.dart';

class Discount {

  Discount(
      {this.id,
      this.title,
      this.image,
      this.display,
      this.startingDate,
      this.endDtae,
      this.desc});
  final int id;
  final String title;
  final String image;
  final Color display;
  final String startingDate;
 final  String endDtae;
  final String desc;

  static List<Discount> get movieData =>  <Discount>[
         Discount(
          image: "assets/images/discount_.png",
          display:Colors.green,
          endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())
        ),
         Discount(
          image: "assets/images/discounttwo.png",
          display:Colors.green,
            endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())
        ),
         Discount(
           
            image: "assets/images/discount.png",
            display:Colors.green,
            endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())
        ),
                 Discount(
          image: "assets/images/discount_.png",
          display:Colors.green,
            endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())
        ),
         Discount(
          image: "assets/images/discounttwo.png",
          display:Colors.green,
            endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())
        ),
         Discount(
           
            image: "assets/images/discount.png",
            display:Colors.green,
            endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())
        ),
                 Discount(
          image: "assets/images/discount_.png",
          display:Colors.green,
            endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())
        ),
         Discount(
          image: "assets/images/discounttwo.png",
          display:Colors.green,
            endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())
        ),
         Discount(
           
            image: "assets/images/discount.png",
            display:Colors.green,
            endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())
        ),
                 Discount(
          image: "assets/images/discount_.png",
          display:Colors.green,
            endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())
        ),
         Discount(
          image: "assets/images/discounttwo.png",
          display:Colors.green,
            endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())
        ),
         Discount(

            image: "assets/images/discount.png",
            display:Colors.green,
            endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())
        ),
                 Discount(
          image: "assets/images/discount_.png",
          display:Colors.green,
            endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())
        ),
         Discount(
          image: "assets/images/discounttwo.png",
          display:Colors.green,
            endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())
        ),
         Discount(
           
            image: "assets/images/discount.png",
            display:Colors.green,
            endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())
        ),
                 Discount(
          image: "assets/images/discount_.png",
          display:Colors.green,
            endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())
        ),
         Discount(
          image: "assets/images/discounttwo.png",
          display:Colors.green,
            endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())
        ),
         Discount(
           
            image: "assets/images/discount.png",
            display:Colors.green,
            endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())
        ),
             ];
}
