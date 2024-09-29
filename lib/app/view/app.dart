import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vg_cli/bootstrap.dart';
import 'package:vg_cli/core/localization/cubit/locale_cubit.dart';
import 'package:vg_cli/core/localization/l10n/l10n.dart';
import 'package:vg_cli/core/platform/check_internet_connection/bloc/check_internet_connection_bloc.dart';
import 'package:vg_cli/utils/dependency_injection/di_container.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late CheckInternetConnectionBloc internetConnectionBloc;
  late LocaleCubit localeCubit;

  @override
  void initState() {
    super.initState();
    internetConnectionBloc = sl.get<CheckInternetConnectionBloc>();
    localeCubit = sl.get<LocaleCubit>();
  }

  @override
  void dispose() {
    internetConnectionBloc.close();
    localeCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: internetConnectionBloc..add(NetworkObserve()),
        ),
        BlocProvider.value(value: localeCubit),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          if (state is ToggleAppLocaleState) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'VG CLI Test',
              locale: Locale(state.languageCode),
              scrollBehavior: const MaterialScrollBehavior().copyWith(
                overscroll: true,
                dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.trackpad,
                  PointerDeviceKind.touch,
                  PointerDeviceKind.stylus,
                  PointerDeviceKind.unknown,
                  PointerDeviceKind.invertedStylus,
                },
              ),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: router.router,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
