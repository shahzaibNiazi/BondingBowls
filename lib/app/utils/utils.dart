import 'dart:developer' as developer;
import 'dart:io';
import 'dart:math';

import 'package:convo_hearts/app/shared_widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import '../config/app_colors.dart';
import '../shared_widgets/custom_confirmation_dialog.dart';

class Utils {
  static String getImagePath(String name, {String format = 'png'}) {
    return 'assets/images/$name.$format';
  }

  static String getIconPath(String name, {String format = 'png'}) {
    return 'assets/icons/$name.$format';
  }

  static String getSvgPath(String name, {String format = 'svg'}) {
    return 'assets/icon/svg/$name.$format';
  }

  DateTime convertStringToDateTime(String dateString) {
    return DateFormat("dd-MM-yyyy").parse(dateString);
  }

  static String formatDateUtcToLocal(String date, String time) {
    // Combine date and time and add 'Z' to treat it as UTC
    final utcDateTime = DateTime.parse("$date $time");
    final localDateTime = utcDateTime.toLocal();

    final formattedDate = DateFormat("MMMM d, yyyy").format(localDateTime);
    final formattedTime = DateFormat("h:mm a").format(localDateTime);

    return "$formattedTime on $formattedDate";
  }

  static String getMeetingStatus(
    DateTime currentDateTimes,
    DateTime meetingDate,
    String meetingTime,
  ) {
    // Parse meeting time (HH:mm:ss) into DateTime
    DateTime meetingDateTime = DateTime(
      meetingDate.year,
      meetingDate.month,
      meetingDate.day,
      int.parse(meetingTime.split(":")[0]), // Hours
      int.parse(meetingTime.split(":")[1]), // Minutes
      int.parse(meetingTime.split(":")[2]), // Seconds
    );

    DateTime currentDateTime = DateTime(
      currentDateTimes.year,
      currentDateTimes.month,
      currentDateTimes.day,
      currentDateTimes.hour, // Directly use hour
      currentDateTimes.minute, // Directly use minute
      currentDateTimes.second, // Directly use second
    );

    developer.log(meetingDateTime.toString());
    developer.log(currentDateTime.toString());

    Duration difference = meetingDateTime.difference(currentDateTime);
    int hoursLeft = difference.inHours;
    int daysLeft = (difference.inHours / 24)
        .ceil(); // Use ceil to handle partial days

    developer.log('Days Left $daysLeft');

    if (daysLeft == 0) {
      if (currentDateTime.isAfter(meetingDateTime)) {
        return "Mark as complete"; // Meeting time has already passed today
      } else {
        return "You have a meeting today at ${DateFormat.jm().format(meetingDateTime)}.";
      }
    } else if (hoursLeft > 0) {
      return "You have $daysLeft day(s) left to start.";
    } else {
      return "Your meeting was ${daysLeft.abs()} day(s) ago.";
    }
  }

