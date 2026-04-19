import 'package:cine_scope/core/di/dependency_injection.dart';
import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/routing/routes.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:cine_scope/features/auth/data/repo/auth_repo.dart';
import 'package:cine_scope/features/watch_list/data/repo/watchlist_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final session = getIt<AuthRepo>().getActiveSession() ?? {};
    final userName = _valueOrFallback(session['name'], 'Movie Lover');
    final email = _valueOrFallback(session['email'], 'No email available');
    final watchlistCount = getIt<WatchlistRepo>().getWatchlist().length;

    return Scaffold(
      backgroundColor: ColorsManager.primary,
      appBar: AppBar(
        backgroundColor: ColorsManager.primary,
        elevation: 0,
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProfileHeroCard(name: userName, email: email),
              verticalSpace(24),
              Text(
                'Overview',
                style: TextStyle(
                  color: ColorsManager.textPrimary,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              verticalSpace(16),
              Row(
                children: [
                  Expanded(
                    child: _ProfileStatCard(
                      icon: Icons.bookmark_outline,
                      label: 'Watch List',
                      value: '$watchlistCount titles',
                    ),
                  ),
                  SizedBox(width: 12.w),
                  const Expanded(
                    child: _ProfileStatCard(
                      icon: Icons.verified_user_outlined,
                      label: 'Account',
                      value: 'Signed in',
                    ),
                  ),
                ],
              ),
              verticalSpace(24),
              Text(
                'Account Info',
                style: TextStyle(
                  color: ColorsManager.textPrimary,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              verticalSpace(16),
              _ProfileInfoTile(
                icon: Icons.email_outlined,
                title: 'Email Address',
                value: email,
              ),
              verticalSpace(16),
              _ProfileInfoTile(
                icon: Icons.person,
                title: 'Name',
                value: userName,
              ),
              verticalSpace(24),
              _ProfileActionCard(
                onLogout: () async {
                  final shouldLogout = await showDialog<bool>(
                    context: context,
                    builder: (dialogContext) {
                      return AlertDialog(
                        backgroundColor: const Color(0xFF242424),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        title: Text(
                          'Logout',
                          style: TextStyle(
                            color: ColorsManager.textPrimary,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        content: Text(
                          'Are you sure you want to logout from this device?',
                          style: TextStyle(
                            color: ColorsManager.textSecondary,
                            fontSize: 14.sp,
                            height: 1.5,
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(dialogContext, false);
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                color: ColorsManager.textSecondary,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(dialogContext, true);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.r),
                              ),
                            ),
                            child: const Text(
                              'Logout',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      );
                    },
                  );

                  if (shouldLogout != true) return;

                  await getIt<AuthRepo>().clearSession();
                  if (!context.mounted) return;
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.loginScreen,
                    (route) => false,
                  );
                },
              ),
              verticalSpace(24),
            ],
          ),
        ),
      ),
    );
  }

  String _valueOrFallback(dynamic value, String fallback) {
    final text = value?.toString().trim() ?? '';
    return text.isEmpty ? fallback : text;
  }
}

class _ProfileHeroCard extends StatelessWidget {
  const _ProfileHeroCard({required this.name, required this.email});

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28.r),
        gradient: const LinearGradient(
          colors: [Color(0xFF2B2B2B), Color(0xFF1A1A1A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.white12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 34.r,
            backgroundColor: Colors.orange.withValues(alpha: 0.18),
            child: Text(
              _buildInitials(name),
              style: TextStyle(
                color: Colors.orange,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          verticalSpace(20),
          Text(
            name,
            style: TextStyle(
              color: ColorsManager.textPrimary,
              fontSize: 26.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          verticalSpace(8),
          Text(
            email,
            style: TextStyle(
              color: ColorsManager.textSecondary,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  String _buildInitials(String value) {
    final parts = value.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) {
      return 'U';
    }
    if (parts.length == 1) {
      return parts.first.substring(0, 1).toUpperCase();
    }
    return '${parts.first.substring(0, 1)}${parts[1].substring(0, 1)}'
        .toUpperCase();
  }
}

class _ProfileStatCard extends StatelessWidget {
  const _ProfileStatCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: const Color(0xFF242424),
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.orange, size: 24.sp),
          verticalSpace(16),
          Text(
            value,
            style: TextStyle(
              color: ColorsManager.textPrimary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          verticalSpace(6),
          Text(
            label,
            style: TextStyle(
              color: ColorsManager.textSecondary,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileInfoTile extends StatelessWidget {
  const _ProfileInfoTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: const Color(0xFF242424),
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: Colors.orange.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Icon(icon, color: Colors.orange, size: 22.sp),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: ColorsManager.textSecondary,
                    fontSize: 13.sp,
                  ),
                ),
                verticalSpace(6),
                Text(
                  value,
                  style: TextStyle(
                    color: ColorsManager.textPrimary,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileActionCard extends StatelessWidget {
  const _ProfileActionCard({required this.onLogout});

  final Future<void> Function() onLogout;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF242424),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Session',
            style: TextStyle(
              color: ColorsManager.textPrimary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          verticalSpace(8),
          Text(
            'You are currently signed in on this device.',
            style: TextStyle(
              color: ColorsManager.textSecondary,
              fontSize: 14.sp,
              height: 1.5,
            ),
          ),
          verticalSpace(18),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: onLogout,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.orange),
                foregroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.r),
                ),
              ),
              icon: const Icon(Icons.logout_rounded),
              label: const Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }
}
