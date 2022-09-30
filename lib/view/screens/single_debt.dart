import 'package:debt_collector/index.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SingleDebt extends StatelessWidget {
  final DebtModel debt;
  const SingleDebt({Key? key, required this.debt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<DebtMenuItem>(
            onSelected: (value) {
              if (value == DebtMenuItem.edit) {
              } else if (value == DebtMenuItem.delete) {}
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem(
                  value: DebtMenuItem.edit,
                  child: Text('Edit'),
                ),
                PopupMenuItem(
                  value: DebtMenuItem.delete,
                  child: Text('Delete'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(12.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  debt.debtor,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Text(
                  '₦${si.utilityService.numberFormatter(debt.amount)}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            DebtInfoContainer(
              title: 'Date',
              info: '${debt.date.day}/${debt.date.month}/${debt.date.year}',
              color: Colors.blue,
              icon: Icons.calendar_month,
            ),
            SizedBox(height: 4.h),
            DebtInfoContainer(
              title: 'Item',
              info: debt.item,
              color: Colors.orange,
              icon: Icons.perm_identity,
            ),
          ],
        ),
      ),
    );
  }
}

class DebtInfoContainer extends StatelessWidget {
  const DebtInfoContainer({
    Key? key,
    required this.title,
    required this.info,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final String title;
  final String info;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: color,
            ),
          ),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
            ),
            SizedBox(
              height: 3.sp,
            ),
            Text(
              info,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
