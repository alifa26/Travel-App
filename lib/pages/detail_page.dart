import 'package:flutter/material.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/pages/nav_pages/bar_item_page.dart';
import 'package:travel_app/pages/nav_pages/home_page.dart';
import 'package:travel_app/pages/nav_pages/my_page.dart';
import 'package:travel_app/pages/nav_pages/search_page.dart';
import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/app_cubit.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({ Key? key }) : super(key: key);

  
  @override

  _DetailPageState createState() => _DetailPageState();
}



class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4 ;
  int selectedIndex = -1 ;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit , CubitStates>(builder: (context, state) {
      DetailState detail  = state as DetailState; 
      return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [Positioned(
            right: 0,
            left: 0,
            child: Container(
              height: 350,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('http://mark.bslmeiyu.com/uploads/'+detail.place.img),
                  fit: BoxFit.cover
                )
              ),
            ),
          ),
            Positioned(
              left: 20,
              top: 70,
              child: Row(
              children: [
                IconButton(onPressed: (){
                  BlocProvider.of<AppCubit>(context).goHome();
                }, icon: Icon(Icons.menu),color: Colors.white,)
              ],
            )),
            Positioned(
              top: 320,
              child: Container(
                padding: EdgeInsets.only(right: 20,top:30,left:20),
                height: 500,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(text: detail.place.name,
                        color: Colors.black.withOpacity(0.8),),
                        AppLargeText(text: '\$'+detail.place.price.toString(),
                        color: AppColors.mainColor,)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.location_on , color: AppColors.mainColor,),
                        SizedBox(width: 5,),
                        AppText(text: detail.place.location , color: AppColors.textColor1,),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5,(index){
                            return Icon(Icons.star ,
                            color:  index < detail.place.stars ? AppColors.starColor : AppColors.textColor2,);
                          }),
                        ),
                        SizedBox(width: 10,),
                        AppText(text: '(${detail.place.stars}.0)' , color: AppColors.textColor2,)
                      ],
                    ),
                    SizedBox(height: 25,),
                    AppLargeText(text: 'People'
                    ,color: Colors.black.withOpacity(0.8),
                    size: 20,),
                    SizedBox(height: 5,),
                    AppText(text: 'Number of people in your group',color: AppColors.mainTextColor,),
                    SizedBox(height: 10,),
                    Wrap(
                      children: 
                        List.generate(5, (index){
                          return  InkWell(
                            onTap: (){
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButtons(color: selectedIndex == index ? Colors.white : Colors.black,
                               backgroundColor: selectedIndex == index ? Colors.black : AppColors.buttonBackground,
                                borderColor: selectedIndex == index ? Colors.black : AppColors.buttonBackground ,
                                 size: 50,
                                 text: (index+1).toString(),),
                            ),
                          );
                        })
                      ,
                    ),
                    SizedBox(height: 20,),
                    AppLargeText(text: 'Description' , color: Colors.black.withOpacity(0.8), size: 20,),
                    SizedBox(height: 20,),
                    AppText(text: detail.place.description,
                    color: AppColors.mainTextColor,)
                  ],
                ),
            )),
            Positioned(bottom: 20,
            left: 20,
            right: 20,
              child: Row(
              children: [
                AppButtons(color: AppColors.textColor1,
                 backgroundColor: Colors.white,
                  borderColor: AppColors.textColor1,
                   size: 60,
                   isIcon: true,
                   icon: Icons.favorite_border,),
                   SizedBox(width: 20,),
                   ResponsiveButton(
                     isResponsive: true,
                     )
              ],
            ))
          ],
        ),
      ),
    );
    },);
  }
}