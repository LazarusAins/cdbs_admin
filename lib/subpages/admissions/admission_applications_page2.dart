//WHOLE APPLICANTIONS PAGE2

import 'package:cdbs_admin/bloc/admission_bloc/admission_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdmissionApplicationsPage2 extends StatefulWidget {

  List<Map<String, dynamic>>? formDetails;
  final Function(bool isClicked) onNextPressed;

  AdmissionApplicationsPage2({super.key, required this.formDetails, required this.onNextPressed});

  @override
  State<AdmissionApplicationsPage2> createState() =>
      _AdmissionApplicationsPage2State();
}

class _AdmissionApplicationsPage2State
    extends State<AdmissionApplicationsPage2> {
  int _currentPage = 1; // Variable to track the current page (1, 2, or 3)

  void _nextPage() {
    setState(() {
      if (_currentPage < 5) {
        _currentPage++;
      }
    });
  }

  void _previousPage() {
    setState(() {
      if (_currentPage > 1) {
        _currentPage--;
      }
    });
  }



TextEditingController dateController = TextEditingController();
TextEditingController fnameController = TextEditingController();
TextEditingController mnameController = TextEditingController();
TextEditingController lnameController = TextEditingController();
TextEditingController schoolYearController = TextEditingController();
TextEditingController levelApplyingController = TextEditingController();
TextEditingController birthPlaceController = TextEditingController();
TextEditingController ageController = TextEditingController();
TextEditingController religionController = TextEditingController();
TextEditingController citizenshipController = TextEditingController();
TextEditingController acrController = TextEditingController();
TextEditingController addressController = TextEditingController();
TextEditingController postalController = TextEditingController();
TextEditingController contactController = TextEditingController();
TextEditingController languageSpokenController = TextEditingController();
TextEditingController companionController = TextEditingController();
TextEditingController siblingQuantityController = TextEditingController();

String selectedGender = '';
String dropdown1Value = 'Option 1';
String dropdown2Value = 'Option A';

int quantityReceived = 0;

List<TextEditingController> nameControllers = [];
List<TextEditingController> ageControllers = [];
List<TextEditingController> gradeLevelControllers = [];
List<TextEditingController> schoolBisControllers = [];

List<Widget> siblings = [];

  late TextEditingController name;
  late TextEditingController ageSibling;
  late TextEditingController gradeLevel;
  late TextEditingController schoolBis;


  

void addItemDescription(double scale) {
    // Ensure descriptionControllers list length matches quantityReceived
    while (nameControllers.length < quantityReceived) {
      nameControllers.add(TextEditingController());
      ageControllers.add(TextEditingController());
      gradeLevelControllers.add(TextEditingController());
      schoolBisControllers.add(TextEditingController());
    }
    while (nameControllers.length > quantityReceived) {
      TextEditingController removedController =
          nameControllers.removeLast();
      removedController.dispose(); // Dispose the removed controller
      TextEditingController removedQuantityController =
          ageControllers.removeLast();
      removedQuantityController.dispose(); // Dispose the removed controller
      TextEditingController removedpriceController =
          gradeLevelControllers.removeLast();
      removedpriceController.dispose();
      TextEditingController removedorderDocController =
          schoolBisControllers.removeLast();
      removedorderDocController.dispose();
    }
    List<Widget> newDescriptions = [];
    for (int i = 0; i < quantityReceived; i++) {
      name = nameControllers[i];
      ageSibling = ageControllers[i];
      gradeLevel = gradeLevelControllers[i];
      schoolBis = schoolBisControllers[i];
      newDescriptions.add(
        Column(
          children: [
            const SizedBox(height: 16),

              // 3rd Row - Divider
              const Divider(),


              const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
              child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // First Column: Fixed width 600
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name*',
                              style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'), // Adjust font size as needed
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: 600,
                              height: 40,
                              child: TextField(
                                controller: name,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 8),
            
                        // Second Column: Fixed width 120
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Age*',
                              style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: 120,
                              height: 40,
                              child: TextField(
                                controller: ageSibling,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 8),
            
                        // Third Column: Expanded
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Grade Level/ Course/ Occupation*',
                                style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                height: 40,
                                child: TextField(
                                  controller: gradeLevel,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
            
                        // Fourth Column: Expanded
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'School/ Business Office*',
                                style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                height: 40,
                                child: TextField(
                                  controller: schoolBis,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      );
    }

    try {
      setState(() {
        siblings = newDescriptions;
      });
    } catch (e) {
      print('Error in putaway addItemDescription: $e');
    }
  }


  void updateQuantity() {
    try {
      setState(() {
        quantityReceived = int.tryParse(siblingQuantityController.text) ?? 0;
      });
    } catch (e) {
      print('Error in putaway updateQuantity: $e');
    }
  }


  @override
  void initState() {
    super.initState();
    //fetchLoaRequest();
    selectedGender =widget.formDetails![0]['db_admission_table']['sex'] ??'';
    fnameController.text=widget.formDetails![0]['db_admission_table']['first_name']??'';
    mnameController.text=widget.formDetails![0]['db_admission_table']['middle_name']??'';
    lnameController.text=widget.formDetails![0]['db_admission_table']['last_name']??'';
    schoolYearController.text=widget.formDetails![0]['db_admission_table']['school_year']??'';
    levelApplyingController.text=widget.formDetails![0]['db_admission_table']['level_applying_for']??'';
    dateController.text=widget.formDetails![0]['db_admission_table']['date_of_birth']??'';
    birthPlaceController.text=widget.formDetails![0]['db_admission_table']['place_of_birth']??'';
    religionController.text=widget.formDetails![0]['db_admission_table']['religion']??'';
    citizenshipController.text=widget.formDetails![0]['db_admission_table']['citizenship']??'';
    acrController.text=widget.formDetails![0]['db_admission_table']['acr_number']??'';
    addressController.text=widget.formDetails![0]['db_admission_table']['address']??'';
    postalController.text=widget.formDetails![0]['db_admission_table']['zip_postal_code']??'';
    contactController.text=widget.formDetails![0]['db_admission_table']['contact_no']??'';
    languageSpokenController.text=widget.formDetails![0]['db_admission_table']['language_dialect_spoken']??'';
    companionController.text=widget.formDetails![0]['db_admission_table']['usual_companion_at_home']??'';
    siblingQuantityController.text=widget.formDetails![0]['db_admission_table']['db_family_background_table'][0]['no_of_siblings'].toString()??'';
    DateTime dateOfBirth = DateTime.parse(dateController.text);
    DateTime today = DateTime.now();
    int age = today.year - dateOfBirth.year;

    for(int i=0; i<widget.formDetails![0]['db_admission_table']['db_family_background_table'][0]['db_sibling_table'].length;i++){
      var sibling = widget.formDetails![0]['db_admission_table']['db_family_background_table'][0]['db_sibling_table'][i];
      String sdate=sibling['sibling_bday'];
      DateTime siblingBday = DateTime.parse(sdate);
      int siblingAge = today.year - siblingBday.year;
      if (today.month < siblingBday.month || (today.month == siblingBday.month && today.day < siblingBday.day)) {
        siblingAge--;
      }
      nameControllers.add(TextEditingController());
      ageControllers.add(TextEditingController());
      gradeLevelControllers.add(TextEditingController());
      schoolBisControllers.add(TextEditingController());
      name = nameControllers[i];
      ageSibling=ageControllers[i];
      gradeLevel = gradeLevelControllers[i];
      schoolBis = schoolBisControllers[i];

      name.text='${sibling['sibling_first_name']} ${sibling['sibling_middle_name']} ${sibling['sibling_last_name']}';
      ageSibling.text=siblingAge.toString();
      gradeLevel.text=sibling['sibling_grade_course_occupation'];
      schoolBis.text=sibling['sibling_school_business'];
    }

  // Adjust for whether the birthday has passed this year or not
    if (today.month < dateOfBirth.month || (today.month == dateOfBirth.month && today.day < dateOfBirth.day)) {
      age--;
    }
    ageController.text=age.toString();
    updateQuantity();
    addItemDescription(1);
  }


  

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double baseWidth = 400;
    double baseHeight = 950;
    double widthScale = screenWidth / baseWidth;
    double heightScale = screenHeight / baseHeight;
    double scale = widthScale < heightScale ? widthScale : heightScale;






    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Page 1 content
            if (_currentPage == 1) ...[
             Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row 1
        Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Personal Data',
        style: TextStyle(
          fontFamily: 'Roboto-R',
          fontSize: 20 * scale,
        ),
      ),
      ElevatedButton(
        onPressed: () {
          // Handle Edit Application action
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffF5F7FB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12 * scale),
          ),
        ),
        child: Text(
          'Edit Application',
          style: TextStyle(
            fontFamily: 'Roboto-R',
            fontSize: 13 * scale,
          ),
        ),
      ),
    ],
        ),
        const SizedBox(height: 16),
    
    
    
    
    //SCHOOL YEAR || TEXTS
        Row(
    children: [
      Expanded(
        flex: 1,
        child: Text(
          'Level Applying For:',
          style: TextStyle(
            fontFamily: 'Roboto-R',
            fontSize: 11 * scale,
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Text(
          'School Year:',
          style: TextStyle(
            fontFamily: 'Roboto-R',
            fontSize: 11 * scale,
          ),
        ),
      ),
    ],
        ),
        const SizedBox(height: 8),
    
    
    
    
    
    //SCHOOL YEAR DROPDOWN || TEXTFIELD
        Row(
    children: [
      /*Expanded(
  flex: 1,
  child: SizedBox(
    height: 40, // Set the height to 20
    child: DropdownButtonFormField<String>(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Adjust padding
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8 * scale),
        ),
      ),
      items: const [
        DropdownMenuItem(value: 'Option 1', child: Text('Option 1', style: TextStyle(fontSize: 10))), // Adjust font size
        DropdownMenuItem(value: 'Option 2', child: Text('Option 2', style: TextStyle(fontSize: 10))), // Adjust font size
      ],
      onChanged: (value) {},
    ),
  ),
),*/

Expanded(
        flex: 1,
        child: SizedBox(
          height: 40,
          child: TextField(
            controller: levelApplyingController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8 * scale),
              ),
            ),
          ),
        ),
      ),

      const SizedBox(width: 8),
      Expanded(
        flex: 1,
        child: SizedBox(
          height: 40,
          child: TextField(
            controller: schoolYearController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8 * scale),
              ),
            ),
          ),
        ),
      ),
    ],
        ),
        const SizedBox(height: 16),
    
    
    
    
    //FULLNAME TEXT
        Text(
    'Full Name*',
    style: TextStyle(
      fontFamily: 'Roboto-R',
      fontSize: 11 * scale,
    ),
        ),
        const SizedBox(height: 8),
    
    
    
    
    //FULLNAME TEXTFIELDS
        Row(
    children: [
       Expanded(
        flex: 1,
        child: SizedBox(
          height: 40,
          child: TextField(
            controller: fnameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8 * scale),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        flex: 1,
        child: SizedBox(
          height: 40,
          child: TextField(
            controller: mnameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8 * scale),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        flex: 1,
        child: SizedBox(
          height: 40,
          child: TextField(
            controller: lnameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8 * scale),
              ),
            ),
          ),
        ),
      ),
    ],
        ),
        const SizedBox(height: 16),
    
      
    
    
    
    
    
      //CALENDAR ROW || TEXTS
        Row(
    children: [
      Expanded(
        child: Text(
          'Date of Birth*',
          style: TextStyle(
            fontFamily: 'Roboto-R',
            fontSize: 11 * scale,
          ),
        ),
      ),
      Expanded(
        child: Text(
          'Place of Birth*',
          style: TextStyle(
            fontFamily: 'Roboto-R',
            fontSize: 11 * scale,
          ),
        ),
      ),
      Expanded(
        child: Text(
          'Age*',
          style: TextStyle(
            fontFamily: 'Roboto-R',
            fontSize: 11 * scale,
          ),
        ),
      ),
    ],
        ),
        const SizedBox(height: 8),
    
    
    
    
    
    
    //CALENDAR ROW || FIELDS
        Row(
    children: [
    Expanded(
      child: SizedBox(
        height: 40,
        child: TextField(
          controller: dateController, // Use the controller to update the text
          readOnly: true, // Makes the TextField non-editable, so the calendar triggers the date picker
          decoration: InputDecoration(
            suffixIcon: IconButton(
        icon: const Icon(Icons.calendar_today), // Calendar icon
        onPressed: () async {
          // Show the date picker dialog
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(), // Initial date when the dialog opens
            firstDate: DateTime(1900), // First date allowed to be selected
            lastDate: DateTime(2101), // Last date allowed to be selected
          );
          if (pickedDate != null) {
            // Update the text field with the selected date
            setState(() {
              dateController.text = "${pickedDate.toLocal()}".split(' ')[0]; // Format the date as YYYY-MM-DD
            });
          }
        },
            ),
            border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8 * scale), // Scalable radius
            ),
          ),
        ),
      ),
    ),
    
      const SizedBox(width: 8),
      Expanded(
        flex: 1,
        child: SizedBox(
          height: 40,
          child: TextField(
            controller: birthPlaceController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8 * scale),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        flex: 1,
        child: SizedBox(
          height: 40,
          child: TextField(
            controller: ageController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8 * scale),
              ),
            ),
          ),
        ),
      ),
    ],
        ),
        const SizedBox(height: 16),
    
    
    
    
    //SEX ROW | TEXTS
        Row(
    children: [
      Expanded(
        child: Text(
          'Sex*',
          style: TextStyle(
            fontFamily: 'Roboto-R',
            fontSize: 11 * scale,
          ),
        ),
      ),
      Expanded(
        child: Text(
          'Religion*',
          style: TextStyle(
            fontFamily: 'Roboto-R',
            fontSize: 11 * scale,
          ),
        ),
      ),
      Expanded(
        child: Text(
          'Citizenship*',
          style: TextStyle(
            fontFamily: 'Roboto-R',
            fontSize: 11 * scale,
          ),
        ),
      ),
    ],
        ),
        const SizedBox(height: 8),
    
    
    
    
    
    //RADIO BUTTON ROW
    Row(
      children: [
        // First Column: Radio Buttons
        Expanded(
    flex: 1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Radio<String>(
                    value: 'Male',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        if(selectedGender.toLowerCase()==value!.toLowerCase()){
                          selectedGender = value;
                        }
                      });
                    },
                  ),
                  Text(
                    'Male',
                    style: TextStyle(fontSize: 13 * scale),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio<String>(
                    value: 'Female',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                         if(selectedGender.toLowerCase()==value!.toLowerCase()){
                          selectedGender = value;
                        }
                      });
                    },
                  ),
                  Text(
                    'Female',
                    style: TextStyle(fontSize: 13 * scale),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
        ),
    
        // Second Column: Dropdown 1
       /* Expanded(
    flex: 1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    
        SizedBox(
          height: 40,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8 * scale),
              ),
            ),
            items: const [
              DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
              DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),
            ],
            onChanged: (value) {
              setState(() {
                dropdown1Value = value!;
              });
            },
          ),
        ),
      ],
    ),
        ),*/
        Expanded(
        flex: 1,
        child: SizedBox(
          height: 40,
          child: TextField(
            controller: religionController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8 * scale),
              ),
            ),
          ),
        ),
      ),
    
        const SizedBox(width: 8),

        Expanded(
        flex: 1,
        child: SizedBox(
          height: 40,
          child: TextField(
            controller: citizenshipController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8 * scale),
              ),
            ),
          ),
        ),
      ),
    
        // Third Column: Dropdown 2
        /*Expanded(
    flex: 1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    
        SizedBox(
          height: 40,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8 * scale),
              ),
            ),
            items: const [
              DropdownMenuItem(value: 'Option A', child: Text('Option A')),
              DropdownMenuItem(value: 'Option B', child: Text('Option B')),
            ],
            onChanged: (value) {
              setState(() {
                dropdown2Value = value!;
              });
            },
          ),
        ),
      ],
    ),
        ),*/
      ],
    ),
    
    
    
    
    
    
        const SizedBox(height: 16),
    
    
    
    
    //ACR NUMBER
        Row(
    children: [
      Expanded(
        child: Text(
          'ACR Number (For Foreign Learners Only)',
          style: TextStyle(
            fontFamily: 'Roboto-R',
            fontSize: 11 * scale,
          ),
        ),
      ),
      
    ],
        ),
        const SizedBox(height: 8),
    
        Row(
    children: [
       Expanded(
        flex: 1,
        child: SizedBox(
          height: 40,
          child: TextField(
            controller: acrController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8 * scale),
              ),
            ),
          ),
        ),
      ),
    ],
        ),
    
    
    
    
    
    
    
    
        const SizedBox(height: 16),
    
    
    
    
    //ADDRESS
        Row(
    children: [
      Expanded(
        child: Text(
          'Address*',
          style: TextStyle(
            fontFamily: 'Roboto-R',
            fontSize: 11 * scale,
          ),
        ),
      ),
      
    ],
        ),
        const SizedBox(height: 8),
    
        Row(
    children: [
      Expanded(
        flex: 1,
        child: SizedBox(
          height: 40,
          child: TextField(
            controller: addressController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8 * scale),
              ),
            ),
          ),
        ),
      ),
    ],
        ),
    
    
    
    
       const SizedBox(height: 16),
    
    
    
    
    //ZIP POSTAL ROW || TEXTS
        Row(
    children: [
      Expanded(
        flex: 1,
        child: Text(
          'Zip/Postal Code*',
          style: TextStyle(
            fontFamily: 'Roboto-R',
            fontSize: 11 * scale,
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Text(
          'Contact No.*',
          style: TextStyle(
            fontFamily: 'Roboto-R',
            fontSize: 11 * scale,
          ),
        ),
      ),
    ],
        ),
        const SizedBox(height: 8),
    
    
    
    
    
    //ZIP POSTAL ROW || TEXTFIELD
        Row(
    children: [
      Expanded(
        flex: 1,
        child: SizedBox(
          height: 40,
          child: TextField(
            controller: postalController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8 * scale),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        flex: 1,
        child: SizedBox(
          height: 40,
          child: TextField(
            controller: contactController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8 * scale),
              ),
            ),
          ),
        ),
      ),
    ],
        ),
    
    
    
    
    
    
    
    
    
    const SizedBox(height: 16),
    
    
    
    
    //LANGUAGES ROW || TEXTS
        Row(
    children: [
      Expanded(
        flex: 1,
        child: Text(
          'Languages/Dialects Spoken*',
          style: TextStyle(
            fontFamily: 'Roboto-R',
            fontSize: 11 * scale,
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Text(
          'Usual Companion at Home*',
          style: TextStyle(
            fontFamily: 'Roboto-R',
            fontSize: 11 * scale,
          ),
        ),
      ),
    ],
        ),
        const SizedBox(height: 8),
    
    
    
    
    
    //LANGAUAGES ROW || TEXTFIELD
        Row(
    children: [
      /*Expanded(
        flex: 1,
        child: SizedBox(
          height: 40,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8 * scale),
              ),
            ),
            items: const [
              DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
              DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),
            ],
            onChanged: (value) {},
          ),
        ),
      ),*/
      Expanded(
        flex: 1,
        child: SizedBox(
          height: 40,
          child: TextField(
            controller: languageSpokenController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8 * scale),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        flex: 1,
        child: SizedBox(
          height: 40,
          child: TextField(
            controller: companionController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8 * scale),
              ),
            ),
          ),
        ),
      ),
    ],
        ),
    
    
    const SizedBox(height: 30),
    
        // Centered Next Button
        Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
  onPressed: _nextPage, // Switch to the second page
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF012169), // Button color
    fixedSize: const Size(188, 35), // Width and height
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // Radius
    ),
  ),
  child: const Text(
    'Next',
    style: TextStyle(
      fontSize: 13, // Text size
      fontFamily: 'Roboto-R', // Font family
      color: Colors.white, // Text color
    ),
  ),
),

    ],
        ),
      ],
    ),
            ],

























































