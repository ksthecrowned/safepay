import 'package:flutter/material.dart';
import 'package:safepay/fitness_app_theme.dart';

class TransactionItem extends StatelessWidget {
  final String storeName;
  final String dateTime;
  final String amount;
  final IconData iconData;
  final Color iconColor;

  const TransactionItem({
    super.key,
    required this.storeName,
    required this.dateTime,
    required this.amount,
    required this.iconData,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(1.1, 1.1),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          bottom: 16,
          right: 24,
          top: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform.rotate(
                    angle: 45 *
                        3.1415926535 /
                        180, // Conversion des degrés en radians
                    child: Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          width: 4,
                          color:
                              FitnessAppTheme.nearlyDarkBlue.withOpacity(0.2),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Icon(
                            iconData,
                            color: FitnessAppTheme.nearlyDarkBlue,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        storeName.length <= 12
                            ? storeName
                            : '${storeName.substring(0, 12)}.',
                        style: const TextStyle(
                          fontFamily: FitnessAppTheme.fontName,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          letterSpacing: 0.5,
                          color: FitnessAppTheme.lightText,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        dateTime,
                        style: const TextStyle(
                          fontFamily: FitnessAppTheme.fontName,
                          letterSpacing: 0.5,
                          color: FitnessAppTheme.lightText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  amount,
                  style: const TextStyle(
                    fontFamily: FitnessAppTheme.fontName,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: FitnessAppTheme.lightText,
                  ),
                ),
                const Text(
                  'XAF',
                  style: TextStyle(
                    fontFamily: FitnessAppTheme.fontName,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                    color: FitnessAppTheme.lightText,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LatestTransactions extends StatelessWidget {
  const LatestTransactions({
    required this.animationController,
    required this.animation,
    super.key,
  });

  final AnimationController animationController;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 16,
        bottom: 16,
      ),
      child: Column(
        children: [
          buildTransactionWithAnimation(
            index: 0,
            child: const TransactionItem(
              storeName: 'Vermel Store',
              dateTime: '26 Mars 2024, 12:45',
              amount: '2 000 000',
              iconData: Icons.arrow_upward,
              iconColor: Colors.blue,
            ),
          ),
          const SizedBox(height: 15),
          buildTransactionWithAnimation(
            index: 1,
            child: const TransactionItem(
              storeName: 'Mamiwata Restaurant',
              dateTime: '26 Mars 2024, 12:45',
              amount: '2 000 000',
              iconData: Icons.arrow_upward,
              iconColor: Colors.blue,
            ),
          ),
          const SizedBox(height: 15),
          buildTransactionWithAnimation(
            index: 1,
            child: const TransactionItem(
              storeName: 'Mamiwata Restaurant',
              dateTime: '26 Mars 2024, 12:45',
              amount: '2 000 000',
              iconData: Icons.arrow_upward,
              iconColor: Colors.blue,
            ),
          ),
          const SizedBox(height: 15),
          buildTransactionWithAnimation(
            index: 1,
            child: const TransactionItem(
              storeName: 'Mamiwata Restaurant',
              dateTime: '26 Mars 2024, 12:45',
              amount: '2 000 000',
              iconData: Icons.arrow_upward,
              iconColor: Colors.blue,
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget buildTransactionWithAnimation({
    required int index,
    required Widget child,
  }) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? animatedChild) {
        return FadeTransition(
          opacity: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(CurvedAnimation(
            parent: animationController,
            curve: Interval((1 / 5) * index, 1.0, curve: Curves.fastOutSlowIn),
          )),
          child: Transform(
            transform: Matrix4.translationValues(
              0.0,
              30 * (1.0 - animation.value),
              0.0,
            ),
            child: animatedChild,
          ),
        );
      },
      child: child,
    );
  }
}
