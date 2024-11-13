// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:suvido_eshop/modules/user/presentation/user_address/user_address_container.dart';
import 'package:suvido_eshop/modules/user/presentation/user_address/user_address_loading_container.dart';
import 'package:suvido_eshop/modules/user/presentation/user_payment_method/user_payment_method_container.dart';
import 'package:suvido_eshop/modules/user/presentation/user_payment_method/user_payment_method_loading_container.dart';
import 'package:suvido_eshop/modules/user/presentation/user_tab_main/bloc/user_tab_state.dart';
import 'package:suvido_eshop/modules/user/presentation/widget/user_screen_btn.dart';
import 'package:suvido_eshop/shared/enums/fetch_status.dart';

class UserTabContent extends StatelessWidget {
  final UserTabState state;
  UserTabContent({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return switch (state.fetchStatus) {
      FetchStatus.success => Column(
          children: [
            UserAddressContainer(address: state.user.address),
            const Divider(),
            UserPaymentMethodContainer(
              method: state.user.paymentMethod,
            ),
            const Divider(),
            ...List.generate(
                userProfileButtons.length, (index) => userProfileButtons[index])
          ],
        ),
      _ => Column(
          children: [
            const UserAddressLoadingContainer(),
            const Divider(),
            const UserPaymentMethodLoadingContainer(),
            const Divider(),
            ...List.generate(
                userProfileButtons.length, (index) => userProfileButtons[index])
          ],
        )
    };
  }

  List<Widget> userProfileButtons = [
    UserScreenBtn(
      onPressed: () {
        // Navigate to profile edit screen
      },
      icon: Icons.edit_outlined,
      btnText: 'Edit Profile',
    ),
    UserScreenBtn(
      onPressed: () {
        // Navigate to notifications screen
      },
      icon: Icons.notifications_outlined,
      btnText: 'Notifications',
    ),
    UserScreenBtn(
      onPressed: () {
        // Navigate to settings screen
      },
      icon: Icons.settings_outlined,
      btnText: 'Settings',
    ),
    UserScreenBtn(
      onPressed: () {
        // Log out action
      },
      icon: Icons.logout_outlined,
      btnText: 'Log Out',
    ),
    UserScreenBtn(
      onPressed: () {
        // Navigate to favorites screen
      },
      icon: Icons.favorite_border,
      btnText: 'Favorites',
    ),
    UserScreenBtn(
      onPressed: () {
        // Navigate to help and support screen
      },
      icon: Icons.help_outline,
      btnText: 'Help & Support',
    ),
    UserScreenBtn(
      onPressed: () {
        // Navigate to order history screen
      },
      icon: Icons.history_outlined,
      btnText: 'Order History',
    ),
    UserScreenBtn(
      onPressed: () {
        // Navigate to payment methods screen
      },
      icon: Icons.credit_card_outlined,
      btnText: 'Payment Methods',
    ),
    UserScreenBtn(
      onPressed: () {
        // Navigate to addresses screen
      },
      icon: Icons.location_on_outlined,
      btnText: 'Addresses',
    ),
    UserScreenBtn(
      onPressed: () {
        // Navigate to security settings screen
      },
      icon: Icons.security_outlined,
      btnText: 'Security',
    ),
    UserScreenBtn(
      onPressed: () {
        // Navigate to about screen
      },
      icon: Icons.info_outline,
      btnText: 'About',
    ),
    UserScreenBtn(
      onPressed: () {
        // Delete account action
      },
      icon: Icons.delete_outline,
      btnText: 'Delete Account',
    ),
  ];
}
