import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonCard extends StatefulWidget {
  final String title;
  late bool engineStarted;
  ButtonCard({
    Key? key,
    required this.title,
    this.engineStarted = false,
  }) : super(key: key);

  @override
  State<ButtonCard> createState() => _ButtonCardState();
}

class _ButtonCardState extends State<ButtonCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.44,
      height: MediaQuery.of(context).size.width * 0.30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[300],
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 229, 229, 230),
            Color.fromARGB(255, 246, 247, 247)
          ],
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 30,
            offset: Offset(5, 5),
            color: Color.fromARGB(255, 210, 222, 245),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
              height: MediaQuery.of(context).size.width * 0.03,
            ),
            Text(
              widget.title,
              style: GoogleFonts.ptSans(
                fontSize: 28,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            CupertinoSwitch(
              value: widget.engineStarted,
              activeColor: Colors.green,
              trackColor: Colors.grey[400],
              thumbColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  widget.engineStarted = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
