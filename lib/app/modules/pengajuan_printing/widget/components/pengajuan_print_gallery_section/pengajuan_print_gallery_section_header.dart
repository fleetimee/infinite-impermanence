import 'package:flutter/material.dart';

class HeaderPrintingGallery extends StatelessWidget {
  const HeaderPrintingGallery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.amber[100],
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Lihat",
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    children: const [
                      Text(
                        "Gallery",
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
                color: Colors.amberAccent[400],
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    8.0,
                  ),
                ),
              ),
              child: const Icon(
                Icons.image,
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