//PAGE 2 CONTENTS
            if (_currentPage == 2) ...[
              Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Family Background',
        style: TextStyle(
          fontFamily: 'Roboto-R',
          fontSize: 20 * scale,
        ),
      ),
      ElevatedButton(
        onPressed: () {
          // Handle Edit Application action
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffF5F7FB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12 * scale),
          ),
        ),
        child: Text(
          'Edit Application',
          style: TextStyle(
            fontFamily: 'Roboto-R',
            fontSize: 13 * scale,
          ),
        ),
      ),
    ],
        ),
        const SizedBox(height: 16),

              // 2nd Row - Number of siblings dropdown field
              /*SizedBox(
  width: 420,
  child: SizedBox(
    height: 40,
    child: DropdownButtonFormField<String>(
      items: ['1', '2', '3', '4', '5']
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              ))
          .toList(),
      onChanged: (value) {},
      decoration: InputDecoration(
        labelText: 'Number of Siblings',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  ),
),*/
SizedBox(
  width: 420,
  height: 40,
  child: TextField(
    controller: siblingQuantityController,
    keyboardType: TextInputType.number,  // To handle numeric input
    decoration: InputDecoration(
      labelText: "Number of Siblings", // Optional label
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    onChanged: (String value) {
      updateQuantity();
      addItemDescription(scale);
    },
  ),
),


Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children:
 
 [
                Container(
                  
                  height: screenHeight * 0.45,
                  width: screenWidth * 0.72,
                  padding: const EdgeInsets.all(0),
                  //decoration: boxdecoration.copyWith(borderRadius: BorderRadius.circular(15)),
                  child: ListView.builder(
                    itemCount: siblings.length,
                    itemBuilder: (context, index) {
                      return siblings[index];
                    },
                  ),
                ),
              ]),





              // 6th Row - Name, Age, Grade, and School text fields
              
              const SizedBox(height: 75),

              // Centered Back and Next buttons for the second page
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    ElevatedButton(
      onPressed: _previousPage, // Toggle to go back to the first page
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFD3D3D3), // Button color
        fixedSize: const Size(188, 35), // Width and height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Radius
        ),
      ),
      child: const Text(
        'Back',
        style: TextStyle(
          fontSize: 13, // Text size
          fontFamily: 'Roboto-R', // Font family
          color: Colors.black, // Text color
        ),
      ),
    ),
  ],
),
const SizedBox(height: 8), // Add some space between buttons
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    ElevatedButton(
      onPressed: _nextPage, // Toggle to the next page
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF012169), // Button color
        fixedSize: const Size(188, 35), // Width and height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Radius
        ),
      ),
      child: const Text(
        'Next',
        style: TextStyle(
          fontSize: 13, // Text size
          fontFamily: 'Roboto-R', // Font family
          color: Colors.white, // Text color
        ),
      ),
    ),
  ],
),

            ],














































//PAGE 3 CONTENT
            if (_currentPage == 3) ...[
              // Add content for the third page here
              Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Family Background',
        style: TextStyle(
          fontFamily: 'Roboto-R',
          fontSize: 20 * scale,
        ),
      ),
      ElevatedButton(
        onPressed: () {
          // Handle Edit Application action
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffF5F7FB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12 * scale),
          ),
        ),
        child: Text(
          'Edit Application',
          style: TextStyle(
            fontFamily: 'Roboto-R',
            fontSize: 13 * scale,
          ),
        ),
      ),
    ],
        ),
        Text(
        'Please enter Parents Information',
        style: TextStyle(
          fontFamily: 'Roboto-R',
          fontSize: 13 * scale,
        ),
      ),

        const SizedBox(height: 16),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    // First Column: Fixed width 600
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'Father’s Full Name*',
          style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'), // Adjust font size as needed
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 600,
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    ),
    const SizedBox(width: 8),

    // Second Column: Fixed width 120
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'Age*',
          style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 120,
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    ),
    const SizedBox(width: 8),

    // Third Column: Expanded
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Educational Attainment*',
            style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    const SizedBox(width: 8),

    // Fourth Column: Expanded
Expanded(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Employment Status*',
        style: TextStyle(
          fontSize: 11 * scale,
          fontFamily: 'Roboto-R',
        ),
      ),
      const SizedBox(height: 8),
      SizedBox(
        height: 40,
        child: DropdownButtonFormField<String>(
          items: const [
            DropdownMenuItem(
              value: 'Employed',
              child: Text('Employed'),
            ),
            DropdownMenuItem(
              value: 'Unemployed',
              child: Text('Unemployed'),
            ),
            DropdownMenuItem(
              value: 'Self-employed',
              child: Text('Self-employed'),
            ),
            DropdownMenuItem(
              value: 'Student',
              child: Text('Student'),
            ),
          ],
          onChanged: (value) {
            // Handle selection change
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ),
      ),
    ],
  ),
),

  ],
),
              const SizedBox(height: 16),


Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Employed at*',
            style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    const SizedBox(width: 8),

    // Fourth Column: Expanded
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Office Address*',
            style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ],
),
              const SizedBox(height: 16),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Contact No.*',
            style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    const SizedBox(width: 8),

    // Fourth Column: Expanded
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Position*',
            style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    ),



        const SizedBox(width: 8),

    // Fourth Column: Expanded
