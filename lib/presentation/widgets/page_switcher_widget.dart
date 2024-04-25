
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test1/presentation/base/app_colors.dart';

import '../base/resource_manager.dart';

class PageSwitcherWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final void Function() onNextPageClicked;
  final void Function() onPreviousPageClicked;
  final void Function() onFirstPageClicked;
  final void Function() onLastPageClicked;

  const PageSwitcherWidget({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onNextPageClicked,
    required this.onPreviousPageClicked,
    required this.onFirstPageClicked,
    required this.onLastPageClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onFirstPageClicked,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Transform.rotate(
                angle: 3.14,
                child: Image.asset(
                  ResourceManger.images.arrow,
                  height: 30,
                  fit: BoxFit.contain,
                  color: getArrowColor(),
                ),
              ),
              Transform.rotate(
                angle: 3.14,
                child: Image.asset(
                  ResourceManger.images.arrow,
                  height: 30,
                  fit: BoxFit.contain,
                  color: getArrowColor(),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onPreviousPageClicked,
          child: Transform.rotate(
            angle: 3.14,
            child: Image.asset(
              ResourceManger.images.arrow,
              height: 30,
              fit: BoxFit.contain,
              color: getArrowColor(),
            ),
          ),
        ),
        const SizedBox(width: 30),
        Text(
          '${getCurrentPage()} / ${getTotalPages()}',
          style: TextStyle(
            fontSize: 20,
            color: getArrowColor(),
          ),
        ),
        const SizedBox(width: 30),
        GestureDetector(
          onTap: onNextPageClicked,
          child: Image.asset(
            ResourceManger.images.arrow,
            height: 30,
            fit: BoxFit.contain,
            color: getArrowColor(),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onLastPageClicked,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ResourceManger.images.arrow,
                height: 30,
                fit: BoxFit.contain,
                color: getArrowColor(),
              ),
              Image.asset(
                ResourceManger.images.arrow,
                height: 30,
                fit: BoxFit.contain,
                color: getArrowColor(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String getCurrentPage() {
    if (currentPage == 0) {
      return (totalPages + 1).toString();
    } else {
      return currentPage.toString();
    }
  }

  Color getArrowColor() {
    // if (currentPage == 0) {
    //   return Colors.grey;
    // } else {
    //   return AppColors.primaryColor;
    // }


    return AppColors.primaryColor;

  }

  String getTotalPages() {
    if (currentPage == 0) {
      return (totalPages + 1).toString();
    } else {
      return totalPages.toString();
    }
  }
}
