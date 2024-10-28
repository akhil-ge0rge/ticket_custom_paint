import 'package:flutter/material.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});
  static List<Color> colors = [
    Colors.red,
    Colors.teal,
    Colors.purple,
    Colors.orange
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Tickets"),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemCount: colors.length,
          padding: const EdgeInsets.all(15),
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemBuilder: (context, index) {
            return Container(
              color: Colors.yellow,
              height: MediaQuery.of(context).size.height * 0.2,
              width: double.infinity,
              child: Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        color: colors.elementAt(index),
                        child: Center(
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: Text(
                              "Movie #${index + 1}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )),
                      Expanded(flex: 4, child: Container()),
                    ],
                  ),
                  CustomPaint(
                    painter: SideCutDesign(),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: double.infinity,
                    ),
                  ),
                  CustomPaint(
                    painter: DottedInitialPath(),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: double.infinity,
                    ),
                  ),
                  CustomPaint(
                    painter: DottedMiddlePath(),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class SideCutDesign extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var h = size.height;
    var w = size.width;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(0, h / 2), radius: 18),
      0,
      10,
      false,
      Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.white,
    );
    canvas.drawArc(
      Rect.fromCircle(center: Offset(w, h / 2), radius: 18),
      0,
      10,
      false,
      Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.white,
    );

    canvas.drawArc(
      Rect.fromCircle(center: Offset(w / 5, h), radius: 10),
      0,
      10,
      false,
      Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.white,
    );
    canvas.drawArc(
      Rect.fromCircle(center: Offset(w / 5, 0), radius: 10),
      0,
      10,
      false,
      Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.white,
    );
    canvas.drawArc(
      Rect.fromCircle(center: Offset(0, h), radius: 10),
      0,
      10,
      false,
      Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.white,
    );
    canvas.drawArc(
      Rect.fromCircle(center: const Offset(0, 0), radius: 10),
      0,
      10,
      false,
      Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.white,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class DottedInitialPath extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var dashWidth = 3;
    var dashSpace = 4;
    double startY = 10;

    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1;

    while (startY < size.height - 10) {
      canvas.drawCircle(Offset(size.width / 5, startY), 2, paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class DottedMiddlePath extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var dashWidth = 3;
    var dashSpace = 4;
    double startY = 10;

    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1;

    while (startY < size.height - 10) {
      canvas.drawCircle(Offset(0, startY), 2, paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
