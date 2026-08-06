import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('دليل BTEC')),
      drawer: const AppDrawer(current: '/'),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _Hero(),
          _Doors(),
          _StatsStrip(),
          _Overview(),
          _CompareTable(),
          _NextSteps(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _Hero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.inkSoft, AppColors.ink],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.08), borderRadius: BorderRadius.circular(999), border: Border.all(color: Colors.white24)),
            child: const Text('معتمد من Pearson — وزارة التربية والتعليم الأردنية', style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
          const SizedBox(height: 20),
          const Text(
            'رحلتك في BTEC تبدأ بقرار واحد، وهذا التطبيق يساعدك تتخذه بثقة.',
            style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700, height: 1.35),
          ),
          const SizedBox(height: 14),
          const Text(
            'دليل عربي شامل لطلبة الصف التاسع وأولياء أمورهم وللمعلمين الجدد في تخصصات BTEC.',
            style: TextStyle(color: Color(0xFFC7CEE0), fontSize: 15, height: 1.6),
          ),
          const SizedBox(height: 22),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed('/holland'),
                child: const Text('ابدأ باختبار هولاند ←'),
              ),
              OutlinedButton(
                onPressed: () => Navigator.of(context).pushNamed('/specializations'),
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.white54)),
                child: const Text('تصفّح التخصصات'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Doors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 32, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionEyebrow('من أنت؟'),
          const SizedBox(height: 10),
          Text('اختر الباب الذي يخصّك', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          _DoorCard(
            title: 'طالب أفكّر بالتخصص',
            desc: 'اكتشف ميولك عبر اختبار هولاند، واختبر مستواك في الرياضيات.',
            colors: const [Color(0xFF1E3159), Color(0xFF0F1930)],
            route: '/holland',
          ),
          const SizedBox(height: 14),
          _DoorCard(
            title: 'ولي أمر أريد أفهم البرنامج',
            desc: 'قارن بين المسار الأكاديمي وBTEC، واطّلع على الأسئلة الشائعة.',
            colors: const [Color(0xFF2E7D6B), Color(0xFF1B4A40)],
            route: '/parents',
          ),
          const SizedBox(height: 14),
          _DoorCard(
            title: 'معلم جديد في تخصص BTEC',
            desc: 'تعرّف على أدوار التقييم وأفعال الأوامر ومعايير P/M/D.',
            colors: const [Color(0xFFB4552E), Color(0xFF7A3720)],
            route: '/teachers',
          ),
        ],
      ),
    );
  }
}

