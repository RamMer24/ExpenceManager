import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:sizer/sizer.dart';
import 'package:staggered_grid_view_flutter/widgets/sliver.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey =
    GlobalKey<ScaffoldState>(debugLabel: '_tabscreen');
List tab = ['Images', 'Videos'];
bool isloading = true;
int sel = 1;

class _FeedPageState extends State<FeedPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Heloo',
        ),
        elevation: 00,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(
            Icons.menu_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: SizedBox(
          height: 90.h,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text('Scrollable Screen'),
                expandedHeight: 10.0,
                floating: false,
              ),
              SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  mainAxisSpacing: 10.0, // Spacing between rows
                  crossAxisSpacing: 10.0, // Spacing between columns
                  childAspectRatio:
                      1.0, // Aspect ratio of the grid items (width / height)
                ),
                itemBuilder: (BuildContext context, int index) {
                  // This function is called for each item in the grid
                  return Container(
                    height: 100.0, // Set the height of each grid item
                    width: 100.0, // Set the width of each grid item
                    child: Center(
                        child: Image.network('https://cdn.pixabay.com/photo/2023/07/19/19/14/monarch-butterfly-8137642_640.png')),
                  );
                },
                itemCount: 10, // Total number of items in the grid
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Card(
                        margin: const EdgeInsets.all(15),
                        child: Container(
                        color: Colors.blue[100 * (index % 9 + 1)],
                        height: 80,
                        alignment: Alignment.center,
                        child: Text(
                          "Item $index",
                          style: const TextStyle(fontSize: 30),
                        ),
                      ),
                    );
                  },
                  childCount: 5, // 1000 list items
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
