import 'package:flutter/material.dart';
import '../models/specialization.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';

class SpecializationsScreen extends StatefulWidget {
  const SpecializationsScreen({super.key});

  @override
  State<SpecializationsScreen> createState() => _SpecializationsScreenState();
}

class _SpecializationsScreenState extends State<SpecializationsScreen> {
  String filter = 'all';

  final filters = const [
    ['all', 'الكل (14)'],
    ['2023', 'دفعة 2023/2024'],
    ['2024', 'دفعة 2024/2025'],
    ['2025', 'دفعة 2025/2026'],
    ['2026', 'تبدأ 2026/2027'],
  ];

  @override
  Widget build(BuildContext context) {
    final list = filter == 'all'
        ? specializations
        : specializations.where((s) => s.cohortKey == filter).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('التخصصات المهنية')),
      drawer: const AppDrawer(current: '/specializations'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'التخصصات دخلت البرنامج على أربع دفعات منذ عام 2023/2024. اضغط على أي تخصص لعرض التفاصيل.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          SizedBox(
            height: 48,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filters.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final f = filters[i];
                final selected = filter == f[0];
                return ChoiceChip(
                  label: Text(f[1]),
                  selected: selected,
                  selectedColor: AppColors.ink,
                  labelStyle: TextStyle(color: selected ? Colors.white : AppColors.text, fontFamily: 'monospace', fontSize: 12.5),
                  onSelected: (_) => setState(() => filter = f[0]),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              itemCount: list.length,
              itemBuilder: (context, i) => _SpecCard(spec: list[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class _SpecCard extends StatelessWidget {
  final Specialization spec;
  const _SpecCard({required this.spec});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          childrenPadding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
          leading: Text(spec.icon, style: const TextStyle(fontSize: 26)),
          title: Text(spec.name, style: Theme.of(context).textTheme.titleLarge),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Tag(
              spec.cohort,
              background: spec.isActive ? AppColors.tealDim : AppColors.rustDim,
              foreground: spec.isActive ? AppColors.teal : AppColors.rust,
            ),
          ),
          children: [
            Text(spec.summary, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 14),
            _FieldList(title: 'مجالات العمل', items: spec.workFields),
            const SizedBox(height: 10),
            _FieldList(title: 'مجالات الدراسة الجامعية', items: spec.studyFields),
          ],
        ),
      ),
    );
  }
}

class _FieldList extends StatelessWidget {
  final String title;
  final List<String> items;
  const _FieldList({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(), style: const TextStyle(fontFamily: 'monospace', fontSize: 11.5, color: AppColors.teal, fontWeight: FontWeight.w700, letterSpacing: 0.4)),
        const SizedBox(height: 6),
        ...items.map((it) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('•  ', style: TextStyle(color: AppColors.gold, fontWeight: FontWeight.w700)),
                  Expanded(child: Text(it, style: Theme.of(context).textTheme.bodyLarge)),
                ],
              ),
            )),
      ],
    );
  }
}
