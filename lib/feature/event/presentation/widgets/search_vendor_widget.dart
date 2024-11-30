import 'package:flutter/material.dart';
import 'dart:async'; // For debouncing

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/feature/event/data/models/search_vendor_model.dart';
import 'package:template/feature/event/presentation/state/event_cubit/event_cubit.dart'; // For making API calls

class SearchWithAttachedSuggestions extends StatefulWidget {
  @override
  _SearchWithAttachedSuggestionsState createState() =>
      _SearchWithAttachedSuggestionsState();
}

class _SearchWithAttachedSuggestionsState
    extends State<SearchWithAttachedSuggestions> {
  TextEditingController searchController = TextEditingController();

  bool isLoading = false;
  Timer? debounce;

  // Replace with your API endpoint
  final String apiUrl = 'https://example.com/api/search';

  void onSearchChanged(String query) {
    // Debounce to avoid frequent API calls
    if (debounce?.isActive ?? false) debounce!.cancel();
    debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        // fetchSuggestions(query);
        context.read<EventCubit>().searchVendors(query);
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Column(
            children: [
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Type to search...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: isLoading
                      ? const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: onSearchChanged,
              ),
              BlocBuilder<EventCubit, EventState>(
                builder: (context, state) {
                  return Container(
                    child: (state.vendorData?.isEmpty) ?? false
                        ? const SizedBox() // Empty space if no suggestions
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.vendorData?.length ?? 0,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                    state.vendorData?[index].name ?? 'N/A'),
                                onTap: () {
                                  context
                                      .read<EventCubit>()
                                      .selectVendor(state.vendorData?[index]);
                                  //  //
                                  searchController.text = '';
                                  setState(() {
                                    context.read<EventCubit>().clearVendor();
                                  });
                                },
                              );
                            },
                          ),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
