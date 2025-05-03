import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mechanic/Resourse/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _scroll = PageController();
  final PageController _bannerscroll = PageController();

  @override
  Widget build(BuildContext context) {
    List icons1 = [Images.periodic,Images.i2,Images.i3,Images.i4];
    List icons2 = [Images.i5,Images.i6,Images.i7,Images.i8];
    List icons3 = [Images.i9,Images.i10,Images.i11,Images.i12];
    List headers = [Headers.header1,Headers.header2,Headers.header3];
    List mechanicText = [MechanicText.value1,MechanicText.value2,MechanicText.value3,MechanicText.value4];
    List mechanicImages = [Image.asset(Images.periodic,fit: BoxFit.fill,height: Dimensions.d_60,width: Dimensions.d_60),Image.asset(Images.i2,fit: BoxFit.fill,height: Dimensions.d_60,width: Dimensions.d_60),Image.asset(Images.i3,fit: BoxFit.fill,height: Dimensions.d_60,width: Dimensions.d_60),Image.asset(Images.i4,fit: BoxFit.fill,height: Dimensions.d_60,width: Dimensions.d_60)];
    List headerDetailsImage = [Image.asset(Images.i5,fit: BoxFit.fill,height: 60,width: 60),Image.asset(Images.schedule,fit: BoxFit.fill,height: 60,width: 60),Image.asset(Images.schedule,fit: BoxFit.fill,height: 60,width: 60),Image.asset(Images.schedule,fit: BoxFit.fill,height: 60,width: 60)];
    List serviceText = [ValueAddedServices.value1,ValueAddedServices.value2,ValueAddedServices.value3,ValueAddedServices.value4];
    List serviceImages = [Image.asset(Images.services,fit: BoxFit.fill,height: 60,width: 60),Image.asset(Images.services,fit: BoxFit.fill,height: 60,width: 60),Image.asset(Images.services,fit: BoxFit.fill,height: 60,width: 60),Image.asset(Images.services,fit: BoxFit.fill,height: 60,width: 60)];
    List imagess = [Image.asset(Images.car1,fit: BoxFit.fill),Image.asset(Images.car1,fit: BoxFit.fill),Image.asset(Images.car1,fit: BoxFit.fill),Image.asset(Images.car1,fit: BoxFit.fill)];
    List scheduledService = [Schedule.value1,Schedule.value2,Schedule.value3,Schedule.value4,Schedule.value1];
    List insuranceImage = [Image.asset(Images.insuranceImage,fit: BoxFit.cover),Image.asset(Images.insuranceImage,fit: BoxFit.cover),Image.asset(Images.insuranceImage,fit: BoxFit.cover)];
    List insuranceText = [InsuranceText.value1,InsuranceText.value2,InsuranceText.value3];
    List insuranceDetails = [InsuranceText.value4,InsuranceText.value5,InsuranceText.value6];
    List trendingServiceImage = [Image.asset(Images.trendingService,fit: BoxFit.cover),Image.asset(Images.trendingService,fit: BoxFit.cover),Image.asset(Images.trendingService,fit: BoxFit.cover)];
    List membershipImage = [Image.asset(Images.membershipImage,fit: BoxFit.fill),Image.asset(Images.membershipImage,fit: BoxFit.fill)];
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Dimensions.d_20),
            Container(
              padding: const EdgeInsets.all(20),
              height: screenHeight * 0.12,
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search Services & Packages",
                  hintStyle: TextStyle(
                      fontSize: 16
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(22))
                  ),
                  prefixIcon: Icon(Icons.search,size: 28,color: Colors.red),
                ),
              ),
            ),
            Container(
              color: Colors.grey.shade200,
              height: screenHeight * 0.32,
              child: PageView.builder(
                controller: _bannerscroll,
                scrollDirection: Axis.horizontal,
                itemCount: imagess.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: screenWidth * 0.9,
                    padding: EdgeInsets.fromLTRB(0, 0, Dimensions.d_10, 0),
                    child: imagess[index],
                  );
                },
              ),
            ),
           SmoothPageIndicator(controller: _bannerscroll, count: imagess.length,effect: ScaleEffect(dotWidth: 10,dotHeight: 10)),
           ListView.builder(
             padding: EdgeInsets.only(top: 0),
             physics: const ClampingScrollPhysics(),
             shrinkWrap: true,
                itemCount: headers.length,
               scrollDirection: Axis.vertical,
               itemBuilder: (context, index){
                if (index == 0){
                  return CustomContainer(screenHeight: screenHeight, headers: headers, headerDetailsImage: icons1, screenWidth: screenWidth, scheduledService: scheduledService, indx: index);
                }else if (index == 1){
                  return CustomContainer(screenHeight: screenHeight, headers: headers, headerDetailsImage: icons2, screenWidth: screenWidth, scheduledService: serviceText, indx: index);
                }else{
                  return CustomContainer(screenHeight: screenHeight, headers: headers, headerDetailsImage: icons3, screenWidth: screenWidth, scheduledService: mechanicText, indx: index);
                }
               }
           ),
            Container(
              height: screenHeight * 0.31,
              padding: EdgeInsets.only(left: 20,top: 20,bottom: 20,right: 10),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: insuranceText.length,
                  itemBuilder: (context, index ){
                    return Container(
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // height: 80,
                      width: screenWidth/2.3,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                         ClipRRect(borderRadius: BorderRadius.circular(8),child: insuranceImage[index]),
                          Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:[
                                      Text(insuranceText[index],style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold)),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(Icons.arrow_forward_outlined,color: Colors.white,size: 30),
                                      ),
                              ]
                                  ),
                                  Container(
                                    width: screenWidth * 0.3,
                                      child: Text(
                                        insuranceDetails[index],
                                        maxLines: 3,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),

                                  ),
                                ],
                              )
                    )
                        ],
                      )
                    );
                  },
                  separatorBuilder: (BuildContext context,int index){
                    return SizedBox(width: Dimensions.d_15);
                  }),
            ),
            Container(color: Colors.grey.shade200,height: screenHeight * 0.023),
            Container(
              padding: EdgeInsets.only(bottom: 15),
             color: Colors.white,
              height: screenHeight * 0.45,
              // width: screenWidth * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15,left: 15,bottom: 15),
                    child: Text(
                        "Trending Service",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        )
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(

                      padding: EdgeInsets.only(left: 18),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: trendingServiceImage.length,
                        itemBuilder: (context, index){
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.red
                            ),
                            child: trendingServiceImage[index],
                            width: screenWidth/2,
                          );
                        },
                        separatorBuilder: (context, index){
                          return SizedBox(width: 15);
                        }
                        ),
                  )
                ],
              ),
            ),
            Container(
              height: screenHeight * 0.3,
              // / margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.only(left: 10),
              child: PageView.builder(
                controller: _scroll,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),

                      ),
                      width: screenWidth/1.12,
                      child: membershipImage[index],
                    );
                  },
                  itemCount: membershipImage.length),
            ),
            SmoothPageIndicator(controller: _scroll, count: membershipImage.length,effect: ScaleEffect(
              dotHeight: 10,
              dotWidth: 10
            ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.help),label: "Help"),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Setting")
      ],

      ),
    );
  }
}




class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    required this.screenHeight,
    required this.headers,
    required this.headerDetailsImage,
    required this.screenWidth,
    required this.scheduledService,
    required this.indx,
  }) : super(key: key);

  final double screenHeight;
  final List headers;
  final List headerDetailsImage;
  final double screenWidth;
  final List scheduledService;
  final int indx;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: Dimensions.d_10),
      color: Colors.grey.shade200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenHeight * 0.06,
              margin: EdgeInsets.only(left: Dimensions.d_15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  headers[indx],
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              )
          ),
          Container(
            color: Colors.grey.shade200,
            height: screenHeight * .18,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: headerDetailsImage.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return Container(
                  color: Colors.white,
                  width: screenWidth/4,
                  padding: EdgeInsets.only(top: Dimensions.d_10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(headerDetailsImage[index],height: Dimensions.d_60,width: Dimensions.d_60,fit: BoxFit.fill),
                      SizedBox(height: Dimensions.d_10),
                      Text(scheduledService[index],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500))
                    ],
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: Dimensions.d_3);
            },),
          ),
        ],
      ),
    );
  }
}


