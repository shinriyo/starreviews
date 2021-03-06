library starreviews;

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:starreviews/progress-bar-layout.dart';

class StarReviews extends StatelessWidget {
  final int total;
  final bool showHeader;

  final List<String> starNames;
  final TextStyle starNameStyle;
  final TextStyle percentageStyle;
  final bool showPercentage;

  final Color valueColor;
  final Color progressBarBackgroundColor;
  final List<double> values;

  StarReviews(
      {Key key,
      this.total,
      this.starNames,
      this.showHeader = true,
      this.showPercentage = true,
      this.starNameStyle = const TextStyle(fontSize: 12),
      this.percentageStyle = const TextStyle(fontSize: 12),
      this.valueColor = const Color(0xff656565),
      this.progressBarBackgroundColor = Colors.white,
      this.values})
      : assert(total != null),
        super(key: key) {
    if (values == null) {
      throw ArgumentError('value cannot be empty');
    }

    if (starNames.length > 5) {
      throw ArgumentError('starNames\' cannot be greater than 5');
    }

    if (starNames == null) {
      throw ArgumentError('starNames cannot be empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Visibility(
          visible: this.showHeader,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    _StarDisplay(
                      value: getAverage().toInt(),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${getAverage()} out of 5',
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${this.total} ratings',
                  style:
                      TextStyle(color: const Color(0xff919191), fontSize: 12),
                ),
                SizedBox(
                  height: 17,
                ),
              ],
            ),
          ),
        ),
        ProgressBarLayout(
          starName: this.starNames[0],
          value: this.values[0],
          showPercentage: this.showPercentage,
          starNameStyle: this.starNameStyle,
          percentageStyle: this.percentageStyle,
          valueColor: this.valueColor,
          progressBarBackgroundColor: this.progressBarBackgroundColor,
        ),
        SizedBox(
          height: 11,
        ),
        ProgressBarLayout(
          starName: this.starNames[1],
          value: this.values[1],
          showPercentage: this.showPercentage,
          starNameStyle: this.starNameStyle,
          percentageStyle: this.percentageStyle,
          valueColor: this.valueColor,
          progressBarBackgroundColor: this.progressBarBackgroundColor,
        ),
        SizedBox(
          height: 11,
        ),
        ProgressBarLayout(
          starName: this.starNames[2],
          value: this.values[2],
          showPercentage: this.showPercentage,
          starNameStyle: this.starNameStyle,
          percentageStyle: this.percentageStyle,
          valueColor: this.valueColor,
          progressBarBackgroundColor: this.progressBarBackgroundColor,
        ),
        SizedBox(
          height: 11,
        ),
        ProgressBarLayout(
          starName: this.starNames[3],
          value: this.values[3],
          showPercentage: this.showPercentage,
          starNameStyle: this.starNameStyle,
          percentageStyle: this.percentageStyle,
          valueColor: this.valueColor,
          progressBarBackgroundColor: this.progressBarBackgroundColor,
        ),
        SizedBox(
          height: 11,
        ),
        ProgressBarLayout(
          starName: this.starNames[4],
          value: this.values[4],
          showPercentage: this.showPercentage,
          starNameStyle: this.starNameStyle,
          percentageStyle: this.percentageStyle,
          valueColor: this.valueColor,
          progressBarBackgroundColor: this.progressBarBackgroundColor,
        ),
        SizedBox(
          height: 11,
        ),
      ],
    ));
  }

  double getAverage() {
    double total = 0;
    this.values.forEach((value) {
      total += value;
    });

    int fac = pow(10, 2);
    double d = total / 5;

    return ((d * fac).round() / fac) * 10;
  }
}

class _StarDisplay extends StatelessWidget {
  final int value;
  final Color color;

  const _StarDisplay(
      {Key key, this.value = 0, this.color = const Color(0xffffd900)})
      : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
          color: this.color,
        );
      }),
    );
  }
}
