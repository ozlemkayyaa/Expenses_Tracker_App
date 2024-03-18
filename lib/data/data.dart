import 'package:expenses_tracker/utils/constants/colors.dart';
import 'package:expenses_tracker/utils/constants/texts.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> transactionsData = [
  {
    'icon': const Icon(
      Icons.food_bank_outlined,
      color: EColors.white,
    ),
    'color': EColors.food,
    'name': ETexts.food,
    'amount': ETexts.foodExpense,
    'date': ETexts.today,
  },
  {
    'icon': const Icon(
      Icons.shopping_cart,
      color: EColors.white,
    ),
    'color': EColors.shopping,
    'name': ETexts.shopping,
    'amount': ETexts.shoppingExpense,
    'date': ETexts.today,
  },
  {
    'icon': const Icon(
      Icons.mode_of_travel_outlined,
      color: EColors.white,
    ),
    'color': EColors.travel,
    'name': ETexts.travel,
    'amount': ETexts.travelExpense,
    'date': ETexts.today,
  },
  {
    'icon': const Icon(
      Icons.health_and_safety_outlined,
      color: EColors.white,
    ),
    'color': EColors.health,
    'name': ETexts.health,
    'amount': ETexts.healthExpense,
    'date': ETexts.yesterday,
  },
  {
    'icon': const Icon(
      Icons.celebration,
      color: EColors.white,
    ),
    'color': EColors.entertainment,
    'name': ETexts.entertainment,
    'amount': ETexts.entertainmentExpense,
    'date': ETexts.yesterday,
  },
  {
    'icon': const Icon(
      Icons.pets,
      color: EColors.white,
    ),
    'color': EColors.petShop,
    'name': ETexts.petShop,
    'amount': ETexts.petShopExpense,
    'date': ETexts.yesterday,
  },
  {
    'icon': const Icon(
      Icons.home,
      color: EColors.white,
    ),
    'color': EColors.home,
    'name': ETexts.home,
    'amount': ETexts.homeExpense,
    'date': ETexts.yesterday,
  },
  {
    'icon': const Icon(
      Icons.food_bank_outlined,
      color: EColors.white,
    ),
    'color': EColors.netflixYouTube,
    'name': ETexts.netflix,
    'amount': ETexts.netflixExpense,
    'date': ETexts.today,
  },
  {
    'icon': const Icon(
      Icons.food_bank_outlined,
      color: EColors.white,
    ),
    'color': EColors.netflixYouTube,
    'name': ETexts.youtube,
    'amount': ETexts.youtubeExpense,
    'date': ETexts.today,
  },
  {
    'icon': const Icon(
      Icons.food_bank_outlined,
      color: EColors.white,
    ),
    'color': EColors.netflixYouTube,
    'name': ETexts.spotify,
    'amount': ETexts.spotifyExpense,
    'date': ETexts.today,
  },
];
