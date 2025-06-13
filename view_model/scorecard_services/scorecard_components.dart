import 'package:cricketmania/resources/colors.dart';
import 'package:flutter/material.dart';

class BatterDetails extends StatelessWidget {
  final String name;
  final String outType;
  final int runs;
  final int balls;
  final int fours;
  final int sixes;
  final double strikeRate;

  const BatterDetails({
    super.key,
    required this.name,
    required this.outType,
    required this.runs,
    required this.balls,
    required this.fours,
    required this.sixes,
    required this.strikeRate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  name,
                  style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              _statCell(runs.toString()),
              _statCell(balls.toString()),
              _statCell(fours.toString()),
              _statCell(sixes.toString()),
              _statCell(strikeRate.toStringAsFixed(2)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              outType,
              style: const TextStyle(
                color: AppColors.grey,
                fontSize: 12,
              ),
            ),
          ),
        ),
        const Divider(
          color: AppColors.white,
          thickness: 0.5,
        )
      ],
    );
  }

  Widget _statCell(String value) {
    return Expanded(
      flex: 1,
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: const TextStyle(color: AppColors.white, fontSize: 14),
      ),
    );
  }
}

class BowlerDetails extends StatefulWidget {
  final String name;
  final String over;
  final String maiden;
  final String runs;
  final String wicket;
  const BowlerDetails(
      {super.key,
      required this.name,
      required this.over,
      required this.maiden,
      required this.runs,
      required this.wicket});

  @override
  State<BowlerDetails> createState() => _BowlerDetailsState();
}

class _BowlerDetailsState extends State<BowlerDetails> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(6),
          child: SizedBox(
            width: width * double.infinity,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    widget.name,
                    style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                _statCell(widget.over.toString()),
                _statCell(widget.maiden.toString()),
                _statCell(widget.runs.toString()),
                _statCell(widget.wicket.toString()),
              ],
            ),
          ),
        ),
        const Divider(
          color: AppColors.white,
          thickness: 0.5,
        ),
      ],
    );
  }

  Widget _statCell(String value) {
    return Expanded(
      flex: 1,
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: const TextStyle(color: AppColors.white, fontSize: 14),
      ),
    );
  }
}
