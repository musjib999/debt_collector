import 'package:debt_collector/core/core.dart';
import 'package:debt_collector/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DebtCard extends StatelessWidget {
  final double totalDebt;
  const DebtCard({
    Key? key,
    required this.totalDebt
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue,
            AppColors.awesomeBlue,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Debts',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₦${si.utilityService.numberFormatter(totalDebt)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Icon(Icons.show_chart,color: Colors.white,),
              ],
            )
          ],
        ),
      ),
    );
  }
}