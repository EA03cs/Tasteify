import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Feature/Search/ViewModel/Cubit/search_cubit.dart';
import 'package:tasteify/Feature/Search/presentation/widgets/SearchBarField.dart';
import 'package:tasteify/Feature/Search/presentation/widgets/SearchEmptyState.dart';
import 'package:tasteify/Feature/Search/presentation/widgets/SearchHistoryList.dart';
import 'package:tasteify/Feature/Search/presentation/widgets/SearchResults.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                final cubit = context.read<SearchCubit>();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchBarField(controller: _controller, cubit: cubit),
                    SizedBox(height: 16.h),
                    Expanded(child: _buildBody(state, cubit)),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(SearchState state, SearchCubit cubit) {
    return switch (state) {
      SearchLoading() => const Center(child: _LoadingIndicator()),
      SearchFailure(:final errorMessage) => _ErrorState(message: errorMessage),
      SearchLoaded(:final products, :final query) => products.isEmpty
          ? SearchEmptyState(query: query)
          : SearchResults(products: products),
      _ => cubit.history.isEmpty
          ? const SearchEmptyState()
          : SearchHistoryList(cubit: cubit, controller: _controller),
    };
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) =>
      const CircularProgressIndicator.adaptive();
}

class _ErrorState extends StatelessWidget {
  final String message;

  const _ErrorState({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyle(fontSize: 14.sp, color: Colors.red),
      ),
    );
  }
}