Expanded(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Salary Scale*',
        style: TextStyle(
          fontSize: 11 * scale,
          fontFamily: 'Roboto-R',
        ),
      ),
      const SizedBox(height: 8),
      SizedBox(
        height: 40,
        child: DropdownButtonFormField<String>(
          items: const [
            DropdownMenuItem(
              value: 'Below 20,000',
              child: Text('Below 20,000'),
            ),
            DropdownMenuItem(
              value: '20,000 - 50,000',
              child: Text('20,000 - 50,000'),
            ),
            DropdownMenuItem(
              value: '50,000 - 100,000',
              child: Text('50,000 - 100,000'),
            ),
            DropdownMenuItem(
              value: 'Above 100,000',
              child: Text('Above 100,000'),
            ),
          ],
          onChanged: (value) {
            // Handle the selected value here
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          hint: Text(
            'Select Salary Scale',
            style: TextStyle(
              fontSize: 11 * scale,
              fontFamily: 'Roboto-R',
              color: Colors.grey,
            ),
          ),
        ),
      ),
    ],
  ),
),

  ],
),

              const SizedBox(height: 16),

              // 5th Row - Divider
              const Divider(),

              const SizedBox(height: 16),



Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    // First Column: Fixed width 600
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'Mother’s Full Maiden Name*',
          style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'), // Adjust font size as needed
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 600,
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    ),
    const SizedBox(width: 8),

    // Second Column: Fixed width 120
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'Age*',
          style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 120,
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    ),
    const SizedBox(width: 8),

    // Third Column: Expanded
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Educational Attainment*',
            style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    const SizedBox(width: 8),

    // Fourth Column: Expanded
