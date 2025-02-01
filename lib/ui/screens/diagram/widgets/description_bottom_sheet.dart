import 'package:family_budget/helpers/extensions.dart';
import 'package:family_budget/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> showDescriptionBottomSheet(
  BuildContext context,
  List<Color> colors,
  List<String> titles,
  List<double> totalCounts,
  double allCount,
) {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    clipBehavior: Clip.hardEdge,
    constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.6,minHeight: colors.length * 30 + 200),
    context: context,
    builder: (context) {
      return FractionallySizedBox(
        // heightFactor: 0.2,
        child: _Body(
          colors,
          titles,
          totalCounts,
          allCount,
        ),
      );
    },
  );
}

class _Body extends StatelessWidget {
  const _Body(this.colors, this.titles, this.totalCounts, this.allCount);

  final List<Color> colors;
  final List<String> titles;
  final List<double> totalCounts;
  final double allCount;

  @override
  Widget build(BuildContext context) {
    double allPercents = 0;
    List<double> percents = [];
    for (var i = 0; i < totalCounts.length; i++) {
      if (i != totalCounts.length - 1) {
        percents.add(
            double.parse((totalCounts[i] * 100 / allCount).toStringAsFixed(2)));
        allPercents += percents[i];
      } else {
        percents.add(double.parse((100 - allPercents).toStringAsFixed(2)));
      }
    }
    return Container(
      height: 30 * colors.length + 200,
      decoration:  BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Описание диаграммы',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.onSurface.withOpacity(0.9),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ...List.generate(
                titles.length,
                (index) => SizedBox(
                      child: Row(
                        children: [
                          Container(
                            height: 8,
                            width: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: colors[index],
                            ),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Expanded(
                            child: Text(
                              titles[index],
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.onSurface.withOpacity(0.9),
                              ),
                            ),
                          ),
                          Text(
                            '${percents[index]}%',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.onSurface.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                    ))
          ].separateBy(const SizedBox(
            height: 8,
          )),
        ),
      ),
    );
  }
}
