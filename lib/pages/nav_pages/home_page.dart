import 'package:flutter/material.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    'balloning.png' : 'Balloning',
    'hiking.png' : 'Hiking',
    'kayaking.png' : 'Kayaking',
    'snorkling.png' : 'Snorkling'
  };
  @override
  Widget build(BuildContext context) {
TabController _tabController = TabController(length: 3, vsync: this);
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<AppCubit , CubitStates>(
        builder: (context, state){
          if(state is LoadedState){
            var info = state.places;
            return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70 , left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu,
                size: 30,
                color: Colors.black ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey
                  ),
                )
              ],
            ),
          ),
          SizedBox(height:  30,),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: AppLargeText(text: 'Discover')),
          SizedBox(height:  30,),
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                ////indicatorPadding: EdgeInsets.only(left:  ),
                labelPadding : const EdgeInsets.only(left: 20, right: 20),
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndicator(color: AppColors.mainColor , radius: 4),
                isScrollable : true,
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: 'Places'),
                  Tab(text: 'Inspiration',),
                  Tab(text: 'Emotions',)
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(itemCount: info.length,
                scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        BlocProvider.of<AppCubit>(context).detailPage(info[index]);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 15, top :10),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage('http://mark.bslmeiyu.com/uploads/'+info[index].img),
                          fit: BoxFit.cover
                        )
                      ),
                                      ),
                    );
                  }, 
                ),
                Text('2'),
                Text('3')
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.only(right :20,left: 20 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [AppLargeText(text: 'Explore more' ,size: 22,),
              AppText(text: 'See all',color: AppColors.textColor1,)],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 120,
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 20),
            child: ListView.builder(
              itemCount: images.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index){
            return Container(
              margin: EdgeInsets.only(right: 30),
              child: Column(
                children: [
                  Container(
                      ///  margin: EdgeInsets.only(right: 50),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage('images/'+images.keys.elementAt(index)),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: AppText(
                        text: images.values.elementAt(index),
                        color: AppColors.textColor2,
                      ),
                    )
                ],
              ),
            );}),
          )
        ],
      );
          }else{
            return Container();
          }
        },
      )
    );
  }
}

class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _circlePainter(color: color, radius: radius);
  }
 

}
 class _circlePainter extends BoxPainter{
  final Color color;
  double radius;
  _circlePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(configuration.size!.width/2, configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
    
  } 