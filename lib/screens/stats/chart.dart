import 'dart:math';
import 'package:expenses_tracker/utils/constants/colors.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:expenses_tracker/utils/helpers/helpers.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _MyChartState();
}

class _MyChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      mainBarData(),
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    final dark = EHelperFunctions.isDarkMode(context);
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(
        toY: y,
        gradient: const LinearGradient(
          colors: [
            EColors.primary,
            EColors.secondary,
            EColors.tertiary,
          ],
          transform: GradientRotation(pi / ESizes.paddingXxl),
        ),
        width: ESizes.md,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          toY: 5,
          color: dark ? EColors.darkerGrey : EColors.grey,
        ),
      )
    ]);
  }

  List<BarChartGroupData> showingGroups() => List.generate(8, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 2);
          case 1:
            return makeGroupData(1, 3);
          case 2:
            return makeGroupData(2, 2);
          case 3:
            return makeGroupData(3, 4.5);
          case 4:
            return makeGroupData(4, 3.8);
          case 5:
            return makeGroupData(5, 1.5);
          case 6:
            return makeGroupData(6, 4);
          case 7:
            return makeGroupData(7, 3.8);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    const AxisTitles axisTitles =
        AxisTitles(sideTitles: SideTitles(showTitles: false));
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: axisTitles,
        topTitles: axisTitles,
        bottomTitles: AxisTitles(
            sideTitles: SideTitles(
          showTitles: true,
          reservedSize: ESizes.reservedSize,
          getTitlesWidget: getTiles,
        )),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: ESizes.reservedSize,
            getTitlesWidget: leftTitles,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      gridData: const FlGridData(show: false),
      barGroups: showingGroups(),
    );
  }

  Widget getTiles(double value, TitleMeta meta) {
    final style = Theme.of(context).textTheme.bodySmall;
    Widget text;

    switch (value.toInt()) {
      case 0:
        text = Text('01', style: style);
        break;
      case 1:
        text = Text('02', style: style);
        break;
      case 2:
        text = Text('03', style: style);
        break;
      case 3:
        text = Text('04', style: style);
        break;
      case 4:
        text = Text('05', style: style);
        break;
      case 5:
        text = Text('06', style: style);
        break;
      case 6:
        text = Text('07', style: style);
        break;
      case 7:
        text = Text('08', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: ESizes.md,
      child: text,
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    final style = Theme.of(context).textTheme.bodySmall;
    String text;
    if (value == 0) {
      text = '1K';
    } else if (value == 2) {
      text = '2K';
    } else if (value == 3) {
      text = '3K';
    } else if (value == 4) {
      text = '4K';
    } else if (value == 5) {
      text = '5K';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }
}
