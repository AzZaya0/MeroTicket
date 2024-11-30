import 'package:flutter/material.dart';
import 'dart:async'; // For debouncing

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/config/themes/themeExtension/theme_extension.dart';
import 'package:template/core/common/controls/custom_textfield.dart';
import 'package:template/feature/event/presentation/state/cubit/event_cubit.dart';
import 'package:template/feature/home/page/home.dart'; // For making API calls

class SearchEventWidget extends StatefulWidget {
  @override
  _SearchEventWidgetState createState() => _SearchEventWidgetState();
}

class _SearchEventWidgetState extends State<SearchEventWidget> {
  TextEditingController searchController = TextEditingController();

  bool isLoading = false;
  Timer? debounce;

  void onSearchChanged(String query) {
    // Debounce to avoid frequent API calls
    if (debounce?.isActive ?? false) debounce!.cancel();
    debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        // fetchSuggestions(query);
        context.read<EventCubit>().searchEvent(query);
      } else {}
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
            controller: searchController,
            hintText: 'Search your event',
            hintColor: appColors(context).gray400,
            prefix: const Icon(Icons.search),
            onChanged: onSearchChanged),
        BlocBuilder<EventCubit, EventState>(
          builder: (context, state) {
            return Container(
              child: ((state.searchedModel?.data?.isEmpty ?? false) &&
                      (searchController.text == ''))
                  ? const SizedBox() // Empty space if no suggestions
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.vendorData?.length ?? 0,
                      itemBuilder: (context, index) {
                        return EventHomeCard(
                          singleEventData: state.searchedModel?.data?[index],
                        );
                      },
                    ),
            );
          },
        )
      ],
    );
  }
}
