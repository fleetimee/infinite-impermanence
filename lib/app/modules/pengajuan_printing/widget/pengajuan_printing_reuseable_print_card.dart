import 'package:akm/app/common/style.dart';
import 'package:flutter/material.dart';

class PengajuanPrintingReuseableCard extends StatelessWidget {
  const PengajuanPrintingReuseableCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      this.onPressed});

  final IconData icon;
  final String title;
  final String subtitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: primaryColor,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.print,
            size: 24.0,
          ),
        ),
      ),
    );
  }
}
