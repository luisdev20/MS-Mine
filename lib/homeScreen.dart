import 'package:flutter/material.dart';
import 'package:minems/application/use_cases/frmRegister.dart';
import 'package:minems/application/use_cases/userPage.dart';
import 'package:go_router/go_router.dart';
import 'package:minems/infrastructure/controllers/conexion.dart';
import 'firebase_options.dart';
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
                Image.network(
                  'https://picsum.photos/seed/49/600',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://picsum.photos/seed/459/600',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://picsum.photos/seed/472/600',
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
                context.push('/frmlogin');
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
