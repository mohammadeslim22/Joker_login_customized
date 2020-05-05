import 'dart:ui';

class Shop {


 const Shop(
      {this.id,
      this.title,
      this.image,
      this.display,
      this.imdb,
      this.gendres,
      this.desc});
  final int id;
  final String title;
  final String image;
  final Color display;
  final double imdb;
  final String gendres;
  final String desc;
  static List<Shop> get movieData => const <Shop>[
         Shop(
          image: "assets/images/shopone.jpg",
        ),
         Shop(
          image: "assets/images/shoptwo.jpg",

        ),
         Shop(
           
            image: "assets/images/shopone.jpg",
        ),
                 Shop(
          image: "assets/images/shopone.jpg",
        ),
         Shop(
          image: "assets/images/shoptwo.jpg",

        ),
         Shop(
           
            image: "assets/images/shopone.jpg",
        ),
                 Shop(
          image: "assets/images/shopone.jpg",
        ),
         Shop(
          image: "assets/images/shoptwo.jpg",

        ),
         Shop(
           
            image: "assets/images/shopone.jpg",
        ),
                 Shop(
          image: "assets/images/shopone.jpg",
        ),
         Shop(
          image: "assets/images/shoptwo.jpg",

        ),
         Shop(
           
            image: "assets/images/shopone.jpg",
        ),
                 Shop(
          image: "assets/images/shopone.jpg",
        ),
         Shop(
          image: "assets/images/shoptwo.jpg",

        ),
         Shop(
           
            image: "assets/images/shopone.jpg",
        ),
                 Shop(
          image: "assets/images/shopone.jpg",
        ),
         Shop(
          image: "assets/images/shoptwo.jpg",

        ),
         Shop(
           
            image: "assets/images/shopone.jpg",
        ),
             ];
}
