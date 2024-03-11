import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../colors/AppColors.dart';
import '../../../../widgets/app_large_text.dart';
import '../../../../widgets/app_text.dart';
import '../../../../widgets/circle_tabs_indicator.dart';
import '../../../../widgets/item_explore.dart';
import '../../../../widgets/item_places.dart';
import '../detail_home/detai_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  final _tabs = [
    const Tab(text: 'Places'),
    const Tab(text: 'Inspiration'),
    const Tab(text: "Emotions")
  ];

  final List<Widget> listPlaces = [
    const ItemPlaces(
      image: "images/mount_f.jpg",
      position: "Sapa, Ha Giang",
      place: "Fansipan",
      onClick: onPlaceClick,
    ),
    const ItemPlaces(
      image: "images/mount_s.jpg",
      position: "Phong Nha, QB",
      place: "Ke Bang",
      onClick: onPlaceClick,
    ),
    const ItemPlaces(
        image: "images/mount_t.jpg", position: "SonTra, DaNang", place: "BaNa"),
    const ItemPlaces(
        image: "images/mount_s.jpg",
        position: "Sapa, Ha Giang",
        place: "Fansipan"),
    const ItemPlaces(
      image: "images/mount_f.jpg",
      position: "Sapa, Ha Giang",
      place: "Fansipan",
      isLastItem: true,
    ),
  ];

  final List<Widget> listExplore = [
    const ItemExplore(
      icons: Icons.kayaking_outlined,
      color: AppColors.periwinkle,
      type: 'Kayaking',
      iconColor: AppColors.liberty,
    ),
    const ItemExplore(
      icons: Icons.scuba_diving_outlined,
      color: AppColors.platinum,
      type: 'Snorkeling',
      iconColor: Colors.amberAccent,
    ),
    const ItemExplore(
      icons: Icons.sports_handball,
      color: AppColors.silverSand,
      type: 'Balloning',
      iconColor: Colors.deepPurple,
    ),
    const ItemExplore(
      icons: Icons.hiking_outlined,
      color: AppColors.gainsboro,
      type: 'Hiking',
      iconColor: Colors.green,
    ),
    const ItemExplore(
      icons: Icons.downhill_skiing_outlined,
      color: AppColors.platinum,
      type: 'Skiing',
      iconColor: Colors.cyanAccent,
    ),
    const ItemExplore(
      icons: Icons.kayaking_outlined,
      color: AppColors.periwinkle,
      type: 'Kayaking',
      iconColor: AppColors.liberty,
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabController = TabController(length: _tabs.length, vsync: this);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.menu_outlined,
                    size: 30,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage("images/intro_f.png"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.eggblue),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const AppLargeText(text: "Discover"),
            const SizedBox(height: 20),
            TabBar(
              tabs: _tabs,
              controller: _tabController,
              unselectedLabelColor: AppColors.silverSand,
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: AppColors.silverSand,
              indicator: const CircleTabIndicator(
                color: Colors.black,
                size: 10,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 270,
              child: TabBarView(controller: _tabController, children: [
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listPlaces.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return listPlaces[index];
                  },
                ),
                Container(
                  height: 300,
                  decoration: const BoxDecoration(color: Colors.black),
                ),
                Container(
                  height: 300,
                  decoration: const BoxDecoration(color: Colors.amberAccent),
                )
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(
                  text: "Explore more",
                  size: 20,
                ),
                AppText(
                  text: "See all",
                  size: 14,
                  color: AppColors.liberty,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: listExplore.length,
                  itemBuilder: (_, index) {
                    return listExplore[index];
                  }),
            )
          ],
        ),
      ),
    );
  }

  static void onPlaceClick(BuildContext context) {
    Navigator.push(context,
        CupertinoPageRoute(builder: (context) => const DetailPlaces()));
  }
}
