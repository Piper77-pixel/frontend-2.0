import 'package:brain_bucks/core/controller/game_controller/quiz_controller.dart';
import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/box_decoration.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/size_config.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/screen/games_screen/game_screen_widget.dart';
import 'package:brain_bucks/view/screen/home_screen/home_profile_appbar.dart';
import 'package:brain_bucks/view/widgets/bg_image_widget.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auto_size_text/flutter_auto_size_text.dart';
import 'package:get/get.dart';

class GamesScreen extends StatefulWidget {
  final String type;
  final String? image;
  final String? topic;

  const GamesScreen({super.key, required this.type, this.image, this.topic});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  QuizController quizController = Get.put(QuizController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quizController.questionList.clear();
    if (widget.type == AppString.kTopicChallengeSession) {
      questionBank.forEach((key, value) {
        if (key == widget.topic) {
          quizController.questionList.value = value;
        }
      });
    } else {
      quizController.questionList.value = questionGeneralBank;
    }
    quizController.reset();
    quizController.showWin.value = false;
    quizController.showResult.value = false;

    quizController.winCount.value = 0;
    quizController.loseCount.value = 0;
    quizController.selectedAnswerIndex.value = -1;
    quizController.startTimer(context, widget.type);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    quizController.timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BgImageWidget(
      bgImage: DefaultImages.gameScreenBgImage,
      child: Obx(() {
        print(quizController.showWin.value);
        return Column(
          children: [
            GameProfileAppbar(timer: QuizController.startSeconds, coin: "1138", spark: '2238'),
            Expanded(
              child: Stack(
                children: [
                  widget.type == AppString.kDuel
                      ? SizedBox()
                      : quizController.showWin.value == true
                      ? Align(
                          alignment: AlignmentGeometry.topCenter,
                          child: assetImage(DefaultImages.winConfettiImage, w: SizeConfig.screenWidth, fit: BoxFit.cover, h: 400),
                        )
                      : SizedBox(),

                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: SizeConfig.h(20)),
                    physics: BouncingScrollPhysics(),
                    // padding: EdgeInsets.fromLTRB(16, 24, 16, 20),
                    children: [
                      Obx(() {
                        var que = quizController.questionList[quizController.question.value];

                        final correctAnswer = que['correct'];
                        final fifty = List<String>.from(que['fifty']);
                        final options = List<String>.from(que['option']);
                        // If 50/50 used → only two visible, others disabled
                        List<String> optionIndices = quizController.isViewFifty.value ? options : options.where((opt) => fifty.contains(opt)).toList();
                        showMessage("optionIndices----$optionIndices");
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: AppDimen.padding),
                          child: Column(
                            children: [
                              widget.type == AppString.kDuel
                                  ? Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            quizController.handleAbandonedDialog(context); //temporary open here
                                          },
                                          child: playerPointWidget(
                                            bgImage: DefaultImages.duelFriendPointBgImage,
                                            name: 'parisOG',
                                            profileImage: DefaultImages.profileImage,
                                            level: '32',
                                            pointList: quizController.playerList,
                                            bColor: AppColors.kHex2A5510,
                                          ),
                                        ),
                                        verticalSpace(SizeConfig.h(20)), //20
                                        playerPointWidget(
                                          bgImage: DefaultImages.duelYouPointBgImage,
                                          name: AppString.kYou.tr,
                                          profileImage: DefaultImages.profileImage,
                                          level: '32',
                                          pointList: quizController.player2List,
                                        ),
                                      ],
                                    )
                                  : widget.type == AppString.kSoloStreakSession
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Center(child: Text('${AppString.kQuestion.tr} : ${quizController.question.value + 1}', style: pNunitoExtraBold10.copyWith(fontSize: 14))),
                                        Center(child: Text('${AppString.kCorrect.tr} : ${quizController.winCount.value}', style: pNunitoExtraBold10.copyWith(fontSize: 14))),
                                      ],
                                    )
                                  : Center(
                                      child: Text(
                                        '${AppString.kQuestion.tr} : ${quizController.question.value + 1}',
                                        style: pNunitoExtraBold10.copyWith(
                                          fontSize: SizeConfig.sp(21), //24
                                        ),
                                      ),
                                    ),
                              verticalSpace(SizeConfig.h(17)), //20
                              Container(
                                // color: Colors.green,
                                // padding: EdgeInsetsGeometry.only(top: Get.height * 0.02),
                                //45
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Container(
                                      // height: Get.height * 0.45,
                                      width: SizeConfig.screenWidth,
                                      margin: EdgeInsets.only(top: widget.type == AppString.kDuel ? 0 : SizeConfig.h(64)),
                                      //70
                                      decoration: boxDecoration(
                                        // color: Colors.red,
                                        decorationImage: DecorationImage(image: AssetImage(DefaultImages.dialogBgImage), fit: BoxFit.fill),
                                        radius: AppDimen.smallRadius,
                                      ),
                                      // padding: EdgeInsets.fromLTRB(13, 0, 13, 0),
                                      padding: widget.type == AppString.kDuel ? EdgeInsets.all(13) : EdgeInsets.fromLTRB(13, SizeConfig.h(66), 13, 0),
                                      child: Column(
                                        // mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Center(
                                            child: AutoSizeText(
                                              que['question'],
                                              style: pRobotoMedium10.copyWith(fontSize: SizeConfig.sp(18) /*20*/),
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              AppString.kSelectoneoftheoptions,
                                              style: pRobotoRegular10.copyWith(fontSize: 14, color: AppColors.kGreyFont),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          verticalSpace(SizeConfig.h(18)), //23
                                          Obx(() {
                                            showMessage("-=-=${quizController.showResult.value}-=-");

                                            return ListView.builder(
                                              itemCount: options.length,
                                              shrinkWrap: true,
                                              physics: NeverScrollableScrollPhysics(),
                                              padding: EdgeInsets.zero,
                                              itemBuilder: (context, index) {
                                                final option = options[index];
                                                bool isSelected = quizController.selectedAnswerIndex.value == index;
                                                bool isCorrect = option == correctAnswer;
                                                bool isIndicator = false;
                                                // If 50/50 used, only allow taps on two visible options
                                                bool isEnabled = quizController.isViewFifty.value || fifty.contains(option);
                                                // Audience percentage
                                                final audiencePercent = que['audience'][index];

                                                bool isShowCall = false;
                                                // showMessage(option);
                                                // showMessage(correctAnswer);
                                                Color bgColor = AppColors.kTransparent;

                                                // showMessage("isSelected---$isSelected - isCorrect---$isCorrect");
                                                if (quizController.showResult.value) {
                                                  if (isSelected && isCorrect) {
                                                    bgColor = AppColors.kGreen;
                                                    isIndicator = true;
                                                  } else if (isSelected && !isCorrect) {
                                                    bgColor = AppColors.kRed;
                                                    isIndicator = true;
                                                  } else if (!isSelected && isCorrect) {
                                                    bgColor = AppColors.kGreen;
                                                    isIndicator = true;
                                                  }
                                                } else {
                                                  isShowCall = isCorrect && quizController.isCallFriend.value == false;
                                                }
                                                return Container(
                                                  // color: bgColor,
                                                  child: IgnorePointer(
                                                    ignoring: !isEnabled, // disable taps
                                                    child: Opacity(
                                                      opacity: isEnabled ? 1.0 : 0.4, // dim disabled ones
                                                      child: answerWidget(
                                                        number: '${index + 1}',
                                                        name: option,
                                                        isSelected: isIndicator,
                                                        indicatorColor: bgColor,
                                                        audiencePercent: audiencePercent,
                                                        isAudience: !quizController.isViewAudience.value,
                                                        onTap: () {
                                                          // bgColor = AppColors.kAnswerBg; // when tap answer show color
                                                          // WidgetsBinding.instance.addPostFrameCallback((_) {
                                                          if (!quizController.showResult.value) {
                                                            quizController.selectedAnswerIndex.value = index;
                                                            quizController.showResult.value = true;
                                                            quizController.selectedAnswerIndex.refresh();
                                                            quizController.showResult.refresh();
                                                            showMessage("$correctAnswer---$index ---${quizController.selectedAnswerIndex.value}");
                                                            quizController.nextQuestion(context, widget.type, second: 2);
                                                            // bool selected = quizController.selectedAnswerIndex.value == index;
                                                            if (quizController.selectedAnswerIndex.value == index && isCorrect) {
                                                              quizController.showWin.value = true;
                                                              showMessage("showWin---${quizController.showWin.value}");
                                                              quizController.onWinLoseCount(true);
                                                              // trailingIcon = DefaultImages.checkIcn;
                                                            } else if (quizController.selectedAnswerIndex.value == index && !isCorrect) {
                                                              quizController.onWinLoseCount(false);
                                                            }
                                                          }
                                                          // });
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          }),
                                        ],
                                      ),
                                    ),
                                    widget.type == AppString.kDuel
                                        ? SizedBox()
                                        : Align(
                                            alignment: Alignment.topCenter /*- Alignment(0, 0.6)*/,
                                            child: assetImage(
                                              widget.image ?? DefaultImages.questionImage,
                                              h: SizeConfig.h(130), // Get.height * 0.160, //135
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                              verticalSpace(SizeConfig.h(24)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  buildCircleButton(
                                    image: DefaultImages.fiftyIcn,
                                    title: AppString.k5050,
                                    diamond: '12',
                                    isAvailable: quizController.isFifty.value,
                                    imageH: 33,
                                    imageW: 34,
                                    onTap: () {
                                      if (!quizController.showResult.value) {
                                        quizController.isFifty.value = false;
                                        quizController.isViewFifty.value = false;
                                        quizController.isCallFriend.value = true;
                                        quizController.isViewAudience.value = true;
                                        quizController.questionList.refresh();
                                        final question = quizController.questionList[quizController.question.value];
                                        quizController.useFiftyFiftyLifeline(question['option'], question['correct']);
                                      }
                                    },
                                  ),
                                  horizontalSpace(12),
                                  buildCircleButton(
                                    image: DefaultImages.audienceIcn,
                                    title: AppString.kAudience,
                                    diamond: '15',
                                    isAvailable: quizController.isAudience.value,
                                    imageH: 18,
                                    imageW: 20,
                                    onTap: () {
                                      if (!quizController.showResult.value) {
                                        quizController.isAudience.value = false;
                                        quizController.isViewAudience.value = false;
                                        quizController.isCallFriend.value = true;
                                        quizController.isViewFifty.value = true;
                                      }
                                    },
                                  ),
                                  horizontalSpace(12),
                                  buildCircleButton(
                                    image: DefaultImages.callIcn,
                                    title: AppString.kPhone,
                                    diamond: "10",
                                    isAvailable: quizController.isCall.value,
                                    imageH: 18,
                                    imageW: 18,
                                    onTap: () {
                                      if (!quizController.showResult.value) {
                                        quizController.isCall.value = false;
                                        quizController.isCallFriend.value = false;
                                        quizController.isViewAudience.value = true;
                                        quizController.isViewFifty.value = true;
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget playerPointWidget({String? bgImage, String? profileImage, String? name, String? level, List? pointList, Color? bColor}) {
    return Container(
      // height: Get.height * 0.093,
      width: SizeConfig.screenWidth,
      decoration: boxDecoration(
        decorationImage: DecorationImage(image: AssetImage(bgImage ?? DefaultImages.duelFriendPointBgImage), fit: BoxFit.fill),
        radius: 20,
      ),
      padding: EdgeInsets.all(AppDimen.padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              profileWidget(profileImage, Size(SizeConfig.w(40), SizeConfig.h(40)), padding: 0, color: bColor),
              horizontalSpace(8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name!, style: pRobotoMedium10.copyWith(fontSize: 14)),
                  Text('${AppString.kLevel.tr} $level', style: pRobotoMedium10.copyWith(fontSize: 10, color: AppColors.kWhite.withOpacity(0.4))),
                ],
              ),
            ],
          ), //95

          Row(
            children: pointList!
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: assetImage(
                      e == 1
                          ? DefaultImages.tickCircleIcon
                          : e == 0
                          ? DefaultImages.closeCircleIcon
                          : DefaultImages.circleIcon,
                      h: 20,
                      w: 20,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget showCallWidget(BuildContext context, {String? suggestion, String? profileImage}) {
    return GestureDetector(
      onTapDown: (details) {
        // suggestionCustomToast(context, Offset(details.globalPosition.dx - 230, details.globalPosition.dy), suggestion!);
      },
      child: Container(
        // height: 27,
        // width: 52,
        decoration: boxDecoration(color: AppColors.kTextField, radius: 20),
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [assetImage(DefaultImages.callIcn, w: 10, h: 10), assetImage(profileImage!, w: 25, h: 17)]),
      ),
    );
  }

  SizedBox showAudienceRateWidget(que) {
    return SizedBox(
      width: 50,
      height: 28,
      child: Stack(
        children: [
          assetImage(DefaultImages.lifeLineBgImage, w: 50, h: 28),
          Center(child: Text(que, style: pRobotoRegular10.copyWith(fontSize: 12))),
        ],
      ),
    );
  }

  Widget buildCircleButton({bool? isAvailable, String? image, String? title, int? imageH, imageW, String? diamond, Function()? onTap, Function()? onTapDiamond}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 84,
            // height: 64,
            decoration: boxDecoration(
              radius: 0,
              decorationImage: DecorationImage(
                // image: AssetImage(isAvailable == true ? DefaultImages.shadowCircleImage : DefaultImages.circleBgImage),
                image: AssetImage(DefaultImages.lifeLineBgImage),
                fit: BoxFit.fill,
              ),
            ),
            padding: EdgeInsets.fromLTRB(14, 8, 13, 8),
            child: Column(
              children: [
                Center(child: assetImage(image!, h: 27, w: 27)),
                verticalSpace(3),
                Text(title!, style: pRobotoRegular10.copyWith(fontSize: 12)),
              ],
            ),
          ),
        ),
        verticalSpace(isAvailable == true ? 0 : 8),
        // isAvailable == true
        //     ? SizedBox(height: 0)
        //     : sparkAddWidget(image: DefaultImages.diamondIcn, onTap: onTapDiamond, total: diamond, isShowAdd: false),
      ],
    );
  }

  Widget answerWidget({Function()? onTap, bool? isSelected, bool? isAudience, Color? indicatorColor, String? name, String? number, Widget? widget, String? audiencePercent}) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeConfig.h(11)), //12
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            if (isAudience == true)
              Positioned.fill(
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: double.tryParse(audiencePercent.toString())! / 100,
                  child: Container(
                    decoration: boxDecoration(color: AppColors.kHexAB1DFF.withOpacity(0.2), radius: 8),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 17),
                      child: Align(
                        alignment: AlignmentGeometry.centerLeft,
                        child: FittedBox(
                          child: Text('${audiencePercent!}%', style: pRobotoRegular10.copyWith(fontSize: 16), textAlign: TextAlign.center),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            Container(
              // height: Get.height * 0.05375,
              height: SizeConfig.h(43),
              width: SizeConfig.screenWidth,
              decoration: boxDecoration(
                color: indicatorColor,
                // color: isSelected == true ? AppColors.kAnswerBg : AppColors.kTransparent,
                borderRadius: BorderRadius.circular(SizeConfig.w(11)), //15
                border: Border.all(color: AppColors.kGreyBorder),
              ),
              // padding: EdgeInsets.only(right: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      // isSelected == true
                      // // ? glowingIndicator(indicatorColor!)
                      //     ? Container(
                      //   height: 35,
                      //   width: 5,
                      //   decoration: LeftGlowIndicator(
                      //     height: 35,
                      //     width: 4,
                      //     color: indicatorColor,
                      //     // color: isCorrect == true ? AppColors.kThemeColor : AppColors.kRed,
                      //   ),
                      // )
                      //     : SizedBox(),
                      // horizontalSpace(isSelected == true ? 9 : 14),
                      // Text(number!, style: pRobotoMedium10.copyWith(color: AppColors.kGreyFont, fontSize: 16)),
                      // horizontalSpace(18),
                      Text(name!, style: isSelected == true ? pRobotoBold10.copyWith(fontSize: 16) : pRobotoRegular10.copyWith(fontSize: 16)),
                    ],
                  ),
                  widget ?? SizedBox(width: 0, height: 0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
