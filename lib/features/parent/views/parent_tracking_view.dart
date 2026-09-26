import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../viewmodels/parent_viewmodel.dart';
import '../../../shared/widgets/app_status_chip.dart';

class ParentTrackingView extends GetView<ParentViewModel> {
  const ParentTrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Van Tracking'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              Get.snackbar('Location Updated', 'Fetched latest GPS coordinates of VAN-02.');
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Map Background UI Container / Visual Representation
          Container(
            width: double.infinity,
            height: double.infinity,
            color: theme.brightness == Brightness.dark
                ? const Color(0xFF1E2825)
                : const Color(0xFFE5ECE9),
            child: Stack(
              children: [
                // Grid / Route Mock Visualization
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.map_rounded,
                        size: size.width * 0.3,
                        color: AppColors.teal.withOpacity(0.2),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Google Maps Live Stream',
                        style: TextStyle(
                          color: theme.colorScheme.onSurface.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Map Markers Mock Overlay
                Positioned(
                  top: size.height * 0.25,
                  left: size.width * 0.3,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: AppColors.deepForest,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.directions_bus, color: Colors.white, size: 22),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black26)],
                        ),
                        child: const Text('VAN-02 (Live)', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black)),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  top: size.height * 0.12,
                  right: size.width * 0.2,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: AppColors.warmGold,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.school, color: Colors.white, size: 22),
                      ),
                      const Text('Army Public School', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Floating Top Status Banner
          Positioned(
            top: 16,
            left: size.width * 0.04,
            right: size.width * 0.04,
            child: Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04,
                  vertical: size.height * 0.012,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.gps_fixed, color: AppColors.success, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'GPS Signal: High Accuracy • Updated 10s ago',
                        style: TextStyle(
                          fontSize: (size.width * 0.032).clamp(11.0, 13.0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const AppStatusChip(status: 'ON ROUTE'),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Mini Driver & Trip Detail Sheet
          Positioned(
            bottom: 16,
            left: size.width * 0.04,
            right: size.width * 0.04,
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.045),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 22,
                          backgroundColor: AppColors.teal,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Ahmed Hassan',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                'Driver • VAN-02 (LEA-4589)',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: theme.colorScheme.onSurface.withOpacity(0.65),
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.phone_forwarded, color: AppColors.teal),
                          onPressed: () {
                            Get.snackbar('Calling Driver', 'Dialing +92 321 9876543...');
                          },
                        ),
                      ],
                    ),
                    const Divider(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildTripStat(context, label: 'DISTANCE', value: '2.4 km'),
                        _buildTripStat(context, label: 'EST. TIME', value: '8 mins'),
                        _buildTripStat(context, label: 'NEXT STOP', value: 'Stop 4'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTripStat(BuildContext context, {required String label, required String value}) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface.withOpacity(0.6),
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: AppColors.deepForest,
          ),
        ),
      ],
    );
  }
}
