import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Bba.dart';
import 'Bca.dart';
import 'Bcom.dart';
import 'Bscit.dart';
import 'nv.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<String> courses = ['BCOM', 'BBA', 'BCA', 'BSC-IT'];

  final Map<String, String> courseBackgrounds = {
    'BCOM': 'assets/images/bcom.jpg',
    'BBA': 'assets/images/bba.jpg',
    'BCA': 'assets/images/bca.jpg',
    'BSC-IT': 'assets/images/bscit.jpg',
  };

  final List<String> sliderImages = [
    'assets/images/bcom1.jpg',
    'assets/images/bba1.jpg',
    'assets/images/bca1.jpg',
    'assets/images/bscit1.jpg'
  ];

  final SwiperController _swiperController = SwiperController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: nv(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Material Campus',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25),

            /// Card Swiper (replaces CarouselSlider)
            Container(
              height: 250,
              child: Swiper(
                controller: _swiperController,
                itemCount: sliderImages.length,
                autoplay: true,
                pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    activeColor: Colors.black,
                    color: Colors.grey,
                    size: 8,
                    activeSize: 10,
                  ),
                ),
                onIndexChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      sliderImages[index],
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 25),

            /// Courses Grid
            GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 40,
                childAspectRatio: 1.0,
              ),
              itemCount: courses.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _buildCourseButton(context, courses[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseButton(BuildContext context, String course) {
    return InkWell(
      onTap: () {
        _navigateToCoursePage(context, course);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 4.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Card(
          color: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              courseBackgrounds[course] ?? 'assets/images/bcom.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width / 2 - 20,
              height: MediaQuery.of(context).size.width / 2 - 20,
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToCoursePage(BuildContext context, String course) {
    switch (course) {
      case 'BCOM':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BComPage()));
        break;
      case 'BBA':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BbaPage()));
        break;
      case 'BCA':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BcaPage()));
        break;
      case 'BSC-IT':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BscItPage()));
        break;
    }
  }
}
