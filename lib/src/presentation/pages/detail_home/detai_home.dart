import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../colors/AppColors.dart';
import '../../../../widgets/PrimaryButton.dart';
import '../../../../widgets/app_checkbox_button.dart';
import '../../../../widgets/app_large_text.dart';
import '../../../../widgets/app_radio_button.dart';
import '../../../../widgets/app_text.dart';

class DetailPlaces extends StatefulWidget {
  const DetailPlaces({super.key});

  @override
  State<DetailPlaces> createState() => _DetailPlacesState();
}

class _DetailPlacesState extends State<DetailPlaces> {
  var rateNumber = 0.0;
  var selectedIndex = -1;
  var isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/mount_s"
                          ".jpg"),
                      fit: BoxFit.fill)),
            ),
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu_outlined,
                      size: 30,
                      color: AppColors.white,
                    ),
                    Icon(
                      Icons.more_vert_outlined,
                      size: 30,
                      color: AppColors.white,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.65,
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40))),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const AppLargeText(
                                          text: "Yosemite",
                                          size: 28,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Row(
                                          children: [
                                            Icon(
                                              Icons.place,
                                              color: AppColors.liberty,
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            AppText(
                                              text: "USA, California",
                                              color: AppColors.liberty,
                                              size: 14,
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            RatingBar(
                                              ratingWidget: RatingWidget(
                                                  full: const Icon(
                                                    Icons.star_rate_rounded,
                                                    color: Colors.amberAccent,
                                                    size: 10,
                                                  ),
                                                  half: const Icon(
                                                      Icons.star_half_rounded),
                                                  empty: const Icon(
                                                      Icons.star_border_rounded,
                                                      color:
                                                          AppColors.silverSand,
                                                      size: 10)),
                                              onRatingUpdate: (rating) {
                                                setState(() {
                                                  rateNumber = rating;
                                                });
                                              },
                                              itemSize: 22,
                                              itemPadding:
                                                  const EdgeInsets.only(
                                                      right: 2.0),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            AppText(
                                              text: '($rateNumber)',
                                              color: AppColors.silver,
                                            )
                                          ],
                                        )
                                      ],
                                    )),
                                const AppLargeText(
                                  text: "\$ 250",
                                  color: AppColors.liberty,
                                  size: 28,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const AppLargeText(
                              text: 'People',
                              size: 23,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const AppText(
                              text: 'Number of people in your group',
                              color: AppColors.silver,
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(5, (index) {
                                return AppRadioButton(
                                    value: index,
                                    selectedIndex: selectedIndex,
                                    leading: "${index + 1}",
                                    onClick: (value) => setState(() {
                                          selectedIndex = value;
                                        }));
                              }),
                            ),
                            const SizedBox(height: 20),
                            const AppLargeText(
                              text: 'Description',
                              size: 23,
                            ),
                            const SizedBox(height: 5),
                            const AppText(
                                text: 'Yosimite National Park is located in '
                                    'central Sierr Nevada in the US state of '
                                    'California. It is located near the wild protected'
                                    ' areas.'),
                            const SizedBox(height: 26),
                            Row(
                              children: [
                                AppCheckBoxButton(
                                  isChecked: isFavorite,
                                  leading: isFavorite
                                      ? Icons.favorite_outlined
                                      : Icons.favorite_border_outlined,
                                  onClick: () => setState(() {
                                    isFavorite = !isFavorite;
                                  }),
                                ),
                                const SizedBox(width: 10),
                                PrimaryButton(
                                    isFlex: true,
                                    onClick: () => Navigator.pop(context)),
                              ],
                            ),
                          ]),
                    )))
          ],
        ),
      ),
    );
  }
}
