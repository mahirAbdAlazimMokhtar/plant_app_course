import 'package:flutter/material.dart';

import 'package:plant_ui/constant.dart';

import 'package:plant_ui/model/plant_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.plantId}) : super(key: key);
  final int plantId;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> plantList = Plant.plantList;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 60,
              left: 25,
              right: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 50,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(0.10),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        color: Constants.primaryColor,
                        size: 30,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(0.10),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                       plantList[widget.plantId].isFavorated == true ?  Icons.favorite : Icons.favorite_border,
                        color: Constants.primaryColor,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              )),
          Positioned(
              top: 110,
              left: 20,
              right: 20,
              child: SizedBox(
            width: size.width,
            height: size.height * 0.4,
            child: Stack(children: [
              Positioned(
                right: 30,
                top: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildDetailPage(title: 'Size', description: plantList[widget.plantId].size),
                    const SizedBox(height: 10,),
                    BuildDetailPage(title: 'Humidity', description: plantList[widget.plantId].humidity.toString()),
                    const SizedBox(height: 10,),
                    BuildDetailPage(title: 'Temperature', description: plantList[widget.plantId].temperature),
                  ],
                ),
              ),
              Positioned(
                left: 50,
                  top: 15,
                  child: SizedBox(height: 300,child: Image.asset(plantList[widget.plantId].imageURL),))
            ],),
          )),
          Positioned(
              top: 370,
              bottom: 0,
              child:Container(
            width: size.width,
            height: size.height * 0.5,
            padding: const EdgeInsets.only(top: 90,left: 20,right: 20),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(25)
                    ,
                topLeft: Radius.circular(25),
              ),
              color: Constants.primaryColor.withOpacity(0.4)
            ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(plantList[widget.plantId].plantName,style: TextStyle(
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 27,
                            ),),
                            const SizedBox(height: 15,),
                            Text(r'$' + plantList[widget.plantId].price.toString(),style: TextStyle(
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),),
                          ],
                        ),
                        const SizedBox(height: 15,),
                        Row(
                          children: [
                            Text(plantList[widget.plantId].rating.toString(),style: TextStyle(
                              color: Constants.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),),
                             Icon(Icons.star,color: Constants.primaryColor,)
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Expanded(child: Text(
                      textAlign: TextAlign.justify,
                      plantList[widget.plantId].decription,style: TextStyle(
                      color: Constants.blackColor.withOpacity(0.5),
                      fontSize: 22,

                    ),))
                  ],
                ),
          ) ,

          ),



        ],
      ),
    );
  }
}

class BuildDetailPage extends StatelessWidget {
  const BuildDetailPage({
    Key? key, required this.title, required this.description,
  }) : super(key: key);
final String title , description;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(
          color: Constants.blackColor,
          fontSize: 17,
          fontWeight: FontWeight.normal
        ),),
        Text(description,style: TextStyle(
          color: Constants.primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.normal
        ),),
      ],
    );
  }
}
