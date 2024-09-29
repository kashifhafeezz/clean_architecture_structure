import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vg_cli/core/localization/cubit/locale_cubit.dart';
import 'package:vg_cli/core/localization/l10n/l10n.dart';
import 'package:vg_cli/feature/home/presentation/manager/home_listing_bloc.dart';
import 'package:vg_cli/utils/constant/app_constants.dart';
import 'package:vg_cli/utils/dependency_injection/di_container.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  ValueNotifier<bool> localeStatus = ValueNotifier(false);

  late HomeListingBloc _homeListingBloc;

  @override
  void initState() {
    super.initState();
    _homeListingBloc = sl.get<HomeListingBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().appBodyBgColor,
      appBar: AppBar(
        backgroundColor: AppColors().appPrimaryColor,
        title: Text(
          context.l10n.bottom_bar_home_title,
          style: AppTextStyles().mediumTextStyle(
            context: context,
          ),
        ),
        actions: [
          ValueListenableBuilder(
            valueListenable: localeStatus,
            builder: (context, locale, child) => Switch(
              value: locale,
              activeColor: AppColors().appBodyBgColor,
              inactiveTrackColor: AppColors().appWhiteColor,
              onChanged: (v) {
                localeStatus.value = v;

                if (locale) {
                  context.read<LocaleCubit>().toggleApplicationLanguage(
                        languageCode: SupportedLanguageLocales.arabicLocale,
                      );
                } else {
                  context.read<LocaleCubit>().toggleApplicationLanguage(
                        languageCode: SupportedLanguageLocales.engLangCode,
                      );
                }
              },
            ),
          ),
        ],
      ),
      body: BlocProvider.value(
        value: _homeListingBloc,
        child: BlocBuilder<HomeListingBloc, HomeListingState>(
          builder: (context, state) {
            return Container();
          },
        ),
      ),
    );
  }
}
