import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
           SliverAppBar(
             pinned: true,
             title: Text("Max", style: TextStyle(color: Colors.white),),
            // pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Image.network("https://m.media-amazon.com/images/I/81l6XqCYYQL._AC_UF1000,1000_QL80_.jpg ", fit: BoxFit.cover,),
            ),
            expandedHeight: 500,
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       return Padding(
          //         padding: const EdgeInsets.all(20.0),
          //         child: Container(
          //           width: double.infinity,
          //           height: 400,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //             color: Colors.purple[400],
          //           ),
          //         ),
          //       );
          //     },
          //     childCount: 10,
          //   ),
          // ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 60,
              maxHeight: 80.0,
              child: Container(
                color: Colors.grey,
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Popular"),
                        Text("Show all")
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.8,
              crossAxisSpacing: 10,
            ),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return  Image.network('https://m.media-amazon.com/images/I/81l6XqCYYQL._AC_UF1000,1000_QL80_.jpg', fit: BoxFit.fill,);

            }, childCount: 20),
          ),
          SliverPadding(padding: const EdgeInsets.all(20),
          sliver: SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemExtent: 160.0,
                  itemBuilder:
                      (BuildContext context, int index){
                    return Container(color: Colors.teal[100 * (index % 9)]);
                  }
              ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate{
  final double maxHeight;
  final double minHeight;
  final Widget child;

  _SliverAppBarDelegate({
   required this.maxHeight,
   required this.minHeight,
    required this.child,
});

  Widget build(Object context, double shrinkOffset, bool overlapsContext){
    return child;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate){
    return true;
  }
}