class _DoorCard extends StatelessWidget {
  final String title;
  final String desc;
  final List<Color> colors;
  final String route;
  const _DoorCard({required this.title, required this.desc, required this.colors, required this.route});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () => Navigator.of(context).pushNamed(route),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors, begin: Alignment.topRight, end: Alignment.bottomLeft),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Text(desc, style: const TextStyle(color: Colors.white70, fontSize: 13.5, height: 1.5)),
            const SizedBox(height: 12),
            const Text('ابدأ من هنا ←', style: TextStyle(color: Colors.white, fontSize: 13, fontFamily: 'monospace', fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

class _StatsStrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 32, 20, 0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppColors.paperCard, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppColors.line)),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 18,
        crossAxisSpacing: 12,
        childAspectRatio: 2.6,
        children: const [
          StatBlock(number: '14', label: 'تخصصًا مهنيًا شاملًا'),
          StatBlock(number: '3', label: 'سنوات دراسة (صف 10 – 12)'),
          StatBlock(number: '1200', label: 'ساعة تدريب عملي تقريبًا'),
          StatBlock(number: '2', label: 'مسار تخرّج: عمل أو جامعة'),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 36, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionEyebrow('لمحة سريعة'),
          const SizedBox(height: 10),
          Text('ما هو برنامج BTEC؟', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 10),
          Text(
            'برنامج تعليم مهني وتقني معتمد دوليًا من Pearson، تطبّقه وزارة التربية والتعليم الأردنية بعد الصف التاسع. يجمع بين التدريب العملي عبر مشاريع ومهام تقييمية حقيقية، ومعرفة نظرية مرتبطة مباشرة بسوق العمل.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          _InfoRow(tag: 'تعلّم تطبيقي', title: 'مشاريع حقيقية بدل الحفظ', desc: 'يُقيَّم الطالب عبر مهام عملية ترتبط بمعايير محددة.'),
          _InfoRow(tag: 'اعتماد دولي', title: 'شهادة Pearson + الشهادة المدرسية', desc: 'يتخرّج الطالب بشهادة معتمدة عالميًا إلى جانب شهادة الوزارة.'),
          _InfoRow(tag: 'مسارات مفتوحة', title: 'جامعة أو سوق عمل فورًا', desc: 'الشهادة تتيح الالتحاق بجامعات أو دخول سوق العمل مباشرة.'),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String tag;
  final String title;
  final String desc;
  const _InfoRow({required this.tag, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 12),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Tag(tag),
            const SizedBox(height: 10),
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 6),
            Text(desc, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

class _CompareTable extends StatelessWidget {
  final rows = const [
    ['طبيعة الدراسة', 'نظرية وعلمية', 'نظري + تدريب عملي في تخصص'],
    ['اختيار المسار', 'يُصنَّف لاحقًا علمي/أدبي', 'تخصص واحد من العاشر حتى الثاني عشر'],
    ['الاختبار النهائي', 'التوجيهي (11 و12)', 'امتحان الثقافة المشتركة'],
    ['الشهادة', 'الشهادة المدرسية فقط', 'المدرسية + Pearson + مزاولة مهنة'],
    ['احتساب العلامة', '70% حقول + 30% معدل 11', '70% تقييم البرنامج + 30% ثقافة مشتركة'],
  ];

  const _CompareTable();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionEyebrow('مسارات مقارنة'),
          const SizedBox(height: 10),
          Text('الأكاديمي مقابل BTEC', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 14),
          Container(
            decoration: BoxDecoration(border: Border.all(color: AppColors.line), borderRadius: BorderRadius.circular(14)),
            clipBehavior: Clip.antiAlias,
            child: Table(
              border: TableBorder(horizontalInside: const BorderSide(color: AppColors.line)),
              columnWidths: const {0: FlexColumnWidth(1.1), 1: FlexColumnWidth(1.3), 2: FlexColumnWidth(1.3)},
              children: [
                TableRow(
                  decoration: const BoxDecoration(color: AppColors.ink),
                  children: ['المقارنة', 'الأكاديمي', 'BTEC'].map((h) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    child: Text(h, style: const TextStyle(color: Colors.white, fontSize: 12.5, fontWeight: FontWeight.w600)),
                  )).toList(),
                ),
                for (final r in rows)
                  TableRow(
                    decoration: BoxDecoration(color: rows.indexOf(r).isEven ? AppColors.paperDim : AppColors.paperCard),
                    children: r.map((c) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      child: Text(c, style: const TextStyle(fontSize: 12.5, color: AppColors.text)),
                    )).toList(),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/parents'),
              child: const Text('لمزيد من التفاصيل لولي الأمر ←'),
            ),
          ),
        ],
      ),
    );
  }
}

class _NextSteps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionEyebrow('لم تحدد وجهتك بعد؟'),
          const SizedBox(height: 10),
          Text('ابدأ بخطوتين بسيطتين', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 14),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('1. اختبار هولاند لاختيار التخصص', style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.ink)),
                  const SizedBox(height: 6),
                  Text('يكشف نمط شخصيتك المهنية ويربطها بالتخصصات الأنسب لك.', style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 10),
                  OutlinedButton(onPressed: () => Navigator.of(context).pushNamed('/holland'), child: const Text('ابدأ الاختبار ←')),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('2. اختبار سريع لمستوى الرياضيات', style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.ink)),
                  const SizedBox(height: 6),
                  Text('بعض التخصصات تحتاج أساسًا أقوى في الرياضيات. اعرف مستواك خلال دقائق.', style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 10),
                  OutlinedButton(onPressed: () => Navigator.of(context).pushNamed('/math'), child: const Text('ابدأ الاختبار ←')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
