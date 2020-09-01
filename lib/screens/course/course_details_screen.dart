import 'dart:io';

import 'package:course_app/models/course/course_model.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class CourseDetailsScreen extends StatefulWidget {
  CourseDetailsScreen({@required this.course});

  final Course course;

  @override
  _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  Size size;

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: size.height * 0.3,
      backgroundColor: Colors.black,
      brightness: Brightness.dark,
      pinned: true,
      toolbarHeight: 100,
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              widget.course.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
        background: Image(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      leading: Icon(
        Icons.menu,
        color: Colors.white,
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.add_circle,
            color: Colors.white,
          ),
          tooltip: 'Add new entry',
          onPressed: () {},
        ),
      ],
    );
  }

  SliverList buildDescCourse(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Text(
                    widget.course.description,
                    textAlign: TextAlign.justify,
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    physics: NeverScrollableScrollPhysics(),
                    children: widget.course.images
                        .map((image) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) {
                                      return DetailScreen(
                                        NetworkImage(image),
                                      );
                                    }),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(image),
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          buildDescCourse(context),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  DetailScreen(this.image);

  final NetworkImage image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: PhotoView(
        // heroAttributes: PhotoViewHeroAttributes(tag: 'imageHero'),
        imageProvider: image,
      ),
    );
  }
}
