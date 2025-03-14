import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});
  @override
  FormPageState createState() => FormPageState();
}

class FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  // Listes déroulantes
  String? _selectedDistrict;
  String? _selectedCommune;
  String? _selectedQuartier;

  final List<String> districts = ["Funa", "Lukunga", "Tshangu","Mont Amba"];
  final List<String> communes = ["Lemba", "Ndjili", "Mont ngafula","Selembao"];
  final List<String> quartiers = ["Lokole", "Nsele", "Mafuta"];

  // Contrôleurs des champs de texte
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController rueController = TextEditingController();
  final TextEditingController professionController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Afficher les informations saisies dans le terminal
      print("Nom: ${nameController.text}");
      print("Date de naissance: ${dobController.text}");
      print("Téléphone: ${phoneController.text}");
      print("District: $_selectedDistrict");
      print("Commune: $_selectedCommune");
      print("Quartier: $_selectedQuartier");
      print("Rue: ${rueController.text}");
      print("Profession: ${professionController.text}");

      // Afficher un message de succès
      showDialog(
        context: context,
        barrierDismissible: false, // Empêche la fermeture en cliquant en dehors
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Succès", style: TextStyle(fontWeight: FontWeight.bold)),
            content: Text("Enregistrement réussie ! 🎉"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Fermer le message
                },
                child: Text("OK", style: TextStyle(fontSize: 16)),
              ),
            ],
          );
        },
      );

      // Réinitialiser les champs après l'inscription
      nameController.clear();
      dobController.clear();
      phoneController.clear();
      rueController.clear();
      professionController.clear();
      setState(() {
        _selectedDistrict = null;
        _selectedCommune = null;
        _selectedQuartier = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF101F34),
        title: Text("Formulaire d'Enregistrement", style: TextStyle(color: Colors.white),),
        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white), // Icône de flèche retour
        onPressed: () {
          Navigator.of(context).pop() ;},),),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                _buildInputField("Nom", nameController),
                SizedBox(height: 10),
                _buildDateField("Date de naissance", dobController),
                SizedBox(height: 10),
                _buildInputField("Téléphone", phoneController, isPhone: true),
                SizedBox(height: 10),
                _buildDropdownField("District", districts, _selectedDistrict, (value) {
                  setState(() => _selectedDistrict = value);
                }),
                SizedBox(height: 10),
                _buildDropdownField("Commune", communes, _selectedCommune, (value) {
                  setState(() => _selectedCommune = value);
                }),
                SizedBox(height: 10),
                _buildDropdownField("Quartier", quartiers, _selectedQuartier, (value) {
                  setState(() => _selectedQuartier = value);
                }),
                SizedBox(height: 10),
                _buildInputField("Rue", rueController),
                SizedBox(height: 10),
                _buildInputField("Profession", professionController),
                SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.blue,
                    ),
                    child: Text("Enregistrer", style: TextStyle(color:Colors.white,fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 📝 Champ de saisie avec bordure
  Widget _buildInputField(String label, TextEditingController controller, {bool isPhone = false}) {
    return TextFormField(
      controller: controller,
      keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
      validator: (value) {
        if (value!.isEmpty) return "Veuillez entrer votre $label";
        if (isPhone && value.length < 8) return "Numéro de téléphone invalide";
        return null;
      },
    );
  }

  // 📝 Champ de saisie pour la date de naissance avec sélection du calendrier
  Widget _buildDateField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: Icon(Icons.calendar_today),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          setState(() {
            controller.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
          });
        }
      },
      validator: (value) => value!.isEmpty ? "Veuillez sélectionner une date" : null,
    );
  }

  // 📝 Liste déroulante avec bordure
  Widget _buildDropdownField(String label, List<String> items, String? selectedValue, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
      value: selectedValue,
      items: items.map((String item) {
        return DropdownMenuItem(value: item, child: Text(item));
      }).toList(),
      onChanged: onChanged,
      validator: (value) => value == null ? "Veuillez sélectionner $label" : null,
    );
  }
}
