import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';

class HollandTestScreen extends StatelessWidget {
  const HollandTestScreen({super.key});

  static const testUrl = 'https://holland-test-22ff7.web.app/';

  Future<void> _openTest(BuildContext context) async {
    final uri = Uri.parse(testUrl);
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تعذّر فتح الرابط. تأكد من اتصالك بالإنترنت.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final types = [
      {'letter': 'R', 'name': 'الواقعي — Realistic', 'desc': 'يفضّل العمل اليدوي والعملي والأنشطة الخارجية.', 'fields': 'الهندسة · الإنشاءات · الزراعة', 'color': AppColors.rust},
      {'letter': 'I', 'name': 'البحثي — Investigative', 'desc': 'يحب التحليل وحل المشكلات المعقدة.', 'fields': 'تكنولوجيا المعلومات · الرياضات الإلكترونية', 'color': AppColors.teal},
      {'letter': 'A', 'name': 'الفني — Artistic', 'desc': 'يميل للتعبير الحر والإبداع.', 'fields': 'الفن والتصميم · الوسائط الإبداعية', 'color': AppColors.gold},
      {'letter': 'S', 'name': 'الاجتماعي — Social', 'desc': 'يستمتع بمساعدة الآخرين ورعايتهم.', 'fields': 'الرعاية الصحية والاجتماعية · الطفولة المبكرة', 'color': AppColors.teal},
      {'letter': 'E', 'name': 'الريادي — Enterprising', 'desc': 'يميل للقيادة والإقناع وبدء المشاريع.', 'fields': 'الأعمال · السفر والسياحة', 'color': AppColors.rust},
      {'letter': 'C', 'name': 'التنظيمي — Conventional', 'desc': 'يفضّل الدقة والعمل ضمن إجراءات واضحة.', 'fields': 'الضيافة · الأعمال · الشعر والتجميل', 'color': AppColors.gold},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('اختبار هولاند')),
      drawer: const AppDrawer(current: '/holland'),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SectionEyebrow('اختبار الميول المهنية'),
          const SizedBox(height: 10),
          Text('اختبار هولاند: بوصلتك نحو التخصص المناسب', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 10),
          Text(
            'طوّر عالم النفس جون هولاند نظرية تقول إن الناس والمهن يمكن تصنيفها إلى ستة أنماط شخصية. الاختبار يستغرق دقائق، ونتيجته تعطيك مؤشرًا أوليًا — لا قرارًا نهائيًا.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _openTest(context),
              icon: const Icon(Icons.open_in_new_rounded, size: 18),
              label: const Text('ابدأ اختبار هولاند الآن'),
            ),
          ),
          const SizedBox(height: 32),
          const SectionEyebrow('RIASEC'),
          const SizedBox(height: 10),
          Text('الأنماط الستة للشخصية المهنية', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 14),
          ...types.map((t) => Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 46,
                        height: 46,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(top: BorderSide(color: t['color'] as Color, width: 3)),
                        ),
                        child: Text(t['letter'] as String, style: TextStyle(fontFamily: 'monospace', fontSize: 26, fontWeight: FontWeight.w800, color: t['color'] as Color)),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(t['name'] as String, style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(height: 4),
                            Text(t['desc'] as String, style: Theme.of(context).textTheme.bodyMedium),
                            const SizedBox(height: 8),
                            Tag(t['fields'] as String),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          const SizedBox(height: 12),
          Card(
            color: AppColors.ink,
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                children: [
                  const Text('جاهز؟', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  const Text('اضغط الزر لفتح اختبار هولاند في المتصفح، وعُد إلى التطبيق بعد أن تحصل على نتيجتك.',
                      textAlign: TextAlign.center, style: TextStyle(color: Color(0xFFB9C2D9), fontSize: 13.5)),
                  const SizedBox(height: 16),
                  ElevatedButton(onPressed: () => _openTest(context), child: const Text('فتح اختبار هولاند')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
