// ignore_for_file: avoid_print

import 'package:expenses_tracker/screens/add_expense/widgets/save_button.dart';
import 'package:expenses_tracker/utils/constants/colors.dart';
import 'package:expenses_tracker/utils/constants/images.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:expenses_tracker/utils/constants/texts.dart';
import 'package:expenses_tracker/utils/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CreateCategory extends StatelessWidget {
  CreateCategory({super.key});

  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController categoryIconController = TextEditingController();
  final TextEditingController categoryColorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return IconButton(
      onPressed: () {
        List<String> categoriesIcons = [
          EImages.foodIcon,
          EImages.healthIcon,
          EImages.homeIcon,
          EImages.phoneIcon,
          EImages.petIcon,
          EImages.shoppingIcon,
          EImages.entertainmentIcon,
          EImages.travelIcon,
          EImages.cardIcon,
          EImages.spotifyIcon,
          EImages.netflixIcon,
          EImages.youtubeIcon
        ];

        // Create a Category Dialog
        showDialog(
            context: context,
            builder: (ctx) {
              bool isExpended = false;
              String iconSelected = '';
              Color categoryColor = Colors.transparent;

              return StatefulBuilder(builder: (context, setState) {
                return AlertDialog(
                  alignment: Alignment.center,
                  backgroundColor: dark ? EColors.black : EColors.white,
                  shadowColor: dark ? EColors.black : EColors.white,
                  surfaceTintColor: dark ? EColors.black : EColors.white,
                  title: const Text(ETexts.create, textAlign: TextAlign.center),
                  content: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Category Name
                          TextFormField(
                            controller: categoryNameController,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: const InputDecoration(
                              labelText: ETexts.categoryName,
                              isDense: true,
                            ),
                          ),

                          // Category Icon
                          const SizedBox(height: ESizes.md),
                          TextFormField(
                            controller: categoryIconController,
                            onTap: () {
                              setState(() {
                                isExpended = !isExpended;
                              });
                            },
                            textAlignVertical: TextAlignVertical.center,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: ETexts.categoryIcon,
                              isDense: true,
                              suffixIcon:
                                  const Icon(CupertinoIcons.chevron_down),
                              border: OutlineInputBorder(
                                borderRadius: isExpended
                                    ? const BorderRadius.vertical(
                                        top: Radius.circular(
                                            ESizes.borderRadiusLg),
                                      )
                                    : BorderRadius.circular(
                                        ESizes.borderRadiusLg),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          isExpended
                              ? Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: dark
                                        ? EColors.darkGrey
                                        : EColors.lightContainer,
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(
                                          ESizes.borderRadiusLg),
                                      bottom: Radius.circular(
                                          ESizes.borderRadiusLg),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(ESizes.sm),
                                    child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 5,
                                        mainAxisSpacing: 5,
                                      ),
                                      itemCount: categoriesIcons.length,
                                      itemBuilder: (context, int i) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              iconSelected = categoriesIcons[i];
                                            });
                                          },
                                          child: Container(
                                            width: ESizes.containerSize,
                                            height: ESizes.containerSize,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 3,
                                                color: iconSelected ==
                                                        categoriesIcons[i]
                                                    ? EColors.success
                                                    : dark
                                                        ? EColors.black
                                                            .withOpacity(.3)
                                                        : EColors.grey,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      ESizes.borderRadiusLg),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    categoriesIcons[i]),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                )
                              : Container(),

                          // Category Color
                          const SizedBox(height: ESizes.md),
                          TextFormField(
                            readOnly: true,
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (ctx2) {
                                    return AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ColorPicker(
                                            pickerColor: EColors.primary,
                                            onColorChanged: (value) {
                                              setState(() {
                                                categoryColor = value;
                                              });
                                            },
                                          ),
                                          SaveButton(
                                            onPressed: () {
                                              print(categoryColor);
                                              Navigator.pop(ctx2);
                                            },
                                          )
                                        ],
                                      ),
                                    );
                                  });
                            },
                            controller: categoryColorController,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              isDense: true,
                              filled: true,
                              fillColor: categoryColor,
                              labelText: ETexts.categoryColor,
                            ),
                          ),
                          const SizedBox(height: ESizes.md),
                          SaveButton(
                            onPressed: () {
                              // Create a Category Object and POP
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
            });
      },
      icon: const Icon(Icons.add),
    );
  }
}
