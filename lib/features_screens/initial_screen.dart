import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kutuku/model/initial_page_model.dart';
import 'package:kutuku/user/data_store.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final controller = PageController();

  final List<InitialPageModel> defaultPageData = [
    const InitialPageModel(id: 1,imgPath: "assets/initialScreen/image1.png",title: "Various Collections Of The Latest Products",subTitle: "Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum."),
    const InitialPageModel(id: 2,imgPath: "assets/initialScreen/image2.png",title: "Complete Collection Of Colors And Sizes",subTitle: "Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum."),
    const InitialPageModel(id: 3,imgPath: "assets/initialScreen/image3.png",title: "Find The Most Suitable Outfit For You",subTitle: "Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum."),

  ];
  final buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: Color(0xff514EB7),
    foregroundColor: Colors.white,
  );


  @override
  Widget build(BuildContext context) {
    var setEnv = DataStore().getEnv<String>("ENVIRONMENT_NAME");
    var urls = DataStore().getEnv<String>("BFF_BASE_URL");
    print(setEnv);
    print(urls);
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 32,
          color: Colors.white54,
          child: Column(
            children: [
              Container(
                height: 80,
                color: Colors.white,
              ),
              SizedBox(
                height: 590,
                child: PageView.builder(
                  controller: controller,
                  padEnds: false,
                  itemCount: defaultPageData.length,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        color: Colors.white,
                        child: Column(
                          children: [
                            ClipRRect(
                              child: Image.asset(defaultPageData[index].imgPath.toString()),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(defaultPageData[index].title.toString(),
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                            Text(defaultPageData[index].subTitle.toString(),
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w100),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SmoothPageIndicator(
                controller: controller,
                count: defaultPageData.length,
                effect: const ColorTransitionEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  // type: WormType.thinUnderground,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: buttonStyle,
                    child: Text('Create Account'),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text("Already Have an account",style: TextStyle(color: Color(0xff514EB7),fontWeight: FontWeight.w700),)
            ],
          ),
        ),
      ],
    ));
  }
}
