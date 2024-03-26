import 'package:auto_route/auto_route.dart';
import 'package:flights/app/router/router.dart';
import 'package:flights/features/flights/flights/controller/flight_list_cubit.dart';
import 'package:flights/features/flights/flights/model/flight/flight.dart';
import 'package:flights/features/new_flight/3_transfers/transfer_card.dart';
import 'package:flights/features/new_flight/bloc/flight/flight_bloc.dart';
import 'package:flights/features/new_flight/bloc/flight/flight_event.dart';
import 'package:flights/shared/layout/information_box.dart';
import 'package:flights/shared/layout/section.dart';
import 'package:flights/shared/layout/section_with_title.dart';
import 'package:flights/shared/widget/custom_button.dart';
import 'package:flights/shared/widget/custom_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class NewFlightTransfersScreen extends StatefulWidget {
  const NewFlightTransfersScreen({super.key});

  @override
  State<NewFlightTransfersScreen> createState() =>
      _NewFlightTransfersScreenState();
}

class _NewFlightTransfersScreenState extends State<NewFlightTransfersScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: const Text('New flight'),
            previousPageTitle: 'Arrival',
            trailing: CustomTextButton(
              title: 'Skip',
              onPressed: () => finishCreatingFlight(context),
              fontSize: 16,
            ),
            border: null,
          ),
          BlocBuilder<FlightBloc, Flight?>(
            builder: (context, state) {
              if (state!.transfers.isNotEmpty) {
                return SliverList.separated(
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const SectionWithTitle(
                        title: 'Transfers',
                        child: SizedBox.shrink(),
                      );
                    } else if (index <= state.transfers.length) {
                      return Dismissible(
                        onDismissed: (direction) {
                          context
                              .read<FlightBloc>()
                              .add(RemovedTransfer(index - 1));
                        },
                        key: UniqueKey(),
                        child: TransferCard(
                          transfer: state.transfers[index - 1],
                        ),
                      );
                    } else {
                      return Section(
                        children: [
                          CustomButton(
                            title: 'Done',
                            onPressed: () => finishCreatingFlight(context),
                            isActive: true,
                          ),
                          CustomTextButton(
                            title: 'Add more',
                            onPressed: () =>
                                context.router.push(const AddTransferRoute()),
                          ),
                          CustomTextButton(
                            title: 'Clear',
                            onPressed: () => context
                                .read<FlightBloc>()
                                .add(ClearTransfers()),
                          ),
                        ],
                      );
                    }
                  },
                  itemCount: state.transfers.length + 2,
                  separatorBuilder: (_, __) => SizedBox(height: 16.h),
                );
              } else {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SectionWithTitle(
                        title: 'Transfers',
                        child: SizedBox.shrink(),
                      ),
                      Section(
                        children: [
                          InformationBox(
                            title: 'Any transfer',
                            subtitle:
                                'Tap a button below to add intermediate country and transfer details.',
                            assetPath: 'assets/icons/booking/transfer.svg',
                            button: CustomButton(
                              title: 'Add transfer',
                              onPressed: () =>
                                  context.router.push(const AddTransferRoute()),
                              isActive: true,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    ));
  }

  void finishCreatingFlight(BuildContext context) {
    final flight = context.read<FlightBloc>().state;
    context.read<FlightListCubit>().create(flight!);
    context.router.replaceAll(
      [
        const TabBarWrapperRoute(
          children: [
            NewFlightWrapperRoute(children: [
              DepartureRoute(),
            ])
          ],
        ),
      ],
      updateExistingRoutes: false,
    );
  }
}
