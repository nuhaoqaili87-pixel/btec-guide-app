import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';

class ParentsScreen extends StatelessWidget {
  const ParentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = const [
      ['طبيعة الدراسة', 'تركّز على الدراسة النظرية والعلمية', 'تجمع بين التعليم النظري والتدريب العملي في تخصص واحد'],
      ['اختيار المسار', 'مسار شامل يُصنَّف لاحقًا علمي/أدبي', 'تخصص محدد من العاشر حتى الثاني عشر'],
      ['الحقول الدراسية', 'حقول يختار منها الطالب حسب ميوله', 'لا حقول فرعية؛ تخصص واحد طوال 3 سنوات'],
      ['الاختبار النهائي', 'التوجيهي في 11 و12', 'امتحان وزاري في الثقافة المشتركة'],
      ['الشهادة', 'الشهادة المدرسية فقط', 'المدرسية + Pearson + مزاولة مهنة'],
      ['احتساب العلامة', '70% حقول + 30% معدل 11', '70% تقييم البرنامج + 30% ثقافة مشتركة'],
      ['مدة الدراسة', '3 سنوات', '3 سنوات (480 ساعة + 360 + 360)'],
    ];

    final mistakes = [
      ['01', 'جعل الآخرين يقرّرون عن الطالب', 'اتباع رأي الأصدقاء أو توقعات العائلة دون تفكير شخصي ومستقل من الطالب نفسه.'],
      ['02', 'تجاهل ميول الطالب وإمكانياته', 'اختيار تخصص بضغط اجتماعي دون النظر لما يحبه الطالب وما يتقنه فعلًا.'],
      ['03', 'إهمال متطلبات سوق العمل', 'الدراسة في مجال غير مطلوب محليًا ودوليًا، وإهدار السنوات دون عائد مهني حقيقي.'],
    ];

    final faqs = [
      ['هل شهادة BTEC معترف بها رسميًا؟', 'نعم، إلى جانب الشهادة المدرسية، يحصل الطالب على شهادة معتمدة من Pearson العالمية وشهادة مزاولة مهنة، وهي مؤهلات معيارية معترف بها دوليًا.'],
      ['هل يمكن الالتحاق بالجامعة بعد BTEC؟', 'نعم، يتيح البرنامج الالتحاق بجامعات أردنية في تخصصات تطبيقية مرتبطة، وإمكانية معادلة الشهادة في جامعات بريطانية وأوروبية وعالمية مقبولة لدى Pearson.'],
      ['هل التغيير بين التخصصات ممكن بعد البدء؟', 'يختار الطالب تخصصًا واحدًا من بداية العاشر ويكمله حتى الثاني عشر، لذلك مهم جدًا اتخاذ القرار بعناية قبل البدء.'],
      ['هل مسار BTEC أسهل من الأكاديمي؟', 'لا، هو مختلف في الأسلوب وليس أسهل — يعتمد على مشاريع ومهام تقييمية بمعايير Pass وMerit وDistinction، تُراجع عبر منظومة ضمان جودة من أربعة أطراف.'],
      ['كم ساعة دراسة عملية في البرنامج؟', '480 ساعة في العاشر، و360 ساعة في كل من الحادي عشر والثاني عشر، إضافة لمواد الثقافة المشتركة.'],
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('دليل ولي الأمر')),
      drawer: const AppDrawer(current: '/parents'),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SectionEyebrow('لأولياء الأمور'),
          const SizedBox(height: 10),
          Text('قرار التخصص قرار عائلي', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 10),
          Text(
            'اختيار المسار بعد الصف التاسع من أهم القرارات في مسيرة ابنك أو ابنتك. هذه الصفحة تشرح البرنامج بلغة مباشرة.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 22),
          const SectionEyebrow('مقارنة مباشرة'),
          const SizedBox(height: 10),
          Text('الأكاديمي مقابل BTEC', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 14),
          Container(
            decoration: BoxDecoration(border: Border.all(color: AppColors.line), borderRadius: BorderRadius.circular(14)),
            clipBehavior: Clip.antiAlias,
            child: Table(
              border: TableBorder(horizontalInside: const BorderSide(color: AppColors.line)),
              columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(1.2), 2: FlexColumnWidth(1.2)},
              children: [
                TableRow(
                  decoration: const BoxDecoration(color: AppColors.ink),
                  children: ['المقارنة', 'الأكاديمي', 'BTEC'].map((h) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                        child: Text(h, style: const TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w600)),
                      )).toList(),
                ),
                for (int i = 0; i < rows.length; i++)
                  TableRow(
                    decoration: BoxDecoration(color: i.isEven ? AppColors.paperDim : AppColors.paperCard),
                    children: rows[i].map((c) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                          child: Text(c, style: const TextStyle(fontSize: 11.5, color: AppColors.text)),
                        )).toList(),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const SectionEyebrow('بعد التخرج'),
          const SizedBox(height: 10),
          Text('إلى أين يقود مسار BTEC؟', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 14),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('الالتحاق بسوق العمل', style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.ink, fontSize: 16)),
                  SizedBox(height: 8),
                  Text('• شهادة معترف بها من أصحاب العمل\n• خبرة عملية تمنح ميزة تنافسية\n• فرص عمل في شركات محلية ودولية', style: TextStyle(color: AppColors.muted, height: 1.7)),
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
                children: const [
                  Text('استكمال الدراسة الجامعية', style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.ink, fontSize: 16)),
                  SizedBox(height: 8),
                  Text('• قبول في جامعات أردنية بتخصصات مرتبطة\n• إمكانية معادلة الشهادة في جامعات بريطانية وأوروبية\n• إمكانية الجمع بين العمل والدراسة', style: TextStyle(color: AppColors.muted, height: 1.7)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const SectionEyebrow('تجنّبوا هذه الأخطاء'),
          const SizedBox(height: 10),
          Text('أخطاء شائعة عند اختيار التخصص', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 14),
          ...mistakes.map((m) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(m[0], style: const TextStyle(fontFamily: 'monospace', color: AppColors.rust, fontWeight: FontWeight.w800, fontSize: 17)),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(m[1], style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.ink)),
                          const SizedBox(height: 4),
                          Text(m[2], style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          const SizedBox(height: 12),
          const SectionEyebrow('أسئلة متكررة'),
          const SizedBox(height: 10),
          Text('الأسئلة الأكثر شيوعًا', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 12),
          ...faqs.map((f) => Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: Text(f[0], style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.ink, fontSize: 15)),
                    childrenPadding: const EdgeInsets.fromLTRB(18, 0, 18, 16),
                    children: [
                      Align(alignment: Alignment.centerRight, child: Text(f[1], style: Theme.of(context).textTheme.bodyMedium)),
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
                  const Text('ساعدوا ابنكم أو ابنتكم على اكتشاف ميولهم أولًا', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pushReplacementNamed('/holland'),
                    child: const Text('جرّبوا اختبار هولاند معًا ←'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
