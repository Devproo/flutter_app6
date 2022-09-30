// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'burger_page.dart';
class HamburgerList extends StatefulWidget {
  final int row;
  HamburgerList({this.row});
  @override
  State<HamburgerList> createState() => _HamburgerListState();
}

class _HamburgerListState extends State<HamburgerList> {
  @override
  Widget build(BuildContext context) {
    int items = 10;

    Widget baconImage = SizedBox(
      height: 160,
      child: Image.asset("images/bacon.png"),
    );
    Widget chickenImage = SizedBox(
      height: 140,
      child: Image.asset("images/chicken.png"),
    );

    return SliverToBoxAdapter(
      child: Container(
        height: widget.row == 2 ? 330 : 240,
        margin: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items,
          itemBuilder: (context, index) {
            bool reverse = widget.row == 2 ? index.isEven : index.isOdd;
            return Stack(
              children: [
                Container(
                  height: 240,
                  width: 200,
                  margin:
                      EdgeInsets.only(left: 20, right: index == items ? 20 : 0),
                  child: GestureDetector(
                    onTap: () {Navigator.of(context).pushNamed(BurgerPage.tag)},
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text(
                             reverse ?  'burger' : 'chicken',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Spacer(),
                                Text(
                                  '19.99 \$ US',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      elevation: 3,
                      margin: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(45),
                          bottomRight: Radius.circular(15),
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: reverse ? 75 : 50,
                  child: GestureDetector(
                    onTap: () {},
                    child: reverse ? chickenImage : baconImage,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
