import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/payment_system_controller.dart';

class PaymentSystemView extends GetView<PaymentSystemController> {
  const PaymentSystemView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFDEEE2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDEEE2),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Payments",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _availableBowlsSection(),
            const SizedBox(height: 16),
            _currentTimerSection(),
            const SizedBox(height: 16),
            _sectionTitle("Profile Boosts (Immediate +24 Hours)"),
            _subtitle("Rise to the top of everyone’s matching page"),
            _singlePriceCard(60),
            const Divider(height: 32),
            _sectionTitle("Bowl Crush (No Expiry)"),
            _subtitle("Stand out with a priority LIKE amongst others"),
            _doubleOptionCard("+5 Bowl Crush", 80),
            const SizedBox(height: 8),
            _doubleOptionCard("+10 Bowl Crush", 150),
            const Divider(height: 32),
            _incrementChatSection(),
            const Divider(height: 32),
            _sectionTitle("CafeConnect Timer Refresh"),
            _subtitle("This will refresh your CafeConnect Timer Immediately"),
            _singlePriceCard(200),
            const Divider(height: 32),
            _sectionTitle("Received Likes Unlocker +1 Month"),
            _subtitle("This will unlock your received likes immediately"),
            _singlePriceCard(200),
          ],
        ),
      ),
    );
  }

  Widget _availableBowlsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Available Bowls :",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.ramen_dining, size: 40),
              const SizedBox(width: 8),
              const Text(
                "144",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.card_giftcard, color: Colors.white),
                label: const Text(
                  "Add a Voucher",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
              side: const BorderSide(color: Colors.black, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {},
            child: const Text(
              "Get more bowls",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _currentTimerSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(borderColor: Colors.pinkAccent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            children: [
              Icon(Icons.timer_outlined, color: Colors.pink, size: 20),
              SizedBox(width: 8),
              Text(
                "Current Timer :",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          _TimerRow("Profile Boost", "20 Hours 10 min"),
          _TimerRow("Increment Chat +1 (1 month)", "2 Days 5 hours"),
          _TimerRow("Increment Chat +2 (2 month)", "41 Days 5 hours"),
          _TimerRow("Increment Chat +1 (1 month)", "26 Days 5 hours"),
          _TimerRow("Received Likes Unlocker +1 (1 month)", "16 Days 1 hour"),
        ],
      ),
    );
  }

  Widget _incrementChatSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle("Increment Chat +1"),
        const Text(
          "1 month and 2 months chats are stackable but not time stackable",
          style: TextStyle(color: Colors.black54, fontSize: 13),
        ),
        const SizedBox(height: 12),
        _doubleOptionCard("+1 month", 200),
        const SizedBox(height: 8),
        _doubleOptionCard("+2 months", 280),
      ],
    );
  }

  Widget _sectionTitle(String title) => Padding(
    padding: const EdgeInsets.only(bottom: 4),
    child: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  );

  Widget _subtitle(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      style: const TextStyle(color: Colors.black54, fontSize: 13),
    ),
  );

  Widget _doubleOptionCard(String label, int price) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: _innerCardDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          Row(
            children: [
              const Icon(Icons.ramen_dining, size: 18),
              const SizedBox(width: 4),
              Text(
                "$price",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _singlePriceCard(int price) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      width: double.infinity,
      alignment: Alignment.center,
      decoration: _innerCardDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.ramen_dining, size: 18),
          const SizedBox(width: 4),
          Text(
            "$price",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _cardDecoration({Color borderColor = const Color(0xFFE0B6B6)}) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: borderColor, width: 1),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  BoxDecoration _innerCardDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: const Color(0xFFE0B6B6)),
      color: Colors.white,
    );
  }
}

class _TimerRow extends StatelessWidget {
  final String title;
  final String time;
  const _TimerRow(this.title, this.time, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 13)),
          Text(
            time,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
