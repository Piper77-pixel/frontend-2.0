import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FriendsListController extends GetxController {
  final selectedSegment_04 = 'request'.obs;
  final RxMap<String, String> segment = {'request': AppString.kRequests.tr, 'friend_list': AppString.kFriendsList.tr, 'notification': AppString.kNotifications.tr}.obs;
  TextEditingController requestController = TextEditingController();
  TextEditingController friendListController = TextEditingController();
  TextEditingController notificationController = TextEditingController();
  RxBool isSearch = false.obs;
  RxBool isRequested = false.obs;
  RxList filteredUsers = [
    {'image': DefaultImages.profileImage, 'name': 'Ronald Richards'},
    {'image': DefaultImages.profile1Image, 'name': 'Ronald Richards'},
    {'image': DefaultImages.profileImage, 'name': 'Ronald Richards'},
  ].obs;

  RxList friendRequestsList = [
    {
      "profile": DefaultImages.profile1Image,
      "title": 'Ronald Richards',
      "mutualFri": '23',
      "time": '1d',
      "friendList": [DefaultImages.profileImage, DefaultImages.profile1Image],
    },
    {
      "profile": DefaultImages.profile1Image,
      "title": 'Ronald Richards',
      "mutualFri": '23',
      "time": '1d',
      "friendList": [DefaultImages.profile1Image, DefaultImages.profileImage],
    },
    {
      "profile": DefaultImages.profile1Image,
      "title": 'Ronald Richards',
      "mutualFri": '23',
      "time": '1d',
      "friendList": [DefaultImages.profileImage, DefaultImages.profile1Image],
    },
  ].obs;
  RxList friendsList = [
    {
      "profile": DefaultImages.profile1Image,
      "title": 'Ronald Richards',
      "mutualFri": '23',
      "time": '1d',
      "friendList": [DefaultImages.profileImage, DefaultImages.profile1Image],
    },
    {
      "profile": DefaultImages.profile1Image,
      "title": 'Ronald Richards',
      "mutualFri": '23',
      "time": '1d',
      "friendList": [DefaultImages.profile1Image, DefaultImages.profileImage],
    },
    {
      "profile": DefaultImages.profile1Image,
      "title": 'Ronald Richards',
      "mutualFri": '23',
      "time": '1d',
      "friendList": [DefaultImages.profileImage, DefaultImages.profile1Image],
    },
  ].obs;
  RxList notificationsList = [
    {
      "image": DefaultImages.notificationYellowImage,
      "title": 'You have a new follower!',
      "description": '@john_doe just started following you. They might be interested in your latest posts — take a moment to check out their profile and say hi!',
    },
    {
      "image": DefaultImages.notificationBlueImage,
      "title": 'You Did It — New Achievement Earned!',
      "description": 'Congratulations! You\'ve unlocked the “Speed Runner” achievement for finishing the level in record time. Think you can beat your own score next time?',
    },
    {
      "image": DefaultImages.notificationPurpleImage,
      "title": 'New Update Is Here!',
      "description": 'We\'ve just rolled out the latest version packed with fresh content, performance improvements, and exciting new features. Jump in now and explore what\'s new!',
    },
  ].obs;
}
