import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController npmController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController visiController = TextEditingController();

  final DatabaseReference dbRef =
      FirebaseDatabase.instance.ref().child('mahasiswa');

  Future<void> simpanData() async {
    final data = {
      'npm': npmController.text.trim(),
      'nama': namaController.text.trim(),
      'visi': visiController.text.trim(),
    };

    try {
      final String key = dbRef.push().key ?? '';
      if (key.isEmpty) throw Exception("Key kosong");

      await dbRef.child(key).set(data);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("✅ Data berhasil disimpan")),
      );

      npmController.clear();
      namaController.clear();
      visiController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Gagal menyimpan: $e")),
      );
    }
  }

  @override
  void dispose() {
    npmController.dispose();
    namaController.dispose();
    visiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade400,
        title: const Text("Input data"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 12,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTextField(
                      controller: npmController,
                      label: "NPM",
                      icon: Icons.confirmation_number_outlined,
                      inputType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      controller: namaController,
                      label: "Nama",
                      icon: Icons.person_outline,
                      inputType: TextInputType.name,
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      controller: visiController,
                      label: "Visi 5 Tahun",
                      icon: Icons.visibility_outlined,
                      maxLines: 4,
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          backgroundColor: Colors.deepPurple.shade400,
                        ),
                        onPressed: simpanData,
                        icon: const Icon(Icons.save_outlined),
                        label: const Text(
                          "Simpan Data",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType inputType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.deepPurple.shade300, width: 2),
        ),
      ),
    );
  }
}
