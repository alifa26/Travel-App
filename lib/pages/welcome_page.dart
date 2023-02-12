import 'package:flutter/material.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../misc/colors.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({ Key? key }) : super(key: key);

  @override
  _welcomePageState createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {

  List images = [
    'welcome-one.png',
    'welcome-two.png',
    'welcome-three.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(scrollDirection: Axis.vertical,
      itemCount: images.length,
      itemBuilder: (_,index){
        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/"+images[index]),
              fit: BoxFit.cover
            )
          ),
          child: Container(
            margin: EdgeInsets.only(top: 150,left: 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
                  AppLargeText(text: 'Trips'),
                  AppText(text: 'Mountains',size: 30,),
                  SizedBox(height: 20,),
                  Container(
                    width: 250,
                    child: AppText(
                      text:'mountain hikes giveb you incredible sense of freedom along with endurance test',
                      color: AppColors.textColor2,
                      size: 14,
                    ),
                  ),
                  SizedBox(height: 40,),
                  GestureDetector(
                    onTap: (){
                      BlocProvider.of<AppCubit>(context).getData();
                    },
                    child: Container(
                      width: 200,
                      child: Row(
                        children: [
                          ResponsiveButton(width: 120,),
                        ],
                      )),
                  )

                ],
              ),
              Column(
                children: [
                  Container(
                    height: 80,
                    width: 9,
                    child: ListView.builder(itemCount: images.length,
                    itemBuilder: (BuildContext context , int indexDots){
                      return Container(
                        margin: EdgeInsets.only(bottom: 3),
                        width: 8,
                        height:index == indexDots ? 25 : 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: index == indexDots ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.3)
                        ),
                      );
                    } ),
                  )
                ],
              )],
            ),
          ),
        );
      }),
    );
  }
}
/* 

                  List<Widget>.generate(3, (indexDots){
                    return 
                  })as Widget
                

*/