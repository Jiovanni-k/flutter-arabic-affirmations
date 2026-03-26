import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'affirmation_card.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  static const List<String> affirmations = [
    "ابتسم للحياة وكن إيجابياً",
    "القوة في الاستمرار رغم الصعاب",
    "الإصرار طريق النجاح",
    "الأمل يفتح أبواب الغد",
    "الثقة بالنفس سر التفوق",
    "العمل الجاد يصنع المعجزات",
    "العزيمة تصنع المستحيل",
    "كل يوم فرصة جديدة",
    "الحلم بداية الإنجاز",
    "النجاح يحتاج إلى صبر",
    "التفاؤل يضيء الطريق",
    "الطموح لا يعرف حدوداً",
    "العمل يسبق الكلام",
    "الثقة تفتح الأبواب المغلقة",
    "النجاح ثمرة الجهد المستمر",
    "الإيجابية تجذب الخير",
    "التحديات تصنع الأبطال",
    "النجاح يبدأ بخطوة",
    "العمل الجماعي سر القوة",
    "الطريق الطويل يبدأ بخطوة",
    "الإبداع يولد من الشغف",
    "النجاح لا يأتي صدفة",
    "الطموح يرفعك عالياً",
    "الجدية تصنع الفرق",
    "التفاؤل سر السعادة",
    "العمل الدؤوب يحقق الأحلام",
    "الثقة بالنفس أساس النجاح",
    "الأمل لا يموت أبداً",
    "النجاح يحتاج إلى عزيمة",
    "الإصرار يحقق المستحيل",
  ];

  static const List<Color> palette = [
    Color(0xFFFDF6EC),
    Color(0xFFFAE3D9),
    Color(0xFFBBDED6),
    Color(0xFF61C0BF),
    Color(0xFFFFB6B9),
    Color(0xFF8AC6D1),
    Color(0xFFB8F2E6),
    Color(0xFFD9F2B4),
  ];

  int getCrossAxisCount(double width) {
    if (width >= 1100) {
      return 4;
    } else if (width >= 700) {
      return 3;
    } else {
      return 1;
    }
  }

  double getChildAspectRatio(double width) {
  if (width >= 1100) {
    return 0.78;
  } else if (width >= 700) {
    return 0.70;
  } else {
    return 1.25;
  }
}

  List<Color> generateCardColors() {
    final random = Random(42);
    return List.generate(
      affirmations.length,
      (_) => palette[random.nextInt(palette.length)],
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = getCrossAxisCount(width);
    final childAspectRatio = getChildAspectRatio(width);
    final colors = generateCardColors();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFF8BC34A),
          elevation: 0,
          title: Text(
            'مرحباً بكم في تطبيق التوكيدات الإيجابية - Jiovanni Kitlo',
            textAlign: TextAlign.center,
            style: GoogleFonts.cairo(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            itemCount: affirmations.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: childAspectRatio,
            ),
            itemBuilder: (context, index) {
              return AffirmationCard(
                statement: affirmations[index],
                color: colors[index],
              );
            },
          ),
        ),
      ),
    );
  }
}