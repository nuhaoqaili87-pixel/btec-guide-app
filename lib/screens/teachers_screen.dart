import 'package:flutter/material.dart';
import '../models/command_verb.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';

class TeachersScreen extends StatefulWidget {
  const TeachersScreen({super.key});

  @override
  State<TeachersScreen> createState() => _TeachersScreenState();
}

class _TeachersScreenState extends State<TeachersScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final filtered = commandVerbs.where((v) {
      final q = query.trim().toLowerCase();
      if (q.isEmpty) return true;
      return v.english.toLowerCase().contains(q) || v.arabic.contains(q) || v.meaning.contains(q);
    }).toList();

    final roles = [
      ['01 · داخلي', 'المقيّم — Assessor', 'المعلم المسؤول عن تصميم نشاطات التقييم، وتوضيح المعايير للطلبة، واتخاذ قرار التقييم، والتأكد من خلو أعمال الطلبة من السرقة الأدبية.'],
      ['02 · داخلي', 'المدقق الداخلي — Internal Verifier', 'يوافق على خطة التقييم ويدققها، ويأخذ عينة 40% من الطلبة لكل وحدة للتدقيق. يُشترط ألا يكون معلّم المادة نفسها.'],
      ['03 · داخلي', 'ضابط الجودة — Quality Nominee', 'حلقة التواصل بين المدرسة وPearson. يتابع سير العملية التعليمية ويضبط الجودة ويدعم المقيّمين.'],
      ['04 · خارجي', 'المدقق المعياري — Standards Verifier', 'يضمن التزام المدرسة بمعايير Pearson، ويصدر شهادات المؤهل الكامل أو اعتماد الوحدات.'],
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('دليل المعلم الجديد')),
      drawer: const AppDrawer(current: '/teachers'),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SectionEyebrow('للمعلمين الجدد'),
          const SizedBox(height: 10),
          Text('التعليم والتقييم في BTEC', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 10),
          Text(
            'أنتِ مُقيّمة (Assessor) قبل أن تكوني ملقّنة للمعلومة. هذه الصفحة تلخّص أدوار منظومة ضمان الجودة، وربط معايير التقييم بمستويات التفكير، وقاموس أفعال الأوامر.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          const SectionEyebrow('منظومة ضمان الجودة'),
          const SizedBox(height: 10),
          Text('أربعة أدوار تحافظ على مصداقية الشهادة', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 14),
          ...roles.map((r) => Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Container(
                  decoration: const BoxDecoration(border: Border(right: BorderSide(color: AppColors.gold, width: 3))),
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Tag(r[0]),
                      const SizedBox(height: 10),
                      Text(r[1], style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 6),
                      Text(r[2], style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
              )),
          const SizedBox(height: 16),
          const SectionEyebrow('تصنيف بلوم و BTEC'),
          const SizedBox(height: 10),
          Text('كيف ترتبط P/M/D بمستويات التفكير؟', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 14),
          _pmdCard('Pass — معيار النجاح', 'التذكر والفهم', 'Remember · Understand', 'اذكر، صف، عرّف، أوجز', AppColors.teal, AppColors.tealDim),
          _pmdCard('Merit — معيار التفوق', 'التطبيق والتحليل', 'Apply · Analyse', 'طبّق، قارن، صنّف، ناقش', const Color(0xFF7A5A10), AppColors.goldDim),
          _pmdCard('Distinction — معيار الامتياز', 'التقييم والإبداع', 'Evaluate · Create', 'قيّم، احكم، راجع ونقّح، طوّر', AppColors.rust, AppColors.rustDim),
          const SizedBox(height: 20),
          const SectionEyebrow('قاموس مرجعي'),
          const SizedBox(height: 10),
          Text('أفعال الأوامر في معايير التقييم', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 6),
          Text('القائمة الكاملة لشرح أفعال الأوامر المستخدمة في المستويين 2 و3. استخدمي البحث لإيجاد الفعل بسرعة.', style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 14),
          TextField(
            decoration: InputDecoration(
              hintText: 'ابحثي عن فعل، مثال: قيّم، Analyse، اشرح...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: AppColors.paperCard,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.line)),
            ),
            onChanged: (v) => setState(() => query = v),
          ),
          const SizedBox(height: 14),
          if (filtered.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Center(child: Text('لا توجد نتائج مطابقة.', style: TextStyle(color: AppColors.muted))),
            )
          else
            ...filtered.map((v) => Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(border: Border.all(color: AppColors.line), borderRadius: BorderRadius.circular(10), color: AppColors.paperCard),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(v.english.toUpperCase(), style: const TextStyle(fontFamily: 'monospace', fontSize: 11, color: AppColors.muted)),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(v.arabic, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17, color: AppColors.ink)),
                      const SizedBox(height: 6),
                      Text(v.meaning, style: const TextStyle(fontSize: 13.5, color: AppColors.text)),
                    ],
                  ),
                )),
        ],
      ),
    );
  }

  Widget _pmdCard(String tag, String title, String levels, String verbs, Color color, Color bg) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(border: Border(top: BorderSide(color: color, width: 4))),
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Tag(tag, background: bg, foreground: color),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17, color: AppColors.ink)),
            const SizedBox(height: 4),
            Text(levels, style: const TextStyle(color: AppColors.muted, fontFamily: 'monospace', fontSize: 12.5)),
            const SizedBox(height: 6),
            Text('أفعال مثل: $verbs', style: const TextStyle(color: AppColors.muted, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
