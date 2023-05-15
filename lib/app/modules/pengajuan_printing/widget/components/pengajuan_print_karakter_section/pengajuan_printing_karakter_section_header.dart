import 'package:flutter/material.dart';

class HeaderPrintingKarakter extends StatelessWidget {
  const HeaderPrintingKarakter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Print",
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Analisa Karakter",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.teal[400],
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    8.0,
                  ),
                ),
              ),
              child: const Icon(
                Icons.settings_accessibility,
                size: 24.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
