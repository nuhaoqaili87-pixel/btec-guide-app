class CommandVerb {
  final String english;
  final String arabic;
  final String meaning;

  const CommandVerb({required this.english, required this.arabic, required this.meaning});
}

const List<CommandVerb> commandVerbs = [
  CommandVerb(english: 'Apply', arabic: 'طبّق', meaning: 'ربط المعرفة الحالية بالمواقف الجديدة أو المختلفة.'),
  CommandVerb(english: 'Assess', arabic: 'احكم', meaning: 'أخذ المعلومات لاتخاذ القرارات أو التقدير أو الحكم، بدعمه بالأدلة.'),
  CommandVerb(english: 'Classify', arabic: 'صنّف', meaning: 'تنظيم المعلومات وفقًا لمعايير محددة.'),
  CommandVerb(english: 'Compare', arabic: 'قارن', meaning: 'البحث في المواضيع بشكل تفصيلي مع النظر في أوجه التشابه والاختلاف.'),
  CommandVerb(english: 'Critically compare', arabic: 'قارن بشكل نقدي', meaning: 'مقارنة وتفريق وإيجاد أوجه التشابه والاختلاف، مع تفاصيل داعمة مبنية على منهجية علمية.'),
  CommandVerb(english: 'Analyse', arabic: 'حلّل', meaning: 'تقسيم الموضوع إلى أجزاء منفصلة وفحص كل جزء، وإظهار كيف ترتبط الأفكار الرئيسية ببعضها.'),
  CommandVerb(english: 'Carry out', arabic: 'نفّذ', meaning: 'أكمل مهمة أو نشاطًا محددًا.'),
  CommandVerb(english: 'Clarify', arabic: 'وضّح', meaning: 'اشرح المعلومات بطريقة واضحة وموجزة.'),
  CommandVerb(english: 'Define', arabic: 'عرّف', meaning: 'تحديد معنى كلمة أو عبارة أو عملية.'),
  CommandVerb(english: 'Demonstrate', arabic: 'مثّل', meaning: 'تطبيق المهارات في موقف عملي وإظهار فهم للموضوع.'),
  CommandVerb(english: 'Describe', arabic: 'صف', meaning: 'الكتابة أو التحدث عن الموضوع أو النشاط مع إعطاء معلومات مفصلة.'),
  CommandVerb(english: 'Differentiate', arabic: 'فرّق', meaning: 'ذكر الاختلافات بين شيئين أو أكثر.'),
  CommandVerb(english: 'Distinguish', arabic: 'ميّز', meaning: 'إظهار أو التعرف على الفرق بين العناصر أو الأفكار أو المعلومات.'),
  CommandVerb(english: 'Develop', arabic: 'طوّر', meaning: 'تحديد ثم بناء موضوع أو خطة أو فكرة.'),
  CommandVerb(english: 'Discuss', arabic: 'ناقش', meaning: 'تقديم وصف مفصل يشمل مجموعة من الآراء أو وجهات النظر.'),
  CommandVerb(english: 'Draw conclusions', arabic: 'استخلص النتائج', meaning: 'تحديد النتائج التي يمكن أن تؤدي إلى توصيات.'),
  CommandVerb(english: 'Estimate', arabic: 'قدّر', meaning: 'إعطاء قرار تقريبي أو رأي باستخدام المعرفة السابقة أو الخبرة.'),
  CommandVerb(english: 'Explain', arabic: 'اشرح', meaning: 'القيام بالتوضيح أو إعطاء أسباب لشيء معين.'),
  CommandVerb(english: 'Evaluate', arabic: 'قيّم', meaning: 'استخراج نقاط القوة والضعف، أو تحديد النقاط المؤيدة والمعارضة.'),
  CommandVerb(english: 'Identify', arabic: 'اذكر', meaning: 'تقديم معلومات موجزة عن موضوع أو عملية أو نشاط محدد.'),
  CommandVerb(english: 'Illustrate', arabic: 'زوّد بصور توضيحية', meaning: 'تقديم معلومات ووصف واضحين مع أمثلة، شفهيًا أو كتابيًا أو بالصور.'),
  CommandVerb(english: 'Implement', arabic: 'طبّق', meaning: 'أداء أو تنفيذ خطة أو إجراء.'),
  CommandVerb(english: 'Interpret', arabic: 'اعرض / فسّر', meaning: 'تفسير المعنى أو المصطلح أو العملية بطريقة واضحة.'),
  CommandVerb(english: 'Investigate', arabic: 'فتّش', meaning: 'الفحص أو الدراسة أو الاستفسار بشكل منهجي.'),
  CommandVerb(english: 'Order', arabic: 'رتّب', meaning: 'وضع المعلومات في تسلسل منطقي.'),
  CommandVerb(english: 'Outline', arabic: 'أوجز', meaning: 'تحديد النقاط الرئيسية أو وصفها بإيجاز.'),
  CommandVerb(english: 'Plan', arabic: 'خطّط', meaning: 'تنظيم المعلومات بطريقة منطقية.'),
  CommandVerb(english: 'Perform', arabic: 'قم بتأدية', meaning: 'أداء أو تنفيذ؛ اتخاذ إجراء؛ اتباع تعليمات.'),
  CommandVerb(english: 'Produce', arabic: 'أنتج', meaning: 'إنتاج أو إحضار معلومات من خلال ما تم تعلمه أو أفكار إبداعية متعلقة بالموضوع.'),
  CommandVerb(english: 'Provide', arabic: 'زوّد', meaning: 'تقديم معلومات أو منتجات أو مصادر ذات صلة.'),
  CommandVerb(english: 'Record', arabic: 'سجّل', meaning: 'الاحتفاظ بالمعلومات كتابيًا أو بطرق أخرى.'),
  CommandVerb(english: 'Reflect', arabic: 'اعكس', meaning: 'البحث فيما تم تعلمه أو الخبرات المكتسبة وبيان أثرها على الأفعال أو الممارسات المستقبلية.'),
  CommandVerb(english: 'Report', arabic: 'اكتب تقريرًا', meaning: 'تقديم بيان رسمي يوضح جميع المعلومات بشكل مترابط.'),
  CommandVerb(english: 'Review and revise', arabic: 'راجع ونقّح', meaning: 'إلقاء نظرة على الموضوع أو النشاط، وإجراء التعديلات أو الإضافات التي تحسّنه.'),
  CommandVerb(english: 'Select', arabic: 'اختر', meaning: 'الاختيار لهدف معين.'),
  CommandVerb(english: 'Share', arabic: 'شارك', meaning: 'إعطاء المعلومات للآخرين وتمكينهم من الحصول على معلومات أو موارد.'),
  CommandVerb(english: 'Show', arabic: 'اعرض', meaning: 'إعطاء أو إظهار المعلومات أو المعرفة.'),
  CommandVerb(english: 'State', arabic: 'حدّد', meaning: 'تقديم النقاط الرئيسية بعبارات واضحة ومختصرة.'),
  CommandVerb(english: 'Suggest', arabic: 'اقترح', meaning: 'اقتراح فكرة أو طرق تنفيذ.'),
  CommandVerb(english: 'Support', arabic: 'ادعم', meaning: 'تدعيم قرارات الأشخاص وتقديم المساعدة أو النصيحة.'),
  CommandVerb(english: 'Use', arabic: 'استخدم', meaning: 'أخذ أو تطبيق عنصر أو مورد أو معلومة كما هو مطلوب.'),
];
