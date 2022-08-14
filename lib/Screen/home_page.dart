import 'package:flutter/material.dart';
import 'package:plant_ui/constant.dart';
import 'package:plant_ui/model/plant_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int selectedIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> plantTypes = [
      'Recommended',
      'Indoor',
      'Outdoor',
      'Garden',
      'Supplement',
    ];
    
   List<Plant> _plantList = Plant.plantList;
   
   bool isFavorite = true;
   
   bool toggleIsFavorite (bool isFavorited){
     return ! isFavorited;
   }



    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Constants.primaryColor.withOpacity(.1)),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search plants',
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Constants.blackColor,
                      ),
                      suffixIcon: Icon(
                        Icons.mic,
                        color: Constants.blackColor,
                      )),
                ),
              ),
            ),
            Container(
              width: size.width,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: plantTypes.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Text(
                          plantTypes[index],
                          style: TextStyle(
                            fontSize: 16,
                            color: selectedIndex == index
                                ? Constants.primaryColor
                                : Colors.black45,
                            fontWeight: selectedIndex == index
                                ? FontWeight.bold
                                : FontWeight.w300,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(height: size.height * 0.3,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _plantList.length,
                itemBuilder: (_,index){
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: size.width * 0.5,
                height: size.height * 0.3,
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20)
                ),

                child: Stack(
                  children: [
                    //images finished
                    Positioned(
                        top: 50,
                        bottom: 50,
                        left: 50,
                        right: 50,
                        child: Image.asset(_plantList[index].imageURL)),
                    Positioned(
                        bottom: 10,
                        left: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          textAlign: TextAlign.start,
                          _plantList[index].category,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 17
                        ),),
                        Text(
                          textAlign: TextAlign.start,
                          _plantList[index].plantName,style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 15,
                        ),),
                      ],
                    )),
                    Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                      height: 25,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text(
                            r'$'+_plantList[index].price.toString()
                        ),
                      )
                    )),
                    Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child:
                        IconButton(
                          icon: Icon(_plantList[index].isFavorated == isFavorite ? Icons.favorite : Icons.favorite_border,size: 25,color: Constants.primaryColor,),
                          onPressed: (){
                            setState(() {
                              isFavorite = toggleIsFavorite(_plantList[index].isFavorated);
                              _plantList[index].isFavorated = isFavorite;
                            });
                          },
                        )
                      )
                    ),
                  ],
                ),
              );
            }),
            ),
            const SizedBox(height: 20,),
            Text('New Plants',style: TextStyle(
              fontWeight: FontWeight.bold
            ),),



          ],
        ),
      ),
    );
  }
}
