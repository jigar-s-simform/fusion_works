import 'package:flutter/material.dart';

import '../../utils/common_widgets/dashed_line.dart';
import '../../values/constants.dart';

class TimelineBackground extends StatelessWidget {
  const TimelineBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final textStyle =
        Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10);
    return Column(
      children: List.generate(49, (index) {
        return SizedBox(
          width: deviceWidth,
          height: Constants
              .timeLineCardHeight, // Each hour takes up 60 pixels height
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: index == 48
                    ? Text('00:00', style: textStyle)
                    : index.isEven
                        ? Text(
                            '${(index ~/ 2).toString().padLeft(2, '0')}:00',
                            style: textStyle,
                          )
                        : Text(
                            '${((index - 1) ~/ 2).toString().padLeft(2, '0')}:30',
                            style: textStyle,
                          ),
              ),
              const Expanded(
                child: SizedBox(
                  height: 1,
                  child: DashedLine(),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