Expanded(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Employment Status*',
        style: TextStyle(
          fontSize: 11 * scale,
          fontFamily: 'Roboto-R',
        ),
      ),
      const SizedBox(height: 8),
      SizedBox(
        height: 40,
        child: DropdownButtonFormField<String>(
          items: const [
            DropdownMenuItem(
              value: 'Employed',
              child: Text('Employed'),
            ),
            DropdownMenuItem(
              value: 'Unemployed',
              child: Text('Unemployed'),
            ),
            DropdownMenuItem(
              value: 'Self-employed',
              child: Text('Self-employed'),
            ),
            DropdownMenuItem(
              value: 'Student',
              child: Text('Student'),
            ),
          ],
          onChanged: (value) {
            // Handle selection change
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ),
      ),
    ],
  ),
),

  ],
),
              const SizedBox(height: 16),


Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Employed at*',
            style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    const SizedBox(width: 8),

    // Fourth Column: Expanded
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Office Address*',
            style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ],
),
              const SizedBox(height: 16),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Contact No.*',
            style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    const SizedBox(width: 8),

    // Fourth Column: Expanded
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Position*',
            style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    ),



        const SizedBox(width: 8),

    // Fourth Column: Expanded
Expanded(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Salary Scale*',
        style: TextStyle(
          fontSize: 11 * scale,
          fontFamily: 'Roboto-R',
        ),
      ),
      const SizedBox(height: 8),
      SizedBox(
        height: 40,
        child: DropdownButtonFormField<String>(
          items: const [
            DropdownMenuItem(
              value: 'Below 20,000',
              child: Text('Below 20,000'),
            ),
            DropdownMenuItem(
              value: '20,000 - 50,000',
              child: Text('20,000 - 50,000'),
            ),
            DropdownMenuItem(
              value: '50,000 - 100,000',
              child: Text('50,000 - 100,000'),
            ),
            DropdownMenuItem(
              value: 'Above 100,000',
              child: Text('Above 100,000'),
            ),
          ],
          onChanged: (value) {
            // Handle the selected value here
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          hint: Text(
            'Select Salary Scale',
            style: TextStyle(
              fontSize: 11 * scale,
              fontFamily: 'Roboto-R',
              color: Colors.grey,
            ),
          ),
        ),
      ),
    ],
  ),
),

  ],
),



const SizedBox(height: 97),

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    ElevatedButton(
      onPressed: _previousPage, // Toggle to go back to the first page
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFD3D3D3), // Button color
        fixedSize: const Size(188, 35), // Width and height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Radius
        ),
      ),
      child: const Text(
        'Back',
        style: TextStyle(
          fontSize: 13, // Text size
          fontFamily: 'Roboto-R', // Font family
          color: Colors.black, // Text color
        ),
      ),
    ),
  ],
),
const SizedBox(height: 8), // Add some space between buttons
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    ElevatedButton(
      onPressed: _nextPage, // Toggle to the next page
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF012169), // Button color
        fixedSize: const Size(188, 35), // Width and height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Radius
        ),
      ),
      child: const Text(
        'Next',
        style: TextStyle(
          fontSize: 13, // Text size
          fontFamily: 'Roboto-R', // Font family
          color: Colors.white, // Text color
        ),
      ),
    ),
  ],
),

            ],


































//PAGE 4 CONTENT
            if (_currentPage == 4) ...[
              // Add content for the third page here
              Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Family Background',
        style: TextStyle(
          fontFamily: 'Roboto-R',
          fontSize: 20 * scale,
        ),
      ),
      ElevatedButton(
        onPressed: () {
          // Handle Edit Application action
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffF5F7FB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12 * scale),
          ),
        ),
        child: Text(
          'Edit Application',
          style: TextStyle(
            fontFamily: 'Roboto-R',
            fontSize: 13 * scale,
          ),
        ),
      ),
    ],
        ),
        Text(
        'Please enter Guardian Information',
        style: TextStyle(
          fontFamily: 'Roboto-R',
          fontSize: 13 * scale,
        ),
      ),

        const SizedBox(height: 16),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    // First Column: Fixed width 600
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'Guardian’s Full Name',
          style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'), // Adjust font size as needed
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 600,
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    ),
    const SizedBox(width: 8),

    // Second Column: Fixed width 120
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'Age*',
          style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 120,
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    ),
    const SizedBox(width: 8),

    // Third Column: Expanded
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Educational Attainment*',
            style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    const SizedBox(width: 8),

    // Fourth Column: Expanded
