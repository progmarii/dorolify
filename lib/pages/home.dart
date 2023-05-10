import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // added to format date and time

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return SizedBox(
      width: double.infinity,
      child: Container(
        // homescreenKgU (1:87)
        width: double.infinity,
        height: 812 * fem,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFebdcbe),
              Color(0xFFdecaa2),
              Color(0xFFded2ba),
              Color(0xFFdbcdbf),
              Color(0xFFdecaa2),
              Color(0xFFebdcbe),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              // room1MYc (1:93)
              left: 16 * fem,
              top: 179 * fem,
              child: Align(
                child: SizedBox(
                  width: 344 * fem,
                  height: 421 * fem,
                  child: Image.asset(
                    'assets/page-1/images/dorolify-room-cat1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 42.5 * fem,
              top: 615 * fem,
              child: Align(
                child: SizedBox(
                  width: 189 * fem,
                  height: 67 * fem,
                  child: Text(
                    DateFormat('h:mm a').format(DateTime.now()),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 42.5 * fem,
              top: 660 * fem,
              child: Align(
                child: SizedBox(
                  width: 179 * fem,
                  height: 29 * fem,
                  child: Text(
                    DateFormat('MMMM d, yyyy').format(DateTime.now()),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // dorolify11Q9W (1:100)
              left: 55 * fem,
              top: 15 * fem,
              child: Align(
                child: SizedBox(
                  width: 275 * fem,
                  height: 200 * fem,
                  child: Image.asset(
                    'assets/page-1/images/dorolify.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
