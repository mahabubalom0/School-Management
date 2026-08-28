import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/logger.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../model/home_model.dart';

class HomeController extends GetxController {

  final RxBool isLoading = false.obs;
  final RxBool isMoreLoading = false.obs;
  final RxString errorMsg = ''.obs;

  final RxList<HomeModel> posts = <HomeModel>[].obs;
  final ScrollController scrollController = ScrollController();

  int _currentPage = 1;
  final int _limit = 10;
  bool _hasMoreData = true;

  @override
  void onInit() {
    super.onInit();
    _fetchInitialData();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (!scrollController.hasClients) return;

    for (final position in scrollController.positions) {
      if (position.pixels >= position.maxScrollExtent - 200) {
        _loadMoreData();
        return;
      }
    }
  }

  Future<void> _fetchInitialData() async {
    try {
     
    } catch (e) {
      errorMsg.value = e.toString().replaceAll('Exception: ', '');
      AppLogger.logError('Failed to fetch initial data', e);

      // Show UI feedback
      AppSnackbar.error(title: AppStrings.error.tr, message: errorMsg.value);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _loadMoreData() async {
    if (isMoreLoading.value || isLoading.value || !_hasMoreData) return;

    try {
    
    } catch (e) {
      _currentPage--;
      AppLogger.logError('Failed to load more data', e);

      AppSnackbar.error(
        title: AppStrings.error.tr,
        message: e.toString().replaceAll('Exception: ', ''),
      );
    } finally {
      isMoreLoading.value = false;
    }
  }

  Future<void> refreshData() async => _fetchInitialData();

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
