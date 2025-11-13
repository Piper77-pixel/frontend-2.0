import 'dart:developer';

import 'package:brain_bucks/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'images.dart';

showMessage(String message) {
  log(message);
  // if(kDebugMode){
  //   print(message);
  // }
}

List questionGeneralBank = [
  {
    'question': 'What is the capital city of Australia?',
    'option': ['Rome', 'Berlin', 'Canberra', 'Madrid'],
    'fifty': ['Rome', 'Canberra'],
    'audience': ['0', '39', '59', '2'],
    'correct': 'Canberra',
    'is_tf': false,
    'suggestion': 'Canberra is Australia’s capital, inland from the country\'s southeast coast.',
  },
  {
    'question': 'Paris is the capital of which European country?',
    'option': ['Rome', 'France', 'Paris', 'Madrid'],
    'fifty': ['France', 'Paris'],
    'audience': ['60', '89', '59', '20'],
    'correct': 'France',
    'is_tf': false,
    'suggestion': 'That’s right! Paris has been the capital of France for centuries and is a global cultural hub.',
  },
  {
    'question': 'On which river is Paris situated?',
    'option': ['The Seine River', 'France', 'Paris', 'Madrid'],
    'fifty': ['The Seine River', 'Paris'],
    'audience': ['69', '39', '59', '20'],
    'correct': 'The Seine River',
    'is_tf': false,
    'suggestion': 'That’s right! Paris has been the capital of France for centuries and is a global cultural hub.',
  },
];
final Map<String, List<Map<String, dynamic>>> questionBank = {
  'History': [
    {
      'question': 'Who was the first President of the United States?',
      'option': ['Abraham Lincoln', 'George Washington', 'John Adams', 'Thomas Jefferson'],
      'fifty': ['George Washington', 'John Adams'],
      'audience': ['10', '65', '20', '5'],
      'correct': 'George Washington',
      'is_tf': false,
      'suggestion': 'George Washington served as the first President from 1789 to 1797.',
    },
    {
      'question': 'In which year did World War II end?',
      'option': ['1942', '1945', '1948', '1950'],
      'fifty': ['1945', '1948'],
      'audience': ['5', '80', '10', '5'],
      'correct': '1945',
      'is_tf': false,
      'suggestion': 'World War II ended in 1945 after Germany and Japan surrendered.',
    },
    {
      'question': 'Who built the Great Wall of China?',
      'option': ['Qin Dynasty', 'Ming Dynasty', 'Han Dynasty', 'Tang Dynasty'],
      'fifty': ['Qin Dynasty', 'Ming Dynasty'],
      'audience': ['40', '45', '10', '5'],
      'correct': 'Qin Dynasty',
      'is_tf': false,
      'suggestion': 'The first emperor of the Qin Dynasty initiated the construction.',
    },
  ],
  'Math': [
    {
      'question': 'What is the result of 77 + 33?',
      'option': ['120', '100', '110', '97'],
      'fifty': ['120', '110'],
      'audience': ['20', '10', '65', '5'],
      'correct': '110',
      'is_tf': false,
      'suggestion': '77 + 33 = 110.',
    },
    {
      'question': 'What is the square root of 144?',
      'option': ['10', '11', '12', '13'],
      'fifty': ['11', '12'],
      'audience': ['5', '15', '70', '10'],
      'correct': '12',
      'is_tf': false,
      'suggestion': '12 × 12 = 144.',
    },
    {
      'question': 'Solve: 15 × 6 = ?',
      'option': ['80', '85', '90', '95'],
      'fifty': ['85', '90'],
      'audience': ['10', '15', '65', '10'],
      'correct': '90',
      'is_tf': false,
      'suggestion': '15 multiplied by 6 equals 90.',
    },
  ],
  'Science': [
    {
      'question': 'What is the chemical symbol for water?',
      'option': ['H2O', 'O2', 'CO2', 'NaCl'],
      'fifty': ['H2O', 'O2'],
      'audience': ['90', '7', '2', '1'],
      'correct': 'H2O',
      'is_tf': false,
      'suggestion': 'Water is made of 2 hydrogen atoms and 1 oxygen atom.',
    },
    {
      'question': 'Which planet is known as the Red Planet?',
      'option': ['Earth', 'Mars', 'Venus', 'Jupiter'],
      'fifty': ['Mars', 'Venus'],
      'audience': ['5', '80', '10', '5'],
      'correct': 'Mars',
      'is_tf': false,
      'suggestion': 'Mars is called the Red Planet because of its reddish appearance.',
    },
    {
      'question': 'What gas do humans need to survive?',
      'option': ['Carbon Dioxide', 'Oxygen', 'Nitrogen', 'Hydrogen'],
      'fifty': ['Oxygen', 'Carbon Dioxide'],
      'audience': ['5', '85', '7', '3'],
      'correct': 'Oxygen',
      'is_tf': false,
      'suggestion': 'Oxygen is essential for human respiration.',
    },
  ],
  'Literature': [
    {
      'question': 'Who wrote the play "Romeo and Juliet"?',
      'option': ['William Shakespeare', 'Charles Dickens', 'Leo Tolstoy', 'Mark Twain'],
      'fifty': ['William Shakespeare', 'Charles Dickens'],
      'audience': ['70', '10', '15', '5'],
      'correct': 'William Shakespeare',
      'is_tf': false,
      'suggestion': '"Romeo and Juliet" is one of William Shakespeare’s most famous tragedies.',
    },
    {
      'question': 'In George Orwell’s novel "1984", what is the name of the totalitarian leader?',
      'option': ['Big Brother', 'The Party Leader', 'Comrade Napoleon', 'Supreme Chancellor'],
      'fifty': ['Big Brother', 'The Party Leader'],
      'audience': ['65', '20', '10', '5'],
      'correct': 'Big Brother',
      'is_tf': false,
      'suggestion': 'In "1984", Big Brother symbolizes the Party’s control and surveillance over people.',
    },
  ],
  'Geography': [
    {
      'question': 'Which is the largest desert in the world?',
      'option': ['Sahara Desert', 'Antarctic Desert', 'Gobi Desert', 'Arctic Desert'],
      'fifty': ['Sahara Desert', 'Antarctic Desert'],
      'audience': ['30', '50', '10', '10'],
      'correct': 'Antarctic Desert',
      'is_tf': false,
      'suggestion': 'The Antarctic Desert is the largest desert in the world, covering around 14 million sq km.',
    },
    {
      'question': 'Which river is the longest in the world?',
      'option': ['Amazon River', 'Yangtze River', 'Nile River', 'Mississippi River'],
      'fifty': ['Amazon River', 'Nile River'],
      'audience': ['40', '15', '40', '5'],
      'correct': 'Nile River',
      'is_tf': false,
      'suggestion': 'The Nile River in Africa is traditionally considered the longest river, stretching about 6,650 km.',
    },
  ],
  'Sports': [
    {
      'question': 'How many players are there in a soccer team on the field?',
      'option': ['9', '10', '11', '12'],
      'fifty': ['10', '11'],
      'audience': ['5', '15', '70', '10'],
      'correct': '11',
      'is_tf': false,
      'suggestion': 'Each soccer team fields 11 players, including the goalkeeper.',
    },
    {
      'question': 'Which country won the FIFA World Cup in 2018?',
      'option': ['Brazil', 'France', 'Germany', 'Argentina'],
      'fifty': ['France', 'Germany'],
      'audience': ['10', '70', '15', '5'],
      'correct': 'France',
      'is_tf': false,
      'suggestion': 'France won the 2018 FIFA World Cup by defeating Croatia 4–2 in the final.',
    },
    {
      'question': 'How many players are there on a standard basketball team on the court?',
      'option': ['5', '6', '7', '11'],
      'fifty': ['5', '6'],
      'audience': ['80', '10', '7', '3'],
      'correct': '5',
      'is_tf': false,
      'suggestion': 'A basketball team has 5 players on the court at any given time.',
    },
  ],
};
SystemUiOverlayStyle buildSystemUiOverlayStyle() {
  return SystemUiOverlayStyle(
    statusBarColor: AppColors.kTransparent,
    systemNavigationBarColor: AppColors.kBlack,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  );
}

void navigatePushAndRemoveUntil(BuildContext context, Widget screen) async {
  Navigator.pushAndRemoveUntil(
    context,
    PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 1000),
      pageBuilder: (_, _, _) => screen,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    ),
    (Route<dynamic> route) => false, // removes all previous routes
  );
}

class AppDimen {
  static const double smallRadius = 20;

  static double radius = 30;
  static double circleRadius = 14;
  static const double buttonRadius = 8.0;

  static const double iconRadius = 60.0;
  static const double logoIconSize = 185.0;
  static const double iconSize = 32;

  static const EdgeInsets buttonPadding = EdgeInsets.all(16.0);
  static const EdgeInsets screenPadding = EdgeInsets.all(20);

  // static const BorderRadius buttonRadius = BorderRadius.all(Radius.circular(90));

  static const double paddingExtraSmall = 6.0;
  static const double paddingSmall = 8.0;
  static const double padding = 16.0;
  static const double paddingLarge = 20.0;
  static const double paddingExtraLarge = 30.0;
}
