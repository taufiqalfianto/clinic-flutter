import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';

class BuildAppBar extends StatelessWidget {
  final String title;
  final bool withSearchInput;
  final TextEditingController? searchController;
  final void Function(String)? searchChanged;
  final String searchHint;
  final Widget? trailing;
  final bool withnavigation;
  final Navigator? navigation;

  const BuildAppBar({
    super.key,
    required this.title,
    this.withSearchInput = false,
    this.searchController,
    this.searchChanged,
    this.searchHint = 'Cari di sini',
    this.trailing,
    this.withnavigation = false,
    this.navigation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.stroke)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (withnavigation)
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Center(
                child: Icon(Icons.arrow_back_ios),
              ),
            ),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  DateTime.now().toFormattedDate(),
                  style: TextStyle(
                    fontSize: 16.0,
                    color: AppColors.subtitle,
                  ),
                ),
              ],
            ),
          ),
          if (withSearchInput)
            Flexible(
              flex: 2,
              child: SearchInput(
                controller: searchController!,
                onChanged: searchChanged,
                hintText: searchHint,
              ),
            ),
          if (withSearchInput)
            const Flexible(
              flex: 1,
              child: SizedBox.shrink(),
            ),
          Flexible(
            flex: 1,
            child: trailing ?? const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
