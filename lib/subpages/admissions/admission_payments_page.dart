import 'package:cdbs_admin/bloc/admission_bloc/admission_bloc.dart';
import 'package:cdbs_admin/bloc/auth/auth_bloc.dart';
import 'package:cdbs_admin/class/admission_forms.dart';
import 'package:cdbs_admin/shared/api.dart';
import 'package:cdbs_admin/subpages/admissions/admission_payments_page2.dart';
import 'package:cdbs_admin/subpages/admissions/admission_requirements_page2.dart';
import 'package:cdbs_admin/subpages/landing_page.dart';
import 'package:cdbs_admin/subpages/s1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdmissionPaymentsPage extends StatefulWidget {
  const AdmissionPaymentsPage({super.key});

  @override
  State<AdmissionPaymentsPage> createState() => _AdmissionPaymentsPageState();
}

class _AdmissionPaymentsPageState extends State<AdmissionPaymentsPage> {
List<bool> checkboxStates = List.generate(10, (_) => false);

  int _selectedAction = 0; // 0: Default, 1: View, 2: Reminder, 3: Deactivate
  late Stream<List<Map<String, dynamic>>> admissionForms;
  List<Map<String, dynamic>> requests = [];
  List<Map<String, dynamic>> filteredRequest = [];
  late ApiService _apiService;
  List<Map<String, dynamic>>? formDetails;

