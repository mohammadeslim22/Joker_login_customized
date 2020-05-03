import 'dart:ui';
import 'package:intl/intl.dart' as intl;

class MemberShip {
  final int id;
  final String shopName;
  final String type;
  final Color display;
  final String image;
  final String startingDate;
  final String endDtae;

  MemberShip(
      {this.id,
      this.shopName,
      this.type,
      this.display,
      this.image,
      this.startingDate,
      this.endDtae});
  static List<MemberShip> get membershipsData => [
        new MemberShip(id: 0, type: "شهري", image: "assets/images/qrcode.png",          endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())),
   new MemberShip(id: 0, type: "شهري", image: "assets/images/qrcode.png",          endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())),
             new MemberShip(id: 0, type: "شهري", image: "assets/images/qrcode.png",          endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())),
             new MemberShip(id: 0, type: "شهري", image: "assets/images/qrcode.png",          endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())),
             new MemberShip(id: 0, type: "شهري", image: "assets/images/qrcode.png",          endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())),
             new MemberShip(id: 0, type: "شهري", image: "assets/images/qrcode.png",          endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())),
             new MemberShip(id: 0, type: "شهري", image: "assets/images/qrcode.png",          endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())),
             new MemberShip(id: 0, type: "شهري", image: "assets/images/qrcode.png",          endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())),
             new MemberShip(id: 0, type: "شهري", image: "assets/images/qrcode.png",          endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())),
             new MemberShip(id: 0, type: "شهري", image: "assets/images/qrcode.png",          endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())),
             new MemberShip(id: 0, type: "شهري", image: "assets/images/qrcode.png",          endDtae:intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          startingDate:intl.DateFormat('yyyy-MM-dd').format(DateTime.now())),
      ];
}
