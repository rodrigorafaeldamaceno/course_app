import 'package:course_app/models/course/course_model.dart';
import 'package:course_app/routes.dart';
import 'package:course_app/stores/course/course_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CourseStore controller = CourseStore();
  Size size;
  @override
  void initState() {
    super.initState();
    controller.getCourses();
  }

  Widget cardCourse(Course course) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.courseDetails,
                arguments: course,
              );
            },
            title: Text(
              course.name,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: CircleAvatar(
              radius: 30,
              child: Container(
                width: 70.0,
                height: 70.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(course.logo),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSliverList() {
    return Observer(builder: (_) {
      return SliverList(
        delegate: SliverChildListDelegate(
          controller.courses.map((course) => cardCourse(course)).toList(),
          addAutomaticKeepAlives: true,
        ),
      );
    });
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: size.height * 0.3,
      backgroundColor: Colors.black,
      brightness: Brightness.dark,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CURSOS E TREINAMENTOS',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Selecione o curso ou treinamento que deseja',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
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

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          buildSliverList(),
        ],
      ),
    );
  }
}
