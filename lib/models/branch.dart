import 'dart:ui';

class Branch {
  final int id;
  final String title;
  final String address;
  final Color display;
  final double imdb;
  final String gendres;
  final String desc;

  Branch(
      {this.id,
      this.title,
      this.address,
      this.display,
      this.imdb,
      this.gendres,
      this.desc,
      });
        static List<Branch> get branchData => [
       new Branch(
         id:0,
          title: "فرع الرياض",
          address:"عنوان الفرع يوضع هنا منطقة - شارع - رقم "
        ),
        new Branch(
          id:1,
          title: "فرع المدينة المنورة",
          address:"عنوان الفرع يوضع هنا منطقة - شارع - رقم "

        ),
        new Branch(
           id:2,
            title: "فرع جدة",
              address:"عنوان الفرع يوضع هنا منطقة - شارع - رقم "
        ),
                new Branch(
                  id:3,
          title: "فرع مكة",
          address:"عنوان الفرع يوضع هنا منطقة - شارع - رقم "
        ),
        new Branch(
          id:4,
          title: "assets/images/shoptwo.jpg",
          address:"عنوان الفرع يوضع هنا منطقة - شارع - رقم "

        ),
        new Branch(
           id:5,
            title: "assets/images/shopone.jpg",
            address:"عنوان الفرع يوضع هنا منطقة - شارع - رقم "
        ),
                new Branch(
                  id:6,
          title: "assets/images/shopone.jpg",
          address:"عنوان الفرع يوضع هنا منطقة - شارع - رقم "
        ),

        ];
}