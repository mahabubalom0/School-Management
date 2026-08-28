import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackbarType { success, error, info, warning }

enum SnackbarPosition { top, bottom }

class AppSnackbar {
  AppSnackbar._();

  static void show({
    required String title,
    required String message,
    SnackbarType type = SnackbarType.info,
    SnackbarPosition position = SnackbarPosition.top,
    Duration duration = const Duration(seconds: 3),
  }) {
    final context = Get.context;
    if (context == null) return;

    final colorScheme = Theme.of(context).colorScheme;

    final backgroundColor = switch (type) {
      SnackbarType.success => Colors.green.shade600,
      SnackbarType.error => colorScheme.error,
      SnackbarType.warning => Colors.orange.shade800,
      SnackbarType.info => colorScheme.primary,
    };

    final icon = switch (type) {
      SnackbarType.success => Icons.check_circle_outline,
      SnackbarType.error => Icons.error_outline,
      SnackbarType.warning => Icons.warning_amber_rounded,
      SnackbarType.info => Icons.info_outline,
    };

    if (position == SnackbarPosition.bottom) {
      _showBottomSnackbar(
        context,
        title,
        message,
        backgroundColor,
        icon,
        duration,
      );
    } else {
      _showTopSnackbar(
        context,
        title,
        message,
        backgroundColor,
        icon,
        duration,
      );
    }
  }

  static void _showBottomSnackbar(
    BuildContext context,
    String title,
    String message,
    Color backgroundColor,
    IconData icon,
    Duration duration,
  ) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: _SnackbarContent(title: title, message: message, icon: icon),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: duration,
        elevation: 6,
      ),
    );
  }

  static void _showTopSnackbar(
    BuildContext context,
    String title,
    String message,
    Color backgroundColor,
    IconData icon,
    Duration duration,
  ) {
    final overlay = Get.key.currentState?.overlay;
    if (overlay == null) return;
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) => _TopSnackbarWidget(
        title: title,
        message: message,
        backgroundColor: backgroundColor,
        icon: icon,
        onDismiss: () => entry.remove(),
      ),
    );

    overlay.insert(entry);
    Future.delayed(duration, () {
      if (entry.mounted) entry.remove();
    });
  }

  // Quick helper methods
  static void success({
    required String title,
    required String message,
    SnackbarPosition position = SnackbarPosition.top,
  }) {
    show(
      title: title,
      message: message,
      type: SnackbarType.success,
      position: position,
    );
  }

  static void error({
    required String title,
    required String message,
    SnackbarPosition position = SnackbarPosition.top,
  }) {
    show(
      title: title,
      message: message,
      type: SnackbarType.error,
      position: position,
    );
  }
}

class _SnackbarContent extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  const _SnackbarContent({
    required this.title,
    required this.message,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              Text(
                message,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TopSnackbarWidget extends StatelessWidget {
  final String title;
  final String message;
  final Color backgroundColor;
  final IconData icon;
  final VoidCallback onDismiss;

  const _TopSnackbarWidget({
    required this.title,
    required this.message,
    required this.backgroundColor,
    required this.icon,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.transparent,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: _SnackbarContent(title: title, message: message, icon: icon),
          ),
        ),
      ),
    );
  }
}
