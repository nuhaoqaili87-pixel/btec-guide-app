class MathQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;

  const MathQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}

const List<MathQuestion> mathQuestions = [
  MathQuestion(question: '12 × 8 = ؟', options: ['96', '86', '106', '90'], correctIndex: 0),
  MathQuestion(question: '45 ÷ 9 = ؟', options: ['5', '6', '4', '9'], correctIndex: 0),
  MathQuestion(question: '25% من 200 = ؟', options: ['50', '25', '75', '100'], correctIndex: 0),
  MathQuestion(question: 'حل المعادلة: س + 7 = 15، فما قيمة س؟', options: ['8', '7', '22', '9'], correctIndex: 0),
  MathQuestion(question: 'مستطيل طوله 8 سم وعرضه 5 سم، ما مساحته؟', options: ['40 سم²', '13 سم²', '26 سم²', '45 سم²'], correctIndex: 0),
  MathQuestion(question: 'أي الكسرين أكبر؟', options: ['3/4', '2/3', 'متساويان', 'لا يمكن تحديد ذلك'], correctIndex: 0),
  MathQuestion(question: '7 × 7 = ؟', options: ['49', '56', '42', '63'], correctIndex: 0),
  MathQuestion(question: 'مربع طول ضلعه 6 سم، ما محيطه؟', options: ['24 سم', '36 سم', '12 سم', '18 سم'], correctIndex: 0),
  MathQuestion(question: 'سيارة قطعت 150 كم خلال 3 ساعات، ما سرعتها؟', options: ['50 كم/سا', '45 كم/سا', '60 كم/سا', '55 كم/سا'], correctIndex: 0),
  MathQuestion(question: 'حل المعادلة: 3 × س = 21، فما قيمة س؟', options: ['7', '8', '6', '9'], correctIndex: 0),
  MathQuestion(question: 'ما ناتج 2³ (2 أُس 3)؟', options: ['8', '6', '9', '4'], correctIndex: 0),
  MathQuestion(question: 'ما متوسط الأعداد التالية: 4، 8، 12؟', options: ['8', '6', '10', '12'], correctIndex: 0),
];
