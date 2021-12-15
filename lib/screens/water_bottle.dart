import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'waterContainer.dart';
import 'wave.dart';

class WaterBottle extends StatefulWidget {
  final waterLevel;
  final Color waterColor;
  final Color bottleColor;
  final Color capColor;

  WaterBottle(
      {this.waterLevel,
      this.waterColor = Colors.blue,
      this.bottleColor = Colors.blue,
      this.capColor = Colors.blueGrey});

  @override
  WaterBottleState createState() => WaterBottleState();
}

class WaterBottleState extends State<WaterBottle>
    with TickerProviderStateMixin, WaterContainer {
  @override
  void initState() {
    super.initState();
    initWater(widget.waterColor, this);
    waves.first.animation.addListener(() {
      setState(() {
        this.waterLevel = widget.waterLevel;
      });
    });
  }

  @override
  void dispose() {
    disposeWater();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.hardEdge,
      children: [
        AspectRatio(
          aspectRatio: 1 / 1,
          child: CustomPaint(
            painter: WaterBottlePainter(
              waves: waves,
              waterLevel: this.waterLevel,
              bottleColor: widget.bottleColor,
              capColor: widget.capColor,
            ),
          ),
        ),
      ],
    );
  }
}

class WaterBottlePainter extends CustomPainter {
  final List<WaveLayer> waves;
  final waterLevel;
  final bottleColor;
  final capColor;

  WaterBottlePainter(
      {Listenable? repaint,
      required this.waves,
      required this.waterLevel,
      required this.bottleColor,
      required this.capColor})
      : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    {
      final paint = Paint();
      paint.color = bottleColor;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 3;
      paintEmptyBottle(canvas, size, paint);
    }
    {
      final paint = Paint();
      paint.color = Colors.white;
      paint.style = PaintingStyle.fill;
      final rect = Rect.fromLTRB(0, 0, size.width, size.height);
      canvas.saveLayer(rect, paint);
      paintBottleMask(canvas, size, paint);
    }
    {
      final paint = Paint();
      paint.blendMode = BlendMode.srcIn;
      paint.style = PaintingStyle.fill;
      paintWaves(canvas, size, paint);
    }
    {
      final paint = Paint();
      paint.blendMode = BlendMode.srcATop;
      paint.style = PaintingStyle.fill;
      paintGlossyOverlay(canvas, size, paint);
    }
    canvas.restore();
    {
      final paint = Paint();
      paint.blendMode = BlendMode.srcATop;
      paint.style = PaintingStyle.fill;
      paint.color = capColor;
    }
  }

  void paintEmptyBottle(Canvas canvas, Size size, Paint paint) {
    var p1 = Offset(20, -10);
    var p2 = Offset(20, size.height);
    var paint = Paint()
      ..color = bottleColor
      ..strokeWidth = 4;
    canvas.drawLine(p1, p2, paint);
    p1 = Offset(20, size.height);
    p2 = Offset(size.width - 20, size.height);
    paint = Paint()
      ..color = bottleColor
      ..strokeWidth = 4;
    canvas.drawLine(p1, p2, paint);
    p1 = Offset(size.width - 20, size.height);
    p2 = Offset(size.width - 20, -10);
    paint = Paint()
      ..color = bottleColor
      ..strokeWidth = 4;
    canvas.drawLine(p1, p2, paint);
    p1 = Offset(20, -10);
    p2 = Offset(70, -10);
    paint = Paint()
      ..color = bottleColor
      ..strokeWidth = 4;
    canvas.drawLine(p1, p2, paint);

    p1 = Offset(70, -10);
    p2 = Offset(70, -50);
    paint = Paint()
      ..color = bottleColor
      ..strokeWidth = 4;
    canvas.drawLine(p1, p2, paint);

    p1 = Offset(size.width - 20, -10);
    p2 = Offset(size.width - 70, -10);
    paint = Paint()
      ..color = bottleColor
      ..strokeWidth = 4;
    canvas.drawLine(p1, p2, paint);

    p1 = Offset(size.width - 70, -10);
    p2 = Offset(size.width - 70, -50);
    paint = Paint()
      ..color = bottleColor
      ..strokeWidth = 4;
    canvas.drawLine(p1, p2, paint);
  }

  void paintBottleMask(Canvas canvas, Size size, Paint paint) {
    final neckRingInner = size.width * 0.1;
    final neckRingInnerR = size.width - neckRingInner;
    canvas.drawRect(
        Rect.fromLTRB(
            neckRingInner + 5, 0, neckRingInnerR - 5, size.height - 5),
        paint);
  }

  void paintWaves(Canvas canvas, Size size, Paint paint) {
    for (var wave in waves) {
      paint.color = wave.color;
      final transform = Matrix4.identity();
      final desiredW = 15 * size.width;
      final desiredH = 0.1 * size.height;
      final translateRange = desiredW - size.width;
      final scaleX = desiredW / wave.svgData.getBounds().width;
      final scaleY = desiredH / wave.svgData.getBounds().height;
      final translateX = -wave.offset * translateRange;
      final waterRange = size.height +
          desiredH; // 0 = no water = size.height; 1 = full water = -size.width
      final translateY = (1.0 - waterLevel) * waterRange - desiredH;
      transform.translate(translateX, translateY);
      transform.scale(scaleX, scaleY);
      canvas.drawPath(wave.svgData.transform(transform.storage), paint);
      if (waves.indexOf(wave) != waves.length - 1) {
        continue;
      }
      final gap = size.height - desiredH - translateY;
      if (gap > 0) {
        canvas.drawRect(
            Rect.fromLTRB(0, desiredH + translateY, size.width, size.height),
            paint);
      }
    }
  }

  void paintGlossyOverlay(Canvas canvas, Size size, Paint paint) {
    paint.color = Colors.white.withAlpha(20);
    canvas.drawRect(Rect.fromLTRB(0, 0, size.width * 0.5, size.height), paint);
    paint.color = Colors.white.withAlpha(80);
    canvas.drawRect(
        Rect.fromLTRB(size.width * 0.9, 0, size.width * 0.95, size.height),
        paint);
    final rect = Offset.zero & size;
    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.topRight,
      colors: [
        Colors.white.withAlpha(180),
        Colors.white.withAlpha(0),
      ],
    ).createShader(rect);
    paint.color = Colors.white;
    paint.shader = gradient;
    canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height), paint);
  }

  void paintCap(Canvas canvas, Size size, Paint paint) {
    final capTop = 0.0;
    final capBottom = size.width * 0.2;
    final capMid = (capBottom - capTop) / 2;
    final capL = size.width * 0.08 + 5;
    final capR = size.width - capL;
    final neckRingInner = size.width * 0.1 + 5;
    final neckRingInnerR = size.width - neckRingInner;
    final path = Path();
    path.moveTo(capL, capTop);
    path.lineTo(neckRingInner, capMid);
    path.lineTo(neckRingInner, capBottom);
    path.lineTo(neckRingInnerR, capBottom);
    path.lineTo(neckRingInnerR, capMid);
    path.lineTo(capR, capTop);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WaterBottlePainter oldDelegate) => true;
}
