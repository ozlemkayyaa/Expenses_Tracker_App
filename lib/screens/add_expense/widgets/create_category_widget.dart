import 'package:expense_repository/expense_repository.dart';
import 'package:expenses_tracker/bloc/create_category_bloc/create_category_bloc.dart';
import 'package:expenses_tracker/screens/add_expense/widgets/save_button.dart';
import 'package:expenses_tracker/utils/helpers/icon_helper.dart';
import '../../../utils/constants/constants.dart';
import 'package:expenses_tracker/utils/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:uuid/uuid.dart';

class CreateCategoryWidget extends StatefulWidget {
  const CreateCategoryWidget({super.key});

  @override
  State<CreateCategoryWidget> createState() => _CreateCategoryWidgetState();
}

class _CreateCategoryWidgetState extends State<CreateCategoryWidget> {
  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController categoryIconController = TextEditingController();
  final TextEditingController categoryColorController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return IconButton(
      onPressed: () {
        List<String> categoriesIcons = IconHelper.getCategoryIcons();

        // Create a Category Dialog
        showDialog(
            context: context,
            builder: (ctx) {
              bool isExpended = false;
              String iconSelected = '';
              Color categoryColor = Colors.transparent;

              return BlocProvider.value(
                value: context.read<CreateCategoryBloc>(),
                child: StatefulBuilder(builder: (ctx, setState) {
                  return BlocListener<CreateCategoryBloc, CreateCategoryState>(
                    listener: (context, state) {
                      if (state is CreateCategorySuccess) {
                        Navigator.pop(ctx);
                      } else if (state is CreateCategoryLoading) {
                        setState(() {
                          isLoading = true;
                        });
                      }
                    },
                    child: AlertDialog(
                      alignment: Alignment.center,
                      backgroundColor: dark ? EColors.black : EColors.white,
                      shadowColor: dark ? EColors.black : EColors.white,
                      surfaceTintColor: dark ? EColors.black : EColors.white,
                      title: const Text(ETexts.create,
                          textAlign: TextAlign.center),
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
                                  hintText: ETexts.categoryName,
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
                                  hintText: ETexts.categoryIcon,
                                  isDense: true,
                                  suffixIcon:
                                      const Icon(CupertinoIcons.chevron_down),
                                  border: OutlineInputBorder(
                                    borderRadius: isExpended
                                        ? const BorderRadius.vertical(
                                            top: Radius.circular(
                                              ESizes.borderRadiusLg,
                                            ),
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
                                        borderRadius:
                                            const BorderRadius.vertical(
                                          top: Radius.circular(
                                              ESizes.borderRadiusLg),
                                          bottom: Radius.circular(
                                              ESizes.borderRadiusLg),
                                        ),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.all(ESizes.sm),
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
                                                  iconSelected =
                                                      categoriesIcons[i];
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
                                                          ESizes
                                                              .borderRadiusLg),
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
                                                  // ignore: avoid_print
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
                                  hintText: ETexts.categoryColor,
                                ),
                              ),
                              const SizedBox(height: ESizes.md),
                              isLoading == true
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : SaveButton(
                                      onPressed: () {
                                        // Create a Category Object and POP
                                        Category category = Category.empty;
                                        category.categoryId = const Uuid().v1();
                                        category.name =
                                            categoryNameController.text;
                                        category.icon = iconSelected;
                                        category.color =
                                            categoryColor.toString();
                                        context
                                            .read<CreateCategoryBloc>()
                                            .add(CreateCategory(category));
                                      },
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              );
            });
      },
      icon: const Icon(Icons.add),
    );
  }
}
