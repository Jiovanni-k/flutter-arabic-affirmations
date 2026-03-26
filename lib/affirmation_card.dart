import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AffirmationCard extends StatefulWidget {
  final String statement;
  final Color color;

  const AffirmationCard({
    super.key,
    required this.statement,
    required this.color,
  });

  @override
  State<AffirmationCard> createState() => _AffirmationCardState();
}

class _AffirmationCardState extends State<AffirmationCard> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  void reset() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTight = screenWidth < 1000;

    return Card(
      elevation: 8,
      shadowColor: Colors.black26,
      color: widget.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.statement,
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                fontSize: isTight ? 17 : 20,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2D3142),
              ),
            ),
            const SizedBox(height: 12),
            const Divider(
              color: Color(0xFFE07A5F),
              thickness: 1.5,
            ),
            const SizedBox(height: 10),
            Text(
              '$counter',
              style: GoogleFonts.cairo(
                fontSize: isTight ? 28 : 32,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF5A8F7B),
              ),
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Color(0xFFE07A5F),
              thickness: 1.5,
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: reset,
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 18,
                    ),
                    label: Text(
                      'Reset',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: isTight ? 14 : 16,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7FB069),
                      padding: EdgeInsets.symmetric(
                        horizontal: isTight ? 8 : 14,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: increment,
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 18,
                    ),
                    label: Text(
                      'Like',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: isTight ? 14 : 16,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE58F65),
                      padding: EdgeInsets.symmetric(
                        horizontal: isTight ? 8 : 14,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
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