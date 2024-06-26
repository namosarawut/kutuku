import 'package:flutter/material.dart';
import 'package:kutuku/model/initial_page_model.dart';
import 'package:kutuku/routing/convert_route.dart';
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
    backgroundColor: const Color(0xff514EB7),
    foregroundColor: Colors.white,
  );


  @override
  Widget build(BuildContext context) {
    var setEnv = DataStore().getEnv<String>("ENVIRONMENT_NAME");
    var urls = DataStore().getEnv<String>("BFF_BASE_URL");
    // print(setEnv);
    // print(urls);
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
                height: MediaQuery.of(context).size.height /1.5,
                child: PageView.builder(
                  controller: controller,
                  padEnds: false,
                  itemCount: defaultPageData.length,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(
                              height:  MediaQuery.of(context).size.height /2.1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(defaultPageData[index].imgPath.toString()),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(defaultPageData[index].title.toString(),
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                            Text(defaultPageData[index].subTitle.toString(),
                              style: const TextStyle(
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
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.createAccount.toStringPath());
                    },
                    style: buttonStyle,
                    child: const Text('Create Account'),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const Text("Already Have an account",style: TextStyle(color: Color(0xff514EB7),fontWeight: FontWeight.w700),)
            ],
          ),
        ),
      ],
    ));
  }
}
