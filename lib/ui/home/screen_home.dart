import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_image/bloc/home/home_bloc.dart';
import 'package:search_image/ui/home/widget/imageItem.dart';
import 'package:search_image/ui/home/widget/searchBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          controller: _searchController,
          onPressed: () {
            context
                .read<HomeBloc>()
                .add(ImageSearching(_searchController.text.toString()));
          },
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeStateInitial) {
            return const Center(
              child: Text(
                "Search Images...",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }

          if (state.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is HomeState) {
            if (state.images.isEmpty) {
              return const Center(
                child: Text("No Post"),
              );
            }

            return RefreshIndicator(
              onRefresh: _onRefresh,
              child: ImageItem(
                scrollController: _scrollController,
                state: state,
              ),
            );
          }
          if (state is HomeStateError) {
            return const Center(child: Text("Error Fetching Images"));
          }
          return SizedBox();
        },
      ),
    );
  }

  Future<void> _onRefresh() async {
    context
        .read<HomeBloc>()
        .add(ImageSearching(_searchController.text.toString()));
  }

  void _onScroll() {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      context
          .read<HomeBloc>()
          .add(ImageFetching(_searchController.text.toString()));
    }
  }
}
