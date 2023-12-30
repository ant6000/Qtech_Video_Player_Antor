
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  IconData icon;
  String text;
  String? num;
  CustomButton({required this.icon, required this.text, this.num, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(5.w),
        child: Column(
          children: [
            Icon(icon,size: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xFF718096),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (num != null)
                Text(
                  num!,
                  style: const TextStyle(
                    color: Color(0xFF718096),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}