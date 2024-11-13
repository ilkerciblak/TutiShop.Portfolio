import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:suvido_eshop/modules/user/presentation/user_tab_main/bloc/user_tab_cubit.dart';
import 'package:suvido_eshop/modules/user/presentation/user_tab_main/bloc/user_tab_state.dart';
import 'package:suvido_eshop/modules/user/presentation/user_tab_main/content/profile_header/profile_header_content.dart';
import 'package:suvido_eshop/modules/user/presentation/user_tab_main/content/profile_header/profile_header_loading_content.dart';
import 'package:suvido_eshop/modules/user/presentation/user_tab_main/content/user_tab_content.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class UserTabMainScreen extends StatefulWidget {
  const UserTabMainScreen({super.key});

  @override
  State<UserTabMainScreen> createState() => _UserTabMainScreenState();
}

class _UserTabMainScreenState extends State<UserTabMainScreen> {
  late UserTabCubit cubit;

  @override
  void initState() {
    cubit = UserTabCubit();
    cubit.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          BlocBuilder<UserTabCubit, UserTabState>(
            bloc: cubit,
            builder: (context, state) => SliverToBoxAdapter(
              child: switch (state.fetchStatus) {
                FetchStatus.success => ProfileHeaderContent(
                    user: state.user,
                  ),
                _ => const ProfileHeaderLoadingContent(),
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: AppSpacing.veryHuge),
          ),
          SliverPadding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 11),
            sliver: SliverToBoxAdapter(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.primaryWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(11),
                    topRight: Radius.circular(11),
                  ),
                ),
                child: BlocBuilder<UserTabCubit, UserTabState>(
                  bloc: cubit,
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 3,
                      ),
                      child: UserTabContent(state: state),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
