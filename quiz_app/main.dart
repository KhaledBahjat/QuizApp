import 'dart:io';

class Question {
  String question;
  double answer;
  String category;

  Question({
    required this.question,
    required this.answer,
    required this.category,
  });
}

List<Question> questions = [
  // Math
  Question(question: "What is 5 + 3?", answer: 8, category: "Math"),
  Question(question: "What is 10 / 2?", answer: 5, category: "Math"),
  Question(question: "What is 12 * 12?", answer: 144, category: "Math"),
  Question(
      question: "What is the square root of 81?", answer: 9, category: "Math"),
  Question(question: "What is 2.5 + 3.7?", answer: 6.2, category: "Math"),
  Question(
      question: "What is 10 / 3 (rounded to 2 decimals)?",
      answer: 3.33,
      category: "Math"),

  // General Knowledge
  Question(
      question: "How many continents are there?",
      answer: 7,
      category: "General Knowledge"),
  Question(
      question: "How many days in a leap year?",
      answer: 366,
      category: "General Knowledge"),
  Question(
      question: "How many colors in a rainbow?",
      answer: 7,
      category: "General Knowledge"),
  Question(
      question: "How many players in a soccer team?",
      answer: 11,
      category: "General Knowledge"),

  // Geography
  Question(
      question:
          "What is the capital of France? (Type 1 for Paris, 0 otherwise)",
      answer: 1,
      category: "Geography"),
  Question(
      question: "How many countries are in Africa?",
      answer: 54,
      category: "Geography"),
  Question(
      question: "How many oceans are there?", answer: 5, category: "Geography"),

  // Science
  Question(
      question: "What is the boiling point of water (°C)?",
      answer: 100,
      category: "Science"),
  Question(
      question: "How many planets are in the solar system?",
      answer: 8,
      category: "Science"),
  Question(
      question:
          "What is the chemical symbol for water? (Type 1 for H2O, 0 otherwise)",
      answer: 1,
      category: "Science"),
  Question(
      question: "How many bones in the adult human body?",
      answer: 206,
      category: "Science"),

  // Programming
  Question(
      question: "How many bits in a byte?", answer: 8, category: "Programming"),
  Question(
      question: "What is the result of 2^4?",
      answer: 16,
      category: "Programming"),
  Question(
      question:
          "What is the value of true && false? (Type 1 for true, 0 for false)",
      answer: 0,
      category: "Programming"),
  Question(
      question: "How many values can a boolean have?",
      answer: 2,
      category: "Programming"),
];

double? getUserAnswer() {
  stdout.write("Your answer: ");
  String? input = stdin.readLineSync();
  return double.tryParse(input ?? "");
}

void runQuiz(List<Question> selectedQuestions) {
  int score = 0;

  for (var q in selectedQuestions) {
    print(q.question);
    double? userAnswer = getUserAnswer();

    // Use a tolerance for floating point answers
    if (userAnswer != null && (userAnswer == q.answer)) {
      print("Correct!\n");
      score++;
    } else {
      print("Wrong! The correct answer is ${q.answer}\n");
    }
  }

  print("Quiz finished! Your score: $score/${selectedQuestions.length}");
}

void main() {
  print(
      "Choose a category: Math / General Knowledge / Science / Programming / Geography");
  stdout.write("Your choice: ");
  String? categoryChoice = stdin.readLineSync();
  if (categoryChoice == null || categoryChoice.trim().isEmpty) {
    print("No category selected. Exiting.");
    return;
  }
  List<Question> selectedQuestions = questions
      .where((q) => q.category.toLowerCase() == categoryChoice.toLowerCase())
      .toList();
  if (selectedQuestions.isEmpty) {
    print("No questions found for this category.");
    return;
  }
  runQuiz(selectedQuestions);
}
