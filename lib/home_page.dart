import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _fundController = TextEditingController();
  final _rateController = TextEditingController();
  final _monthsController = TextEditingController();

  String _result = '';

  void _calculateDividend() {
    double fund = double.tryParse(_fundController.text) ?? 0.0;
    double rate = double.tryParse(_rateController.text) ?? 0.0;
    int months = int.tryParse(_monthsController.text) ?? 0;

    if (months > 12) months = 12;

    double monthlyDividend = (rate / 100 / 12) * fund;
    double totalDividend = monthlyDividend * months;

    setState(() {
      _result =
      'Calculation:\n'
          'Monthly Dividend = RM $fund × ${rate / 100} / 12\n'
          '= RM ${monthlyDividend.toStringAsFixed(5)}\n\n'
          'Year-end Total Dividend = ${monthlyDividend.toStringAsFixed(5)} × $months\n'
          '= RM ${totalDividend.toStringAsFixed(2)}';
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5), // light purple background
      appBar: AppBar(
        title: const Text('Dividend Calculator'),
        centerTitle: true,
        backgroundColor: const Color(0xFFBA68C8), // purple app bar
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'About',
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: 400, // fixed max width for better layout on larger screens
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _fundController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Invested Fund (RM)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _rateController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Annual Dividend Rate (%)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _monthsController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Number of Months (1-12)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateDividend,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFBA68C8), // purple
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Calculate',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _result,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
