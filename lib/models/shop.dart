import 'dart:ui';

class Shop {
  final int id;
  final String title;
  final String image;
  final Color display;
  final double imdb;
  final String gendres;
  final String desc;

  Shop(
      {this.id,
      this.title,
      this.image,
      this.display,
      this.imdb,
      this.gendres,
      this.desc});

  static List<Shop> get movieData => [
        new Shop(
          image: "assets/images/shopone.jpg",
        ),
        new Shop(
          image: "assets/images/shoptwo.jpg",

        ),
        new Shop(
           
            image: "assets/images/shopone.jpg",
        ),
                new Shop(
          image: "assets/images/shopone.jpg",
        ),
        new Shop(
          image: "assets/images/shoptwo.jpg",

        ),
        new Shop(
           
            image: "assets/images/shopone.jpg",
        ),
                new Shop(
          image: "assets/images/shopone.jpg",
        ),
        new Shop(
          image: "assets/images/shoptwo.jpg",

        ),
        new Shop(
           
            image: "assets/images/shopone.jpg",
        ),
                new Shop(
          image: "assets/images/shopone.jpg",
        ),
        new Shop(
          image: "assets/images/shoptwo.jpg",

        ),
        new Shop(
           
            image: "assets/images/shopone.jpg",
        ),
                new Shop(
          image: "assets/images/shopone.jpg",
        ),
        new Shop(
          image: "assets/images/shoptwo.jpg",

        ),
        new Shop(
           
            image: "assets/images/shopone.jpg",
        ),
                new Shop(
          image: "assets/images/shopone.jpg",
        ),
        new Shop(
          image: "assets/images/shoptwo.jpg",

        ),
        new Shop(
           
            image: "assets/images/shopone.jpg",
        ),
             ];
}
