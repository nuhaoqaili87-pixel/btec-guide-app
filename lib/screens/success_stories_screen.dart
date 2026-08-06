import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';
import '../widgets/asset_video_card.dart';

class SuccessStoriesScreen extends StatelessWidget {
  const SuccessStoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('قصص نجاح')),
      drawer: const AppDrawer(current: '/stories'),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SectionEyebrow('قصص نجاح'),
          const SizedBox(height: 10),
          Text('طلبة سبقوك في الطريق', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 10),
          Text(
            'أفضل نصيحة تأتي ممن جرّب. الفيديوهات أدناه من فعالية BTEC × Pearson.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppColors.tealDim, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.teal.withOpacity(0.4))),
            child: const Text(
              'ملاحظة للمعلمة: أضيفي اسم كل طالبة وتخصصها ضمن نص التعليق في الملف success_stories_screen.dart.',
              style: TextStyle(color: AppColors.ink, fontSize: 13.5),
            ),
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset('assets/images/success-event.jpg', fit: BoxFit.cover),
          ),
          const SizedBox(height: 20),
          const AssetVideoCard(
            assetPath: 'assets/videos/success-story-1.mp4',
            caption: 'أضيفي هنا اسم الطالبة وتخصصها ولمحة عن قصتها.',
          ),
          const AssetVideoCard(
            assetPath: 'assets/videos/success-story-2.mp4',
            caption: 'أضيفي هنا اسم الطالبة وتخصصها ولمحة عن قصتها.',
          ),
          const AssetVideoCard(
            assetPath: 'assets/videos/success-story-3.mp4',
            caption: 'أضيفي هنا اسم الطالبة وتخصصها ولمحة عن قصتها.',
          ),
          const SizedBox(height: 10),
          const SectionEyebrow('دليل سريع'),
          const SizedBox(height: 10),
          Text('كيف تجمعين قصص نجاح أخرى؟', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 14),
          _stepCard('01', 'اطلبي من الطلبة المتميزين أو الخريجين تسجيل مقطع قصير عن تجربتهم ولماذا اختاروا هذا التخصص.'),
          _stepCard('02', 'وثّقي التخصص، سنة الالتحاق، وما آل إليه مسارهم الآن (عمل، جامعة، أو الاثنان معًا).'),
          _stepCard('03', 'احصلي على موافقة الطالب أو ولي أمره كتابيًا قبل نشر الفيديو أو الصورة.'),
        ],
      ),
    );
  }

  Widget _stepCard(String num, String text) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(num, style: const TextStyle(fontFamily: 'monospace', color: AppColors.gold, fontWeight: FontWeight.w800, fontSize: 16)),
            const SizedBox(width: 12),
            Expanded(child: Text(text, style: const TextStyle(color: AppColors.muted))),
          ],
        ),
      ),
    );
  }
}