  static String convertStringFormatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);

    String formattedDate = DateFormat("d MMM, yyyy").format(date);

    return formattedDate;
  }

  static String convertStringFormatTime(String timeString) {
    DateTime time = DateFormat("HH:mm:ss").parse(timeString);
    String formattedTime = DateFormat("hh:mm a").format(time);
    return formattedTime;
  }

  static convertFormateDate(String inputDate) {
    DateTime parsedDate = DateTime.parse(
      inputDate,
    ); // Convert string to DateTime
    String formattedDate = DateFormat(
      'EEE d',
    ).format(parsedDate); // 'EEE' gives short weekday, 'd' gives the day
    return formattedDate;
  }

  static String convertDateToString(DateTime date, {String? format}) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static String removeMentions(String comment) {
    // Regular expression to match mentions starting with '@'
    final mentionRegex = RegExp(r'@\w+', caseSensitive: false);
    return comment.replaceAll(mentionRegex, '').trim();
  }

  static TimeOfDay convertToTimeOfDay(String time) {
    final format = RegExp(
      r'^(\d{1,2}):(\d{2})\s?(AM|PM)$',
      caseSensitive: false,
    );
    final match = format.firstMatch(time);

    if (match == null) {
      throw const FormatException("Invalid time format");
    }

    final hours = int.parse(match.group(1)!);
    final minutes = int.parse(match.group(2)!);
    final period = match.group(3)!.toUpperCase();

    int adjustedHours = period == "PM" && hours != 12
        ? hours + 12
        : period == "AM" && hours == 12
        ? 0
        : hours;

    return TimeOfDay(hour: adjustedHours, minute: minutes);
  }

  static void selectDate(
    BuildContext context,
    TextEditingController controller,
  ) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      final formattedDate = DateFormat('d MMMM yyyy').format(pickedDate);
      controller.text = formattedDate;
    }
  }

  static void selectTime(
    BuildContext context,
    TextEditingController controller,
  ) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      final now = DateTime.now();
      final dateTime = DateTime(
        now.year,
        now.month,
        now.day,
        pickedTime.hour,
        pickedTime.minute,
      );
      final formattedTime = DateFormat.jm().format(dateTime);

      // Adjust timezone if needed
      final formattedTimeWithTimezone = formattedTime;

      controller.text = formattedTimeWithTimezone;
    }
  }

  static String formatTimeOfDay(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';

    return '$hour:$minute $period';
  }

  static String formatTimeTo24Hour(TimeOfDay time) {
    final String hour = time.hour.toString().padLeft(2, '0');
    final String minute = time.minute.toString().padLeft(2, '0');

    return '$hour:$minute';
  }

  static TimeOfDay convertStringToTimeOfDay(String timeString) {
    // Convert string to TimeOfDay
    List<String> parts = timeString.split(":");
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);
    TimeOfDay time = TimeOfDay(hour: hour, minute: minute);
    return time;
  }

  static int splitHour(String time) {
    List<String> parts = time.split(":");
    TimeOfDay timeOfDay = TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
    int hour = timeOfDay.hour;
    return hour;
  }

  static int splitMin(String time) {
    List<String> parts = time.split(":");
    TimeOfDay timeOfDay = TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
    int minute = timeOfDay.minute;
    return minute;
  }

  static List<String> listOfHour = [
    '0 hour',
    '1 hour',
    '2 hours',
    '3 hours',
    '4 hours',
    '5 hours',
    '6 hours',
    '7 hours',
    '8 hours',
    '9 hours',
    '10 hours',
    '11 hours',
    '12 hours',
    '13 hours',
    '14 hours',
    '15 hours',
    '16 hours',
    '17 hours',
    '18 hours',
    '19 hours',
    '20 hours',
    '21 hours',
    '22 hours',
    '23 hours',
  ];

  static List<String> minutesList = [
    '5 minutes',
    '10 minutes',
    '15 minutes',
    '20 minutes',
    '25 minutes',
    '30 minutes',
    '35 minutes',
    '40 minutes',
    '45 minutes',
    '50 minutes',
    '55 minutes',
  ];

  static bool validateEmail(String value) {
    String pattern =
        r'^[a-zA-Z0-9][a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static String? getTableByNumber(String tableNumber) {
    switch (tableNumber) {
      case "1":
        return 'assets/svgs/four-capacity.svg';
      case "2":
        return 'assets/svgs/two-capacity.svg';
      case "3":
        return 'assets/svgs/four-capacity.svg';
      case "4":
        return 'assets/svgs/six-capacity-h.svg';
      case "5":
        return 'assets/svgs/four-capacity.svg';
      case "6":
        return 'assets/svgs/four-capacity.svg';
      case "7":
        return 'assets/svgs/six-capacity-v.svg';
      case "8":
        return 'assets/svgs/two-capacity.svg';
      case "9":
        return 'assets/svgs/six-capacity-v.svg';
    }
    return null;
  }

  static int convertIntoMinutes(String timeString) {
    RegExp regExp = RegExp(r'(\d+)');
    List<Match> matches = regExp.allMatches(timeString).toList();
    int hours = int.parse(matches[0].group(0)!); // First number is hours
    int minutes = int.parse(matches[1].group(0)!); // Second number is minutes
    int totalMinutes = (hours * 60) + minutes;
    developer.log("Total Minutes: $totalMinutes");

    return totalMinutes;
  }

  static splitTime(String time) {
    if (time.contains('0 hour')) {
      List<String> parts = time.split(' ');
      return '${parts[2]} ${parts[3]}';
    } else {
      return time;
    }
  }

  static bool isTimeValidForAll(
    List<TimeOfDay> formattedTimeList,
    TimeOfDay nextTime,
    List<int> durationList,
    List<DateTime> dateList,
    DateTime nextDate,
  ) {
    for (int i = 0; i < formattedTimeList.length; i++) {
      // Check if the date matches
      if (dateList[i].year == nextDate.year &&
          dateList[i].month == nextDate.month &&
          dateList[i].day == nextDate.day) {
        // Calculate the minutes for current time and next time
        int selectedMinutes =
            formattedTimeList[i].hour * 60 + formattedTimeList[i].minute;
        int nextMinutes = nextTime.hour * 60 + nextTime.minute;
        int rangeEnd = selectedMinutes + durationList[i];

        // If the time falls within the range of any entry, return false
        if (nextMinutes >= selectedMinutes && nextMinutes < rangeEnd) {
          return false;
        }
      }
    }
    return true; // If no conflicts, time is valid
  }

  static bool isDateBeforeToday(DateTime date) {
    DateTime today = DateTime.now().subtract(const Duration(days: 1));
    return date.isBefore(today);
  }

  static Future showWillPopDialog(context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmationDialog(
          title: 'We’re sorry to see you leave!'.tr,
          subTitle: 'Are you sure you want to exit app ?'.tr,
          yesOnTap: () {
            SystemNavigator.pop();
          },
        );
      },
    );
  }

  static showBottomSheet(
    Widget sheetWidget, {
    bool isDismissible = true,
    Color? barrierColor,
    double? maxHeight,
    BorderRadius? borderRadius,
  }) {
    return showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      isDismissible: isDismissible,
      enableDrag: isDismissible,
      barrierColor: barrierColor ?? AppColors.black.withValues(alpha: 0.4),
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
      ),
      context: Get.context!,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight:
                    maxHeight ?? MediaQuery.of(context).size.height * 0.6,
              ),
              child: sheetWidget,
            ),
          ),
        );
      },
    );
  }

  static String convertTo12HourFormat(String time24) {
    // Parse the 24-hour format time "1970-01-01 $time24:00"
    DateTime dateTime = DateTime.parse(time24);

    // Format to 12-hour format
    String formattedTime = DateFormat('hh:mm a').format(dateTime);

    return formattedTime;
  }

  static void willPopDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmationDialog(
          title: 'We’re sorry to see you leave!'.tr,
          subTitle: 'Are you sure you want to exit app?'.tr,
          yesOnTap: () {
            Get.back();
            SystemNavigator.pop();
          },
        );
      },
    );
  }

  static DateTime convertDateStingToDateTime(dateString) {
    DateFormat format = DateFormat('yyyy-MM-dd');
    DateTime date = format.parse(dateString);
    return date;
  }

  static String timeDifference(String startTime, String endTime) {
    DateTime startDateTime = DateTime.parse("2000-01-01 $startTime");
    DateTime endDateTime = DateTime.parse("2000-01-01 $endTime");

    Duration difference = endDateTime.difference(startDateTime);
    int hours = difference.inHours;
    int minutes = difference.inMinutes % 60;
    return "$hours hours $minutes minutes";
  }

  static String getWeekdayName(int weekday) {
    const weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return weekdays[weekday - 1];
  }

  static String getProfilePath(String name, {String format = 'png'}) {
    return 'assets/icons/profile_icons/$name.$format';
  }

  static showToast({required String message, int time = 2}) {
    // Get.showSnackbar(
    //    GetSnackBar(
    //     title: message, // Optional, can be left empty
    //     message:null, // Snackbar message
    //     duration: const Duration(seconds: 2), // Duration the snackbar will be visible
    //     snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
    //   ),
    // );

    Fluttertoast.showToast(
      msg: message,
      timeInSecForIosWeb: time,
      backgroundColor: AppColors.white,
      textColor: Colors.black,

      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  static void setStatusBarColorDark() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  static bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static Future getImageFromGallery() async {
    final ImagePicker picker = ImagePicker();

    final file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      File? returnFile = await refineImage(File(file.path));
      Get.log(
        '${DateTime.now()} [RefineImage.getImageFromGallery] $returnFile',
      );
      return returnFile;
    }
  }

  static Future getImageFromCamera() async {
    ImagePicker image = ImagePicker();
    final pickedFile = await image.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      File? returnFile = await refineImage(File(pickedFile.path));
      Get.log(
        '${DateTime.now()} [RefineImage.getImageFromGallery] $returnFile',
      );
      return returnFile;
    }
  }

  // static bool validatePhoneNumber(String phoneNumber, String isoCode) {
  //   try {
  //     bool isValid = CountryUtils.validatePhoneNumber(
  //       phoneNumber.replaceAll(' ', ''),
  //       isoCode,
  //     );
  //     return isValid;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  static Future<File?> refineImage(File pickedFile) async {
    // final tempDir = await getTemporaryDirectory();

    File toCompress = pickedFile;

    developer.log(toCompress.path);

    CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
      sourcePath: toCompress.path,
      aspectRatio: CropAspectRatio(ratioX: 9, ratioY: 16),
      // aspectRatioPresets: Platform.isAndroid
      //     ? [
      //   CropAspectRatioPreset.square,
      //   CropAspectRatioPreset.ratio3x2,
      //   CropAspectRatioPreset.original,
      //   CropAspectRatioPreset.ratio4x3,
      //   CropAspectRatioPreset.ratio16x9
      // ]
      //     : [
      //   CropAspectRatioPreset.original,
      //   CropAspectRatioPreset.square,
      //   CropAspectRatioPreset.ratio3x2,
      //   CropAspectRatioPreset.ratio4x3,
      //   CropAspectRatioPreset.ratio5x3,
      //   CropAspectRatioPreset.ratio5x4,
      //   CropAspectRatioPreset.ratio7x5,
      //   CropAspectRatioPreset.ratio16x9
      // ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Refine Image',
          toolbarColor: AppColors.secondary,
          toolbarWidgetColor: AppColors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          activeControlsWidgetColor: AppColors.secondary,
          backgroundColor: AppColors.secondary,
          lockAspectRatio: false,
        ),
        IOSUiSettings(title: 'Refine Image'),
      ],
    );

    if (croppedFile != null) {
      pickedFile = File(croppedFile.path);
      return pickedFile;
    } else {
      return null;
    }
  }

  static double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a =
        0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  static Future<bool> getPermissionStatus({
    Permission permission = Permission.photos,
  }) async {
    var status = await permission.status;
    developer.log(status.isDenied.toString());

    if (status.isGranted) {
      return true;

      // onNewCameraSelected(cameras[0]);
      // refreshAlreadyCapturedImages();
    } else if (status.isDenied) {
      await permission.request();
      status = await permission.status;
      if (status.isGranted) {
        return true;
      } else {
        return false;
      }
    } else {
      await openAppSettings();
      status = await permission.status;
      if (status.isGranted) {
        return true;
      } else {
        return false;
      }
    }
  }

  static String getDay(DateTime createdAt) {
    //DateTime currentDate = DateTime.now();
    final today = DateTime.now().subtract(const Duration(days: 0));
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    final thisWeek7 = DateTime.now().subtract(const Duration(days: 7));
    final thisWeek6 = DateTime.now().subtract(const Duration(days: 6));
    final thisWeek5 = DateTime.now().subtract(const Duration(days: 5));
    final thisWeek4 = DateTime.now().subtract(const Duration(days: 4));
    final thisWeek3 = DateTime.now().subtract(const Duration(days: 3));
    final thisWeek2 = DateTime.now().subtract(const Duration(days: 2));

    if (today.day == createdAt.day) {
      return "Today".tr;
    }
    // else if ((currentDate.day - createdAt.day <= 1) || (currentDate.day - createdAt.day == -29)  || (currentDate.day - createdAt.day == -30) || (currentDate.day - createdAt.day == -27)) {
    //   return "Yesterday";
    // }
    else if (yesterday.day == createdAt.day) {
      return "Yesterday".tr;
    }
    // else if (currentDate.day - createdAt.day == 7 ||
    //     currentDate.day - createdAt.day < 0) {
    //   return "This Week";
    // }
    else if (thisWeek7.day == createdAt.day) {
      return "This Week".tr;
    } else if (thisWeek6.day == createdAt.day) {
      return "This Week".tr;
    } else if (thisWeek5.day == createdAt.day) {
      return "This Week".tr;
    } else if (thisWeek4.day == createdAt.day) {
      return "This Week".tr;
    } else if (thisWeek3.day == createdAt.day) {
      return "This Week".tr;
    } else if (thisWeek2.day == createdAt.day) {
      return "This Week".tr;
    }
    // else if (currentDate.day - createdAt.day > 7 &&
    //     currentDate.month - createdAt.month >= 1) {
    //   return "Earlier";
    // }
    return "Earlier".tr;
  }

  // static Future<String> getFileUrl(String fileName) async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   return "${directory.path}/$fileName";
  // }

  static String formatTime(String? time) {
    if (time == null || time.isEmpty) return '';

    final parts = time.split(':');
    int hour = int.parse(parts[0]);
    final minute = parts[1];

    final period = hour >= 12 ? 'PM' : 'AM';
    hour = hour % 12 == 0 ? 12 : hour % 12;

    return '$hour:$minute $period';
  }

  static int convertToMinutes(String interval) {
    // Split the input into parts (e.g., "2 h 10 min" -> ["2", "h", "10", "min"])
    final parts = interval.split(' ');

    int hours = 0;
    int minutes = 0;
    // Parse the parts
    for (int i = 0; i < parts.length; i += 2) {
      final value = int.tryParse(parts[i]) ?? 0;
      if (parts[i + 1] == 'h') {
        hours = value;
      } else if (parts[i + 1] == 'min') {
        minutes = value;
      }
    }
    // Convert hours and minutes to total minutes
    return (hours * 60) + minutes;
  }

  static String formatDate(String isoDate) {
    final date = DateTime.parse(isoDate).toLocal();
    return DateFormat('d MMM yyyy').format(date);
  }

  static int daysDifference(String startDate, String expiryDate) {
    final start = DateTime.parse(startDate).toUtc();
    final end = DateTime.parse(expiryDate).toUtc();
    return end.difference(start).inDays;
  }

  static String convertToFormattedInterval(int totalMinutes) {
    // Calculate hours and remaining minutes
    int hours = totalMinutes ~/ 60; // Integer division to get hours
    int minutes = totalMinutes % 60; // Modulus to get remaining minutes

    // Build the formatted string
    String formattedInterval = '';
    if (hours > 0) {
      formattedInterval += '$hours h';
    }
    if (minutes > 0) {
      if (formattedInterval.isNotEmpty) {
        formattedInterval += ' ';
      }
      formattedInterval += '$minutes min';
    }

    return formattedInterval;
  }

  static void showSnackBar(
    String title,
    String message,
    Color backgroundColor,
  ) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: MyText(title: '$title: $message'),
        backgroundColor: backgroundColor.withValues(alpha: 0.8),
        duration: Duration(seconds: 3),
        margin: EdgeInsets.all(16),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  static Widget networkImage({required String? url, double height = 100}) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      child: Image.network(
        url ?? '',
        height: height,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Center(
          child: Icon(
            Icons.image_not_supported,
            size: 60.sp,
            color: Colors.grey,
          ),
        ),
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
