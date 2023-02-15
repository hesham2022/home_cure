import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/widgets/common_header.dart';
import 'package:home_cure/features/calling/presentation/bloc/calling_bloc.dart';
import 'package:home_cure/features/home/presentation/pages/home.dart';
import 'package:home_cure/gen/assets.gen.dart';
import 'package:home_cure/l10n/l10n.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  void initState() {
    final bloc = context.read<CallingBloc>();
    final state = bloc.state;
    if (state is CallingInitial) {
      bloc.add(GetComapnySettingsEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const MyBackButton(),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Center(child: Assets.img.logo.image(height: 70, width: 70)),
                CommonHeader(title: context.l10n.aboutUs),
                BlocBuilder<CallingBloc, CallingState>(
                  builder: (context, state) {
                    if (state is CallingLoaded) {
                      return Text(
                        context.l10n.localeName == 'ar'
                            ? (state.comapnySettingsModel.aboutUsAr ??
                                state.comapnySettingsModel.aboutUs)
                            : state.comapnySettingsModel.aboutUs,
                        style: textStyleWithSecondSemiBold.copyWith(
                          color: Colors.purple,
                        ),
                      );
                    }
                    if (state is CallingFailed) {
                      return Center(
                        child: Text(state.error.errorMessege),
                      );
                    }
                    if (state is CallingLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return const Center();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
