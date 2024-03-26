import 'package:auto_route/auto_route.dart';
import 'package:flights/app/router/router.dart';
import 'package:flights/features/flights/flights/controller/flight_list_cubit.dart';
import 'package:flights/features/flights/flights/model/flight/flight.dart';
import 'package:flights/features/flights/flights/model/transfer/transfer.dart';
import 'package:flights/features/flights/single_flight/flight/edit/transfer/transfer_list_cubit.dart';
import 'package:flights/shared/layout/flight_events_tile.dart';
import 'package:flights/shared/layout/information_box.dart';
import 'package:flights/shared/layout/section.dart';
import 'package:flights/shared/layout/section_with_title.dart';
import 'package:flights/shared/widget/custom_button.dart';
import 'package:flights/shared/widget/custom_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class EditTransferScreen extends StatefulWidget implements AutoRouteWrapper {
  final Flight flight;

  const EditTransferScreen({super.key, required this.flight});

  @override
  State<EditTransferScreen> createState() => _EditTransferScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => TransferListCubit(),
      child: this,
    );
  }
}

class _EditTransferScreenState extends State<EditTransferScreen> {
  late TransferListCubit bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<TransferListCubit>();
    bloc.init(widget.flight.transfers);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Edit flight'),
            border: null,
          ),
          BlocBuilder<TransferListCubit, List<Transfer>>(
            builder: (context, state) {
              if (state.isNotEmpty) {
                return SliverList.separated(
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const SectionWithTitle(
                        title: 'Transfers',
                        child: SizedBox.shrink(),
                      );
                    } else if (index <= state.length) {
                      final transfer = state[index - 1];
                      return Dismissible(
                        onDismissed: (direction) => bloc.delete(index - 1),
                        key: UniqueKey(),
                        child: TravelEventsTile(
                          countryDeparture: transfer.country,
                          countryArrival: transfer.country,
                          cityDeparture: transfer.city,
                          cityArrival: transfer.city,
                          dateTimeDeparture: transfer.departure,
                          dateTimeArrival: transfer.arrival,
                          airportDeparture: transfer.airport,
                          airportArrival: transfer.airport,
                          reversed: true,
                        ),
                      );
                    } else {
                      return Section(
                        children: [
                          CustomButton(
                            title: 'Save',
                            onPressed: () => finishEditingTransfers(context),
                            isActive: true,
                          ),
                          CustomTextButton(
                            title: 'Add more',
                            onPressed: () => context.router.push(
                                EditTransferAddRoute(
                                    cubit: context.read<TransferListCubit>())),
                          ),
                          CustomTextButton(
                            title: 'Clear',
                            onPressed: () => bloc.flush(),
                          ),
                        ],
                      );
                    }
                  },
                  itemCount: state.length + 2,
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
                              onPressed: () => context.router.push(
                                  EditTransferAddRoute(
                                      cubit:
                                          context.read<TransferListCubit>())),
                              isActive: true,
                            ),
                          ),
                        ],
                      ),
                      Section(
                        children: [
                          CustomButton(
                            title: 'Save',
                            onPressed: () => finishEditingTransfers(context),
                            isActive: true,
                          ),
                        ],
                      ),
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

  void finishEditingTransfers(BuildContext context) {
    final cubit = context.read<FlightListCubit>();
    final index = cubit.state.indexOf(widget.flight);
    final newTransfers = context.read<TransferListCubit>().state;
    cubit.update(index, widget.flight.copyWith(transfers: newTransfers));
    context.router.popForced();
  }
}