  Future<void> fetchFormDetails(int id) async {
    try {
      // Perform the async operation to get the data
      List<Map<String, dynamic>> details = await ApiService(apiUrl).getDetailsById(
        id,
        supabaseUrl,
        supabaseKey,
      );

      // Once data is fetched, call setState to update the UI
      if (mounted) {
        setState(() {
          formDetails = details;
        });
      }
    } catch (e) {
      print("Error fetching form details: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _apiService = ApiService(apiUrl); // Replace with your actual API URL
    admissionForms = _apiService.streamPaymentForms(supabaseUrl, supabaseKey);
    // Initialize the service with your endpoint
  }

  
String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy HH:mm');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double baseWidth = 400;
    double baseHeight = 800;
    double widthScale = screenWidth / baseWidth;
    double heightScale = screenHeight / baseHeight;
    double scale = widthScale < heightScale ? widthScale : heightScale;

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LandingPage(),
              ),
              (route) => false,
            );
          }
        },
        builder: (context, authState) {
          if (authState is AuthLoading) {
            return const Center(
              // Center the spinner when loading
              child: SpinKitCircle(
                color: Color(0xff13322B), // Change the color as needed
                size: 50.0, // Adjust size as needed
              ),
            );
          } else if (authState is AuthSuccess) {
            return StreamBuilder<List<Map<String, dynamic>>>(
              stream: admissionForms,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
              // Center the spinner when loading
                    child: SpinKitCircle(
                      color: Color(0xff13322B), // Change the color as needed
                      size: 50.0, // Adjust size as needed
                    ),
                  );
                }
                requests = snapshot.data ?? []; // Use the data from the snapshot
                print(requests);
                filteredRequest = requests;

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 40),
  child: Column(
    children: [
      // Check if _selectedAction == 0 to show the default content

        // Header and Search Bar
        Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Admissions',
            style: TextStyle(
              color: const Color(0xff222222),
              fontFamily: "Roboto-R",
              fontSize: 32 * scale,
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      const Divider(
        thickness: 2,
        color: Color(0XFF222222),
      ),

      if (_selectedAction == 0) _buildDefaultContent(scale), // Default content
      if (_selectedAction == 1) _buildViewContent(scale, formDetails!, authState.uid), // View content
      if (_selectedAction == 2) _buildReminderContent(scale), // Reminder content
      if (_selectedAction == 3) _buildDeactivateContent(scale),
      if (_selectedAction == 4) _buildDeactivateContent(scale),
      if (_selectedAction == 5) _buildDeactivateContent(scale),
      if (_selectedAction == 0) ...[



      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Payments',
            style: TextStyle(
              color: const Color(0xff222222),
              fontFamily: "Roboto-L",
              fontSize: 20 * scale,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 226 * scale,
            height: 32 * scale,
            child: TextField(
              decoration: InputDecoration(
                hintText: '',
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.grey, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.blue, width: 1),
                ),
                prefixIcon: InkWell(
                  onTap: () {
                    print("Search icon tapped");
                  },
                  child: Icon(
                    Icons.search,
                    size: 20 * scale,
                    color: Colors.grey,
                  ),
                ),
              ),
              style: TextStyle(fontSize: 14 * scale),
            ),
          ),
        ],
      ),
      const SizedBox(height: 40),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              'Application ID',
              style: TextStyle(fontSize: 14 * scale, fontFamily: 'Roboto-L'),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Applicant Name',
              style: TextStyle(fontSize: 14 * scale, fontFamily: 'Roboto-L'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Handled By',
              style: TextStyle(fontSize: 14 * scale, fontFamily: 'Roboto-L'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Status',
              style: TextStyle(fontSize: 14 * scale, fontFamily: 'Roboto-L'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Date Created',
              style: TextStyle(fontSize: 14 * scale, fontFamily: 'Roboto-L'),
            ),
          ),
          const Expanded(flex: 1, child: SizedBox.shrink()),
        ],
      ),
      const Divider(color: Colors.grey, thickness: 1),
      Expanded(
        child: ListView.builder(
                itemCount: filteredRequest.length,
                itemBuilder: (context, index) {
                  final request = filteredRequest[index];
                  final fullName = '${request['db_admission_table']['first_name']} ${request['db_admission_table']['last_name']}';
                  final processBy = request['db_admission_table']['db_admission_form_handler_table'].isNotEmpty
    ? '${request['db_admission_table']['db_admission_form_handler_table'][0]['db_admin_table']['first_name']} ${request['db_admission_table']['db_admission_form_handler_table'][0]['db_admin_table']['last_name']}'
    : '---';

                  String dateCreatedString = request['db_admission_table']['created_at'];
                  DateTime dateCreated = DateTime.parse(dateCreatedString);
                  String formattedDate = formatDate(dateCreated);

                  String stat= request['db_admission_table']['admission_status'];
                  bool isRequired= request['db_admission_table']['is_all_required_file_uploaded'];
                  bool isPaid= request['db_admission_table']['is_paid'];

            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Checkbox(
                                  value: checkboxStates[index],
                                  onChanged: (value) {
                                    setState(() {
                                      checkboxStates[index] = value ?? false;
                                    });
                                  },
                                  activeColor: const Color(0XFF012169), // Set the active color to pink
                                ),
                                Text(
                                  request['admission_id'].toString(),
                                  style: TextStyle(fontSize: 12 * scale),
                                ),
                              ],
                            ),
                          ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        fullName,
                        style: TextStyle(fontFamily: 'Roboto-R', fontSize: 14 * scale),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        processBy,
                        style: TextStyle(fontFamily: 'Roboto-R', fontSize: 14 * scale),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(!isPaid?stat=='complete' && isRequired?'PENDING':stat.toUpperCase():'COMPLETE',
                        style: TextStyle(fontFamily: 'Roboto-R', fontSize: 14 * scale),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        formattedDate,
                        style: TextStyle(fontFamily: 'Roboto-R', fontSize: 14 * scale),
                      ),
                    ),
                      // Other table cells...
                      Expanded(
                        flex: 1,
                        child: PopupMenuButton<int>(
                          icon: const Icon(Icons.more_vert),
                          onSelected: (value) async {
                            List<Map<String, dynamic>> members = await ApiService(apiUrl).getDetailsById(request['admission_id'], supabaseUrl, supabaseKey);
                                     if(members.isNotEmpty){
                                        setState(()  {
                                          formDetails=members;
                                          _selectedAction = value; // Change the selected action
                                        });

                                        if(!request['db_admission_table']['is_paid']){
                                          try {
                                            final response = await http.post(
                                              Uri.parse('$apiUrl/api/admin/update_admission'),
                                              headers: {
                                                'Content-Type': 'application/json',
                                                'supabase-url': supabaseUrl,
                                                'supabase-key': supabaseKey,
                                              },
                                              body: json.encode({
                                                'admission_id': request['admission_id'],
                                                'admission_status':'in review',  // Send customer_id in the request body
                                                'user_id':authState.uid
                                              }),
                                            );

                                            if (response.statusCode == 200) {
                                              final responseBody = jsonDecode(response.body);
                                            } else {
                                              // Handle failure
                                              final responseBody = jsonDecode(response.body);
                                              print('Error: ${responseBody['error']}');
                                            }
                                          } catch (error) {
                                            // Handle error (e.g., network error)
                                            print('Error: $error');
                                          }
                                        }
                                     }
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: Row(
                                children: [
                                  const Icon(Icons.visibility, color: Colors.black),
                                  SizedBox(width: 8 * scale),
                                  Text("VIEW", style: TextStyle(fontSize: 16 * scale)),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: Row(
                                children: [
                                  const Icon(Icons.notifications, color: Colors.black),
                                  SizedBox(width: 8 * scale),
                                  Text("REMINDER", style: TextStyle(fontSize: 16 * scale)),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 3,
                              child: Row(
                                children: [
                                  const Icon(Icons.block, color: Colors.black),
                                  SizedBox(width: 8 * scale),
                                  Text("DEACTIVATE", style: TextStyle(fontSize: 16 * scale)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.grey, thickness: 1),
                ],
              );
            },
          ),
        ),
      ],
    ],
  ),
);
              }
            );
          }
          return Container();
        }
      )
    );
  }

  // Build content for each action (VIEW, REMINDER, DEACTIVATE)
  Widget _buildViewContent(double scale, List<Map<String, dynamic>> details, int userId) {
    return Container(
  padding: const EdgeInsets.all(16),
  child: Column(
    children: [
      // Back button with left arrow and "Back" text
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () {
              setState(() {
                _selectedAction = 0; // Go back to default content
              });
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            label: Text(
              "Back",
              style: TextStyle(color: Colors.black, fontFamily: 'Roboto-R', fontSize: 12 * scale),
            ),
          ),
        ],
      ),
      
      // Adding AdmissionApplicationsPage2 below the buttons
       AdmissionPaymentsPage2(formDetails: details, onNextPressed: (bool isClicked) {
         context.read<AdmissionBloc>().add(MarkAsCompleteClicked(isClicked));
       },userId: userId),
    ],
  ),
);



  }



  

  Widget _buildReminderContent(double scale) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'REMINDER content goes here.',
            style: TextStyle(fontSize: 18 * scale),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _selectedAction = 0; // Go back to default content
              });
            },
            child: const Text("Go Back"),
          ),
        ],
      ),
    );
  }

  Widget _buildDeactivateContent(double scale) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'DEACTIVATE content goes here.',
            style: TextStyle(fontSize: 18 * scale),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _selectedAction = 0; // Go back to default content
              });
            },
            child: const Text("Go Back"),
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultContent(double scale) {
    return Container(
      // padding: const EdgeInsets.all(16),
      // child: Text(
      //   '',
      //   style: TextStyle(fontSize: 18 * scale),
      // ),
    );
  }
}

