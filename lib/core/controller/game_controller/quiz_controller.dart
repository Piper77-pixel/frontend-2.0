import 'dart:async';

import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/view/screen/games_screen/games_screen.dart';
import 'package:brain_bucks/view/screen/games_screen/you_lose_dialog.dart';
import 'package:brain_bucks/view/screen/games_screen/you_win_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  late Timer timer;
  static int startSeconds = 29;
  RxInt remainingSeconds = startSeconds.obs;
  RxInt question = 0.obs;
  RxInt winCount = 0.obs;
  RxInt loseCount = 0.obs;
  RxInt selectedAnswerIndex = 0.obs;
  RxBool showResult = false.obs;
  RxBool showWin = false.obs;
  RxBool isAudience = true.obs;
  RxBool isCall = true.obs;
  RxBool isCallFriend = true.obs;
  RxBool isViewAudience = true.obs;
  RxBool isViewFifty = true.obs;
  RxBool isFifty = true.obs;

  void nextQuestion(BuildContext context, String type, {int? second}) {
    Future.delayed(Duration(seconds: second ?? 2), () {
      if (question.value < questionList.length - 1) {
        question.value++;
        showMessage("111--->${question.value}<---${type != AppString.kTimeBlitzSession} $type---");
        if (type != AppString.kTimeBlitzSession) {
          remainingSeconds.value = startSeconds;
        }
        reset();
      } else {
        timer.cancel();
        hangleWinLose(context, type);
        // Get.offAll(() => GameSummaryScreen());
      }
    });
  }

  reset() {
    showResult.value = false;
    showWin.value = false;
    selectedAnswerIndex.value = -1; // reset selection
    showWin.refresh();
    question.refresh();
    isFifty.value = true;
    isCall.value = true;
    isAudience.value = true;
    isCallFriend.value = true;
    isViewFifty.value = true;
    isViewAudience.value = true;
  }

  onWinLoseCount(isCorrect) {
    if (isCorrect) {
      winCount.value++;
      // show win dialog
    } else {
      loseCount.value++;
      // show lose dialog
    }
    showMessage('win---${winCount.value}--lose-$loseCount');
  }

  onTFAnswerTap(index, BuildContext context, String type) {
    if (!showResult.value) {
      selectedAnswerIndex.value = index;
      showResult.value = true;
      nextQuestion(context, type);
    }
  }
  RxList questionList = [].obs;


  RxList visibleOptions = [].obs;

  void useFiftyFiftyLifeline(List<String> options, String correctAnswer) {
    int correctIndex = options.indexOf(correctAnswer);
    List incorrectIndices = List.generate(options.length, (i) => i).where((i) {
      showMessage('i---$i--correct-$correctIndex');

      return i != correctIndex;
    }).toList();

    incorrectIndices.shuffle();
    visibleOptions.value = [correctIndex, incorrectIndices.first];
    visibleOptions.sort();
  }

  void startTimer(BuildContext context, String type) {
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (remainingSeconds.value == 0) {
        timer.cancel();
        if (type == AppString.kTimeBlitzSession) {
          hangleWinLose(context, type);
        } else {
          nextQuestion(context, type, second: 0);
          startTimer(context, type);
          // handleTimeout(context);
          // Add your "time's up" logic here
        }
      } else {
        remainingSeconds.value--;
        remainingSeconds.refresh();
      }
    });
  }

  hangleWinLose(BuildContext context, String type) {
    showDialog(
      barrierDismissible: false,
      // barrierColor: AppColors.kOpacityBackGround,
      context: context,
      builder: (context) {
        if (winCount.value > loseCount.value) {
          // Player is winning
          return YouWinDialog();
        } else {
          return YouLoseDialog(
            actionPlayAgain: () {
              Get.back();
              question.value = 0;
              remainingSeconds.value = startSeconds;
              startTimer(Get.context!, type); // also use Get.context here
              reset();
              Get.to(() => GamesScreen(type: type));
            },
          );
        }
      },
    );
  }

  handleTimeout(BuildContext context) async {
    showMessage("message===> TIME OUT");
    // showDialog(
    //   barrierDismissible: false,
    //   barrierColor: AppColors.kOpacityBackGround,
    //   context: context,
    //   builder: (context) {
    //     return timesUpDialog(
    //       totalDiamond: '10',
    //       actionRevive: () {
    //         remainingSeconds.value = 5;
    //         remainingSeconds.refresh();
    //         startTimer(Get.context!); // also use Get.context here
    //         Get.back();
    //       },
    //       actionQuit: () {
    //         handleQuit(context);
    //       },
    //     );
    //   },
    // );
  }

  handleQuit(BuildContext context) {
    // showDialog(
    //   barrierDismissible: false,
    //   barrierColor: AppColors.kOpacityBackGround,
    //   context: context,
    //   builder: (context) {
    //     return quitDialog(
    //       actionQuit: () {
    //         Get.offAll(() => DashboardManager());
    //         // Get.offAll(() => GameSummaryScreen());
    //       },
    //     );
    //   },
    // );
  }
}
