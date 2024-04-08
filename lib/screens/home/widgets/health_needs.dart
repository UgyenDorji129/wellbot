// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HealthNeeds extends StatelessWidget {
  const HealthNeeds({super.key});
  

  @override
  Widget build(BuildContext context) {
    List<CustomIcon> customIcons = [
      CustomIcon(name: "Appointment", icon: 'assets/appointment.png'),
      CustomIcon(name: "Hospital", icon: 'assets/hospital.png'),
      CustomIcon(name: "Medicines", icon: 'assets/virus.png'),
      CustomIcon(name: "Medical Report", icon: 'assets/more.png'),
    ];
    
    List<CustomIcon> specialisedCared = [
      CustomIcon(name: "   Diabetes    ", icon: 'assets/blood.png'),
      CustomIcon(name: "Dental", icon: 'assets/tooth.png'),
      CustomIcon(name: "Insured", icon: 'assets/insurance.png'),
      CustomIcon(name: "AI Health Care", icon: 'assets/health_care.png'),
    ];
    // ignore: unused_local_variable
    List customPath = ['home', 'home', 'home', 'report'];
    List specialisedPath = ['home', 'home', 'home', 'healthcare'];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(customIcons.length, (index) {
            return Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, customPath[index]);
                  },
                  borderRadius: BorderRadius.circular(90),
                  child: Container(
                    width: 60,
                    height: 60,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      customIcons[index].icon,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(customIcons[index].name)
              ],
            );
          }),
        ),
        const SizedBox(height: 14,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(specialisedCared.length, (index) {
            return Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, specialisedPath[index]);
                  },
                  borderRadius: BorderRadius.circular(90),
                  child: Container(
                    width: 60,
                    height: 60,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      specialisedCared[index].icon,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(specialisedCared[index].name)
              ],
            );
          }),
        ),
      ],
    );
  }
}

class CustomIcon {
  final String name;
  final String icon;

  CustomIcon({
    required this.name,
    required this.icon,
  });
}