Expanded(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Employment Status*',
        style: TextStyle(
          fontSize: 11 * scale,
          fontFamily: 'Roboto-R',
        ),
      ),
      const SizedBox(height: 8),
      SizedBox(
        height: 40,
        child: DropdownButtonFormField<String>(
          items: const [
            DropdownMenuItem(
              value: 'Employed',
              child: Text('Employed'),
            ),
            DropdownMenuItem(
              value: 'Unemployed',
              child: Text('Unemployed'),
            ),
            DropdownMenuItem(
              value: 'Self-employed',
              child: Text('Self-employed'),
            ),
            DropdownMenuItem(
              value: 'Student',
              child: Text('Student'),
            ),
          ],
          onChanged: (value) {
            // Handle selection change
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ),
      ),
    ],
  ),
),

  ],
),
              const SizedBox(height: 16),


Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Employed at*',
            style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    const SizedBox(width: 8),

    // Fourth Column: Expanded
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Office Address*',
            style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ],
),
              const SizedBox(height: 16),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Contact No.*',
            style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    const SizedBox(width: 8),

    // Fourth Column: Expanded
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Position*',
            style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    ),



        const SizedBox(width: 8),

    // Fourth Column: Expanded
Expanded(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Salary Scale*',
        style: TextStyle(
          fontSize: 11 * scale,
          fontFamily: 'Roboto-R',
        ),
      ),
      const SizedBox(height: 8),
      SizedBox(
        height: 40,
        child: DropdownButtonFormField<String>(
          items: const [
            DropdownMenuItem(
              value: 'Below 20,000',
              child: Text('Below 20,000'),
            ),
            DropdownMenuItem(
              value: '20,000 - 50,000',
              child: Text('20,000 - 50,000'),
            ),
            DropdownMenuItem(
              value: '50,000 - 100,000',
              child: Text('50,000 - 100,000'),
            ),
            DropdownMenuItem(
              value: 'Above 100,000',
              child: Text('Above 100,000'),
            ),
          ],
          onChanged: (value) {
            // Handle the selected value here
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          hint: Text(
            'Select Salary Scale',
            style: TextStyle(
              fontSize: 11 * scale,
              fontFamily: 'Roboto-R',
              color: Colors.grey,
            ),
          ),
        ),
      ),
    ],
  ),
),

  ],
),

              const SizedBox(height: 16),

              // 5th Row - Divider
              const Divider(),

              const SizedBox(height: 16),



