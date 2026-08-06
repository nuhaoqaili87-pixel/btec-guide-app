import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// عنوان قسم مع عين (eyebrow) صغيرة فوقه، بنفس روح هوية الموقع
class SectionEyebrow extends StatelessWidget {
  final String text;
  const SectionEyebrow(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 22, height: 1.5, color: AppColors.gold),
        const SizedBox(width: 8),
        Text(
          text.toUpperCase(),
          style: const TextStyle(
            color: AppColors.gold,
            fontWeight: FontWeight.w700,
            fontSize: 12.5,
            letterSpacing: 0.6,
          ),
        ),
      ],
    );
  }
}

/// وسم صغير (Chip بسيط) بلون خلفية مخصص
class Tag extends StatelessWidget {
  final String label;
  final Color background;
  final Color foreground;
  const Tag(this.label, {super.key, this.background = AppColors.tealDim, this.foreground = AppColors.teal});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(999)),
      child: Text(label, style: TextStyle(color: foreground, fontSize: 12, fontWeight: FontWeight.w700)),
    );
  }
}

/// بطاقة إحصائية صغيرة تستخدم في الصفحة الرئيسية
class StatBlock extends StatelessWidget {
  final String number;
  final String label;
  const StatBlock({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(number, style: const TextStyle(fontFamily: 'monospace', fontSize: 26, fontWeight: FontWeight.w700, color: AppColors.ink)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: AppColors.muted, fontSize: 13)),
      ],
    );
  }
}

/// درج تنقل موحّد بين شاشات التطبيق السبع
class AppDrawer extends StatelessWidget {
  final String current;
  const AppDrawer({super.key, required this.current});

  @override
  Widget build(BuildContext context) {
    final items = <Map<String, String>>[
      {'route': '/', 'label': 'الرئيسية', 'icon': 'home'},
      {'route': '/specializations', 'label': 'التخصصات', 'icon': 'list'},
      {'route': '/holland', 'label': 'اختبار هولاند', 'icon': 'psychology'},
      {'route': '/math', 'label': 'اختبار الرياضيات', 'icon': 'calculate'},
      {'route': '/stories', 'label': 'قصص نجاح', 'icon': 'star'},
      {'route': '/teachers', 'label': 'دليل المعلم', 'icon': 'school'},
      {'route': '/parents', 'label': 'دليل ولي الأمر', 'icon': 'family_restroom'},
    ];

    IconData iconFor(String key) {
      switch (key) {
        case 'home': return Icons.home_rounded;
        case 'list': return Icons.grid_view_rounded;
        case 'psychology': return Icons.psychology_alt_rounded;
        case 'calculate': return Icons.calculate_rounded;
        case 'star': return Icons.star_rounded;
        case 'school': return Icons.school_rounded;
        case 'family_restroom': return Icons.family_restroom_rounded;
        default: return Icons.circle;
      }
    }

    return Drawer(
      backgroundColor: AppColors.paper,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              color: AppColors.ink,
              child: const Row(
                children: [
                  CircleAvatar(backgroundColor: AppColors.gold, child: Text('B', style: TextStyle(color: AppColors.ink, fontWeight: FontWeight.w800))),
                  SizedBox(width: 12),
                  Text('دليل BTEC', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: items.map((item) {
                  final selected = item['route'] == current;
                  return ListTile(
                    leading: Icon(iconFor(item['icon']!), color: selected ? AppColors.gold : AppColors.ink),
                    title: Text(item['label']!, style: TextStyle(fontWeight: selected ? FontWeight.w700 : FontWeight.w500, color: AppColors.ink)),
                    selected: selected,
                    selectedTileColor: AppColors.tealDim,
                    onTap: () {
                      Navigator.of(context).pop();
                      if (!selected) {
                        Navigator.of(context).pushReplacementNamed(item['route']!);
                      }
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
