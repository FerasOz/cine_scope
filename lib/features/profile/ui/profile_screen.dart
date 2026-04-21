import 'package:cine_scope/core/di/dependency_injection.dart';
import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/routing/routes.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:cine_scope/features/auth/data/repo/auth_repo.dart';
import 'package:cine_scope/features/profile/ui/widgets/profile_action_card.dart';
import 'package:cine_scope/features/profile/ui/widgets/profile_hero_card.dart';
import 'package:cine_scope/features/profile/ui/widgets/profile_info_tile.dart';
import 'package:cine_scope/features/profile/ui/widgets/profile_section_title.dart';
import 'package:cine_scope/features/profile/ui/widgets/profile_stat_card.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeroCard(name: userName, email: email),
              verticalSpace(24),
              ProfileSectionTitle(title: 'Overview'),
              verticalSpace(16),
              Row(
                children: [
                  Expanded(
                    child: ProfileStatCard(
                      icon: Icons.bookmark_outline,
                      label: 'Watch List',
                      value: '$watchlistCount titles',
                    ),
                  ),
                  horizontalSpace(12),
                  const Expanded(
                    child: ProfileStatCard(
                      icon: Icons.verified_user_outlined,
                      label: 'Account',
                      value: 'Signed in',
                    ),
                  ),
                ],
              ),
              verticalSpace(24),
              ProfileSectionTitle(title: 'Account Info'),
              verticalSpace(16),
              ProfileInfoTile(
                icon: Icons.email_outlined,
                title: 'Email Address',
                value: email,
              ),
              verticalSpace(16),
              ProfileInfoTile(
                icon: Icons.person,
                title: 'Name',
                value: userName,
              ),
              verticalSpace(24),
              ProfileActionCard(onLogout: () => _handleLogout(context)),
              verticalSpace(24),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleLogout(BuildContext context) async {
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
  }

  String _valueOrFallback(dynamic value, String fallback) {
    final text = value?.toString().trim() ?? '';
    return text.isEmpty ? fallback : text;
  }
}