Row(
  children: [
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Relationship to the Child (If Guardian)*',
            style: TextStyle(
              fontSize: 11 * scale,
              fontFamily: 'Roboto-R',
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(
                  value: 'Parent',
                  child: Text('Parent'),
                ),
                DropdownMenuItem(
                  value: 'Guardian',
                  child: Text('Guardian'),
                ),
                DropdownMenuItem(
                  value: 'Relative',
                  child: Text('Relative'),
                ),
                DropdownMenuItem(
                  value: 'Other',
                  child: Text('Other'),
                ),
              ],
              onChanged: (value) {
                // Handle selection change
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              hint: Text(
                'Select Relationship',
                style: TextStyle(
                  fontSize: 11 * scale,
                  fontFamily: 'Roboto-R',
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ],
),

const SizedBox(height: 16,),


Row(
  children: [
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Parent Status*',
            style: TextStyle(
              fontSize: 11 * scale,
              fontFamily: 'Roboto-R',
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(
                  value: 'Single',
                  child: Text('Single'),
                ),
                DropdownMenuItem(
                  value: 'Married',
                  child: Text('Married'),
                ),
                DropdownMenuItem(
                  value: 'Divorced',
                  child: Text('Divorced'),
                ),
                DropdownMenuItem(
                  value: 'Widowed',
                  child: Text('Widowed'),
                ),
              ],
              onChanged: (value) {
                // Handle selection change
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              hint: Text(
                'Select Parent Status',
                style: TextStyle(
                  fontSize: 11 * scale,
                  fontFamily: 'Roboto-R',
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ],
),


const SizedBox(height: 16,),

    Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'Civil Wedding*',
                style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
              ),
              const SizedBox(height: 8),
              SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
            ],
          ),
        ),
      ],
    ),




    const SizedBox(height: 16,),

        Row(
          children: [
            Expanded(
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'Church Name*',
                style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
              ),
              const SizedBox(height: 8),
              SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
            ],
                  ),
                ),
          ],
        ),



const SizedBox(height: 16,),


Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    ElevatedButton(
      onPressed: (){
        widget.onNextPressed(false);
        _previousPage();
      }, // Toggle to go back to the first page
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFD3D3D3), // Button color
        fixedSize: const Size(188, 35), // Width and height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Radius
        ),
      ),
      child: const Text(
        'Back',
        style: TextStyle(
          fontSize: 13, // Text size
          fontFamily: 'Roboto-R', // Font family
          color: Colors.black, // Text color
        ),
      ),
    ),
  ],
),
const SizedBox(height: 8), // Add some space between buttons
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    ElevatedButton(
      onPressed: (){
        
         widget.onNextPressed(true);
        _nextPage();
      }, // Toggle to the next page
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF012169), // Button color
        fixedSize: const Size(188, 35), // Width and height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Radius
        ),
      ),
      child: const Text(
        'Next',
        style: TextStyle(
          fontSize: 13, // Text size
          fontFamily: 'Roboto-R', // Font family
          color: Colors.white, // Text color
        ),
      ),
    ),
  ],
    ),


            ],























//PAGE 5 CONTENT
            if (_currentPage == 5) ...[
              // Add content for the third page here
              Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Special Concerns',
        style: TextStyle(
          fontFamily: 'Roboto-R',
          fontSize: 20 * scale,
        ),
      ),
      ElevatedButton(
        onPressed: () {
          // Handle Edit Application action
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffF5F7FB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12 * scale),
          ),
        ),
        child: Text(
          'Edit Application',
          style: TextStyle(
            fontFamily: 'Roboto-R',
            fontSize: 13 * scale,
          ),
        ),
      ),
    ],
        ),
              const SizedBox(height: 16),

                  Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'Special Concerns',
                style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
              ),
              const SizedBox(height: 8),
              SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
            ],
          ),
        ),
      ],
    ),
              const SizedBox(height: 16),

                  Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'Medical/ Developmental/ Psychological Condition',
                style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
              ),
              const SizedBox(height: 8),
              SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
            ],
          ),
        ),
      ],
    ),

const SizedBox(height: 16),

                  Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'Medication',
                style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
              ),
              const SizedBox(height: 8),
              SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
            ],
          ),
        ),

const SizedBox(width: 8,),
        
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          'Intervention',
                          style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
                      ],
                    ),
                  ),
      ],
    ),

const SizedBox(height: 16),


                  Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'Attach Supporting Document',
                style: TextStyle(fontSize: 11 * scale, fontFamily: 'Roboto-R'),
              ),
              const SizedBox(height: 8),
              SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
            ],
          ),
        ),
      ],
    ),

    


const SizedBox(height: 350),



              Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    ElevatedButton(
      onPressed: (){
         widget.onNextPressed(false);
        _previousPage();}, // Toggle to go back to the first page
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFD3D3D3), // Button color
        fixedSize: const Size(188, 35), // Width and height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Radius
        ),
      ),
      child: const Text(
        'Back',
        style: TextStyle(
          fontSize: 13, // Text size
          fontFamily: 'Roboto-R', // Font family
          color: Colors.black, // Text color
        ),
      ),
    ),
  ],
),
              const SizedBox(height: 8), // Add some space between buttons

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     ElevatedButton(
              //       onPressed: () {
              //         // Handle Submit action
              //       },
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor: Colors.green, // Green button color
              //       ),
              //       child: const Text('Submit'),
              //     ),
              //   ],
              // ),
            ],





            
          ],
        ),
      ),
    );
  }
}
