import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class AppLoadingState extends StatelessWidget {
  final String? message;

  const AppLoadingState({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.teal),
          ),
          if (message != null) ...[
            SizedBox(height: size.height * 0.02),
            Text(
              message!,
              style: TextStyle(
                fontSize: (size.width * 0.036).clamp(12.0, 15.0),
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
