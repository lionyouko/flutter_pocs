import 'dart:math';

//C136 - passing functionality to the app without any state management
class BMICalculator {
  final int height;
  final int weight;
  late final double bmi;

  BMICalculator({required this.height, required this.weight}) {
    _calculateBMI();
  }

  double _calculateBMI() {
    this.bmi = (this.weight / pow(this.height / 100, 2));
    return this.bmi;
  }

  String calculateBMI() {
    return this.bmi.toStringAsFixed(1);
  }

  String getResults() {
    String result;
    if (this.bmi >= 25.0) {
      result = 'Overweight';
    } else if (this.bmi >= 18.5 && this.bmi < 25.0) {
      result = 'Normal';
    } else {
      result = 'Underweight';
    }
    return result;
  }

  String getInterpretations() {
    String result;
    if (this.bmi >= 25.0) {
      result = 'Diet and Exercises can help normalize BMI.';
    } else if (this.bmi >= 18.5 && this.bmi < 25.0) {
      result = 'Good Job!';
    } else {
      result = 'Maybe more calories will help to normalize BMI.';
    }
    return result;
  }
}
