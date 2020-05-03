import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../functions.dart';
import '../env.dart' as env;
import '../models/search_model.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import '../widgets/TextFormInput.dart';

class AdvancedSearch extends StatefulWidget {
  @override
  @override
  AdvanceSearchscreen createState() => new AdvanceSearchscreen();
}

class AdvanceSearchscreen extends State<AdvancedSearch>
    with TickerProviderStateMixin {
  Set<int> selectedOptions = new Set();
  List<int> selectedValues = [];
  static DateTime today = DateTime.now();
  String selectedValue;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final List<SearchModel> options = SearchModel.searchData;
  final List<String> cities = ["Gaza", "Cairo", "London", "Berlin"];
  final List<String> countries = ["Palestine", "UK", "Germany", "Japan"];
  double _ratingStar = 0;
  SolidController _controller = SolidController();
  @override
  Widget build(BuildContext context) {
    Widget dropdown(List<String> items, String hing) {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(7)),
              color: Colors.white,
              border: Border.all(
                color: Colors.grey[300],
                width: 1,
              )),
          child: SearchableDropdown.single(
            displayClearIcon: false,
            icon: Icon(Icons.keyboard_arrow_down),
            underline: Container(
              color: Colors.transparent,
            ),
            items: items.map((city) {
              return DropdownMenuItem(
                child: Text(city),
                value: city,
              );
            }).toList(),
            value: selectedValue,
            hint: hing,
            searchHint: "Select one",
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            isExpanded: true,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: new AppBar(
          centerTitle: true,
          title: Text(
            translate(context, "advanced_search"),
            style: env.mystyle,
          )),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
        children: <Widget>[
          Text(
            translate(
              context,
              "search_through",
            ),
            style: env.mystyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Column(children: <Widget>[
            TextFormInput(
              text: translate(context, 'shop_name_or_part_of_it'),
              cController: usernameController,
            ),
            TextFormInput(
              text: translate(context, 'offername_or_doscreption'),
              cController: passwordController,
            )
          ]),
          const SizedBox(
            height: 20,
          ),
          Text(
            translate(
              context,
              "specializations",
            ),
            style: env.mystyle,
          ),
          const SizedBox(
            height: 10,
          ),
          GridView.count(
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              primary: true,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 4,
              childAspectRatio: 2,
              addRepaintBoundaries: true,
              children: options.map((item) {
                return FlatButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(38.0),
                      side: BorderSide(
                          color: selectedOptions.contains(item.id)
                              ? Colors.red
                              : Colors.grey)),
                  color: Colors.white,
                  textColor: selectedOptions.contains(item.id)
                      ? Colors.red
                      : Colors.black,
                  onPressed: () {
                    setState(() {
                      print(selectedOptions);
                      if (!selectedOptions.add(item.id)) {
                        selectedOptions.remove(item.id);
                      }
                    });
                  },
                  child: Text(
                    item.search,
                  ),
                );
              }).toList()),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //TODO(ISLEEM)
              // map to put
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            translate(
              context,
              "offer_history",
            ),
            style: env.mystyle,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            translate(
              context,
              "accourding_offer_start_end_date",
            ),
            style: env.mysmalllight,
          ),
          const SizedBox(
            height: 10,
          ),
          RaisedButton(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(7.0),
                side: BorderSide(color: Colors.grey[300])),
            color: Colors.white,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.date_range,
                ),
                Text(
                  translate(
                    context,
                    "offer_history",
                  ),
                  style: env.mysmalllight,
                ),
                Text("${today.toLocal()}".split(' ')[0]),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.orange,
                ),
                Text("${today.toLocal()}".split(' ')[0]),
              ],
            ),
            onPressed: () {
              _controller.show();
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                translate(
                  context,
                  "accourding_to_rating",
                ),
                style: env.mystyle,
              ),
              RatingBar(
                onRatingChanged: (rating) =>
                    setState(() => _ratingStar = rating),
                filledIcon: Icons.star,
                emptyIcon: Icons.star_border,
                halfFilledIcon: Icons.star_half,
                isHalfAllowed: true,
                filledColor: Colors.amberAccent,
                emptyColor: Colors.grey,
                halfFilledColor: Colors.orange[300],
                size: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.grey)),
                onPressed: () {},
                color: Colors.grey,
                textColor: Colors.white,
                child: Text(
                    translate(
                      context,
                      "cancel",
                    ),
                    style: env.notificationNO),
              ),
              RaisedButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)),
                onPressed: () {},
                color: Colors.red,
                textColor: Colors.white,
                child: Text(
                    translate(
                      context,
                      "search",
                    ),
                    style: env.notificationNO),
              ),
            ],
          )
        ],
      ),
    );
  }
}
