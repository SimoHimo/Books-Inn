import 'package:books_and_literature/main.dart';
import 'package:flutter/material.dart';

class InkButton extends StatelessWidget {
  const InkButton(
      {Key? key,
      required this.height,
      required this.width,
      required this.icon,
      required this.name,
      required this.onTap})
      : super(key: key);

  final VoidCallback onTap;

  final double height;
  final double width;
  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    const Color textColor = Color(0xfff5f9df);
    const Color buttonColor = Color(0xff051320);

    return Container(
      height: height * 15,
      width: width * 35,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: buttonColor.withOpacity(0.3),
            offset: const Offset(
              3.0,
              3.0,
            ),
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          const BoxShadow(
            color: textColor,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
        borderRadius: BorderRadius.circular(25.0),
        color: buttonColor,
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: textColor,
                size: 45,
              ),
              Text(
                name,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InkButton2 extends StatelessWidget {
  const InkButton2(
      {Key? key,
      required this.height,
      required this.width,
      required this.name,
      required this.onTap})
      : super(key: key);

  final VoidCallback onTap;

  final double height;
  final double width;
  final String name;

  @override
  Widget build(BuildContext context) {
    const Color textColor = Color(0xfff5f9df);
    const Color buttonColor = Color(0xff051320);

    return Container(
      height: height * 5,
      width: width * 25,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: buttonColor.withOpacity(0.3),
            offset: const Offset(
              2.0,
              2.0,
            ),
            blurRadius: 4.0,
            spreadRadius: 1.5,
          ), //BoxShadow
          const BoxShadow(
            color: textColor,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
        borderRadius: BorderRadius.circular(25.0),
        color: buttonColor,
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class BookButton extends StatelessWidget {
  const BookButton(
      {Key? key,
      required this.thumbnail,
      required this.name,
      required this.onTap,
      required this.height,
      required this.width})
      : super(key: key);
  final VoidCallback onTap;
  final Widget thumbnail;
  final String name;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    const Color textColor = Color(0xfff5f9df);
    const Color buttonColor = Color(0xff051320);
    return Container(
      height: height * 4,
      width: width * 6,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: buttonColor.withOpacity(0.3),
            offset: const Offset(
              3.0,
              3.0,
            ),
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          const BoxShadow(
            color: textColor,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          color: darkcolor,
        ),
        color: buttonColor,
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25))),
                height: height * 12,
                width: width * 30,
                child: Center(child: thumbnail)),
            Center(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(25))),
                height: height * 4.3,
                width: width * 20,
                child: Center(
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
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
