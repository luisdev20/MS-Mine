import 'package:flutter/material.dart';
import 'package:minems/application/use_cases/frmRegister.dart';
import 'package:minems/application/use_cases/listAmbiental.dart';
import 'package:minems/application/use_cases/listMineria.dart';
import 'package:minems/application/use_cases/userPage.dart';
import 'package:go_router/go_router.dart';
import 'package:minems/infrastructure/controllers/conexion.dart';
import '../../firebase_options.dart';
// Smooth Page Indicator
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: MainPageView(),
      );
}

class MainPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  PageController? pageViewController;
  //TERMINAR DE IMPLEMENTAR LOS PUNTOS DE PAGEVIEW
  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            child: PageView(
              controller: pageViewController ??= PageController(initialPage: 0),
              scrollDirection: Axis.horizontal,
              children: [
                PageView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/mine-ms.appspot.com/o/profilepics%2Fmineria2.jpg?alt=media&token=47bc1824-b620-4d31-a26e-3fbcba5d7065',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    ListTileMineria(),
                  ],
                ),
                PageView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/mine-ms.appspot.com/o/profilepics%2Fambiental2.jpg?alt=media&token=cd19a551-a497-41cd-aa3f-9b5269769abc',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    ListTileAmbiental()
                  ],
                ),
                Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/mine-ms.appspot.com/o/profilepics%2Fgeologia2.jpg?alt=media&token=a4fefb7f-793d-40ec-80aa-57a64c8a32cc',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: FloatingActionButton(
              elevation: 0,
              onPressed: () {
                context.push('/frmLogin');
                setState(() {});
              },
              backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
              child: Icon(Icons.sort),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 0.8),
            child: smooth_page_indicator.SmoothPageIndicator(
              controller: pageViewController ??= PageController(initialPage: 0),
              count: 3,
              axisDirection: Axis.horizontal,
              onDotClicked: ((index) => pageViewController!.animateToPage(index,
                  duration: Duration(milliseconds: 1500), curve: Curves.ease)),
              effect: smooth_page_indicator.ExpandingDotsEffect(
                dotColor: Colors.white70,
                activeDotColor: Colors.white70,
                expansionFactor: 2,
                dotWidth: 12,
                dotHeight: 12,
              ),
            ),
          )
        ],
      );
}
