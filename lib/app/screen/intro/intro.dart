import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/app/core/extensions.dart';
import 'package:todo/controller/introcontroller.dart';

import '../../core/colors.dart';

class Intro extends StatelessWidget {
  Intro({Key? key}) : super(key: key);
  final introdata = IntroController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F2F1),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                  child: PageView.builder(
                   controller: introdata.pagecontroller,
                   onPageChanged: introdata.currentIndex,
                   itemCount: introdata.contents.length,
                   itemBuilder: (context, index) {
                   return Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(
                              introdata.contents[index].imageName ?? ""),
                          width: 340,
                          height: 340,
                        ),
                        SizedBox(
                          height: 10.0.hp,
                        ),
                        Text(
                          introdata.contents[index].title ?? "",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        SizedBox(
                          height: 1.0.hp,
                        ),
                        Text(
                          introdata.contents[index].description ?? "",
                          style: Theme.of(context).textTheme.headline2,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  );
                },
              )),
              Obx(() {
                return Container(
                  // padding: EdgeInsets.only(bottom: 30),
                  width: 60.0.wp,
                  height: 6.0.hp,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: TextButton(
                      onPressed: () {
                        introdata.actionbutton();
                      },
                      child: Text(
                        introdata.currentIndex.value ==
                            introdata.contents.length - 1
                            ? "Continue"
                            : "Next",
                        style: Theme.of(context).textTheme.headline3,
                      )),
                );
              }),
              SizedBox(
                height: 5.0.hp,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(introdata.contents.length, (index) {
                    return Obx(() {
                      return Container(
                        height: 15,
                        width: introdata.currentIndex.value == index ? 55 : 20,
                        margin: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: introdata.currentIndex.value == index
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColor.withOpacity(0.3),
                        ),
                      );
                    });
                  }),
                ),
              ),
              SizedBox(
                height: 6.0.hp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
