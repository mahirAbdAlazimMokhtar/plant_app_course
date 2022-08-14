import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_ui/Screen/loginScreen.dart';
import 'package:plant_ui/Screen/root_page.dart';

import 'package:plant_ui/constant.dart';


class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

final PageController pageController = PageController(initialPage: 0);
int currentIndex = 0;

@override
class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          //build skip button
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 10.0),
            child: TextButton(
                onPressed: () {

                  Navigator.pushReplacement(context, PageTransition(child: const RootScreen(), type: PageTransitionType.rightToLeft));
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 22.0),
                )),
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            children: [
              buildPage(
                  image: 'assets/images/plant-one.png',
                  title: Constants.titleOne,
                  description: Constants.descriptionOne),
              buildPage(
                  image: 'assets/images/plant-two.png',
                  title: Constants.titleTwo,
                  description: Constants.descriptionTwo),
              buildPage(
                  image: 'assets/images/plant-three.png',
                  title: Constants.titleThree,
                  description: Constants.descriptionThree),
            ],
          ),
          Positioned(

              bottom: 50,
              left: 40,
              child: Row(children: buildIndicators(),)),
          Positioned(
            bottom: 35,
            right: 40,
            child: Container(
              decoration: BoxDecoration(
                color: Constants.primaryColor,
                shape: BoxShape.circle
              ),
              child: IconButton(

              onPressed: (){
                //ToDo : 
                if(currentIndex< 2){
                  currentIndex++;
                  if(currentIndex< 3){
                    pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                  }
                }else {
                  Navigator.pushReplacement(context, PageTransition(child: const RootScreen(), type: PageTransitionType.leftToRight));
                }
              },
              icon: const Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,size: 25,),
            ),
            ),
          )
        ],
      ),
    );
  }

//create Indicators with Decoration
  Widget _indicatorsDecoration(bool isActive) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 10.0,
        width: isActive ? 25 : 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Constants.primaryColor
        ),
      ),
    );
  }
  
  //build list Of indicators 

List <Widget> buildIndicators(){
    //var to set the value 
  List<Widget> indicators = [];
  for(int i =0; i<3 ;i++){
    if(currentIndex == i){
      indicators.add(_indicatorsDecoration(true));
    }else{
      indicators.add(_indicatorsDecoration(false));
    }
  }
  return indicators;
}
}

class buildPage extends StatelessWidget {
  const buildPage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(top: 50, bottom: 50.0, left: 40.0, right: 40.0),
      child: Column(
        children: [
          SizedBox(
            height: 400,
            child: Image.asset(image),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyle(
                fontSize: 28,
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 22, color: Colors.grey, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
