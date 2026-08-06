import 'package:flutter/material.dart';
import '../models/math_question.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';

class MathTestScreen extends StatefulWidget {
  const MathTestScreen({super.key});

  @override
  State<MathTestScreen> createState() => _MathTestScreenState();
}

enum _Stage { intro, quiz, result }

class _MathTestScreenState extends State<MathTestScreen> {
  _Stage stage = _Stage.intro;
  int current = 0;
  int score = 0;
  int? selected;
  late List<MathQuestion> questions;

  @override
  void initState() {
    super.initState();
    questions = List.of(mathQuestions);
  }

  void _start() {
    setState(() {
      stage = _Stage.quiz;
      current = 0;
      score = 0;
      selected = null;
    });
  }

  void _next() {
    if (selected == questions[current].correctIndex) score++;
    if (current < questions.length - 1) {
      setState(() {
        current++;
        selected = null;
      });
    } else {
      setState(() => stage = _Stage.result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('اختبار الرياضيات')),
      drawer: const AppDrawer(current: '/math'),
      body: switch (stage) {
        _Stage.intro => _buildIntro(context),
        _Stage.quiz => _buildQuiz(context),
        _Stage.result => _buildResult(context),
      },
    );
  }

  Widget _buildIntro(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SectionEyebrow('اختبار سريع'),
        const SizedBox(height: 10),
        Text('اختبر مستواك في الرياضيات الأساسية', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 10),
        Text(
          '12 سؤالًا في العمليات الحسابية والنسب والجبر والهندسة بمستوى الصف التاسع. الهدف مساعدتك على معرفة نقطة انطلاقك — وليس الحكم عليك. النتيجة مؤشر إرشادي وليست تشخيصًا رسميًا.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 18),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('• 12 سؤال اختيار من متعدد، لا وقت محدد.', style: TextStyle(color: AppColors.muted)),
                SizedBox(height: 6),
                Text('• أجب دون آلة حاسبة لتحصل على صورة واقعية عن مستواك.', style: TextStyle(color: AppColors.muted)),
                SizedBox(height: 6),
                Text('• في النهاية ستحصل على نتيجتك مع اقتراحات للتخصصات الأنسب.', style: TextStyle(color: AppColors.muted)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: _start, child: const Text('ابدأ الاختبار ←'))),
      ],
    );
  }

  Widget _buildQuiz(BuildContext context) {
    final q = questions[current];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: LinearProgressIndicator(
              value: current / questions.length,
              minHeight: 6,
              backgroundColor: AppColors.paperDim,
              valueColor: const AlwaysStoppedAnimation(AppColors.gold),
            ),
          ),
          const SizedBox(height: 10),
          Text('السؤال ${current + 1} من ${questions.length}', style: const TextStyle(fontFamily: 'monospace', color: AppColors.muted, fontSize: 12.5)),
          const SizedBox(height: 16),
          Text(q.question, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemCount: q.options.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, i) {
                final isSelected = selected == i;
                return InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => setState(() => selected = i),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.goldDim : AppColors.paperCard,
                      border: Border.all(color: isSelected ? AppColors.gold : AppColors.line),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(q.options[i], style: TextStyle(fontSize: 16, color: AppColors.ink, fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400)),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: selected == null ? null : _next,
              child: Text(current == questions.length - 1 ? 'عرض النتيجة ←' : 'التالي ←'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResult(BuildContext context) {
    String title, desc;
    List<String> specs;
    if (score >= 10) {
      title = 'مستوى ممتاز';
      desc = 'أساسك في الرياضيات قوي جدًا، وهذا يفتح لك التخصصات التي تعتمد على حسابات أكثر تقدمًا.';
      specs = ['الهندسة', 'تكنولوجيا المعلومات', 'الإنشاءات والبيئة العمرانية', 'الأعمال (محاسبة وتمويل)'];
    } else if (score >= 7) {
      title = 'مستوى جيد';
      desc = 'لديك أساس جيد يناسب معظم التخصصات، مع القليل من التدريب للتخصصات التقنية.';
      specs = ['تكنولوجيا المعلومات', 'الأعمال', 'الرياضة', 'السفر والسياحة'];
    } else if (score >= 4) {
      title = 'مستوى متوسط';
      desc = 'تحتاج بعض التقوية في الأساسيات، مع إمكانية اختيار أي تخصص يعجبك.';
      specs = ['الضيافة', 'الفن والتصميم', 'الشعر والتجميل', 'الطفولة المبكرة'];
    } else {
      title = 'بحاجة إلى تقوية';
      desc = 'ننصح بجلسات تقوية في الرياضيات الأساسية قبل بدء البرنامج، أيًا كان التخصص المختار.';
      specs = ['الشعر والتجميل', 'الضيافة', 'الرعاية الصحية والاجتماعية', 'الفن والتصميم'];
    }

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 10),
        Center(child: Text('${score}/${questions.length}', style: const TextStyle(fontFamily: 'monospace', fontSize: 52, fontWeight: FontWeight.w700, color: AppColors.ink))),
        const SizedBox(height: 8),
        Center(child: Text(title, style: Theme.of(context).textTheme.headlineMedium)),
        const SizedBox(height: 10),
        Text(desc, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 20),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.6,
          children: specs.map((s) => Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(border: Border.all(color: AppColors.line), borderRadius: BorderRadius.circular(12), color: AppColors.paperCard),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Tag('تخصص مقترح'),
                const SizedBox(height: 8),
                Text(s, style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.ink, fontSize: 13)),
              ],
            ),
          )).toList(),
        ),
        const SizedBox(height: 24),
        OutlinedButton(onPressed: _start, child: const Text('إعادة الاختبار')),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pushReplacementNamed('/holland'),
          child: const Text('التالي: اختبار هولاند ←'),
        ),
      ],
    );
  }
}
