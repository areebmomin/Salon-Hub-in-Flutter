import 'dart:io';

part 'extension_helpers.dart';

class SaloonRegistrationData {
  File? profilePicture;
  String businessName;
  String phoneNumber;
  String address;
  String location;
  List<String> services;
  String type;
  List<bool> serviceDays;
  ServiceTime serviceTime;
  List<OwnerDetail> ownerDetailsList;
  List<AttendeeDetail> attendeeDetailList;
  String email;
  String password;

  SaloonRegistrationData({
    this.profilePicture,
    this.businessName = '',
    this.phoneNumber = '',
    this.address = '',
    this.location = '',
    List<String>? services,
    this.type = 'Male',
    List<bool>? serviceDays,
    ServiceTime? serviceTime,
    List<OwnerDetail>? ownerDetailsList,
    List<AttendeeDetail>? attendeeDetailList,
    this.email = '',
    this.password = '',
  })  : services = services ?? [],
        serviceDays =
            serviceDays ?? [false, true, true, true, true, true, true],
        serviceTime = serviceTime ?? ServiceTime(),
        ownerDetailsList = ownerDetailsList ?? [OwnerDetail()],
        attendeeDetailList = attendeeDetailList ?? [AttendeeDetail()];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'business_name': businessName,
      'phone_number': phoneNumber,
      'address': address,
      'location': location,
      'services': services,
      'type': type,
      'service_days': serviceDays,
      'service_times': serviceTime.toMap(),
      'owner_details_list': ownerDetailsList.extractNames(),
      'attendee_detail_list': attendeeDetailList.extractNames(),
      'email': email,
    };
  }
}

class ServiceTime {
  Time startTime;
  Time endTime;

  ServiceTime({Time? startTime, Time? endTime})
      : startTime = startTime ?? Time(hour: 10, minute: 0),
        endTime = endTime ?? Time(hour: 20, minute: 0);

  Map<String, dynamic> toMap() {
    return {
      'startTime': startTime.toMap(),
      'endTime': endTime.toMap(),
    };
  }
}

class Time {
  int hour;
  int minute;

  String get period => hour < 12 ? 'AM' : 'PM';

  int get hourOfPeriod => hour == 0 || hour == 12 ? 12 : hour - periodOffset;

  int get periodOffset => period == 'AM' ? 0 : 12;

  Time({required this.hour, required this.minute});

  @override
  String toString() {
    String addLeadingZeroIfNeeded(int value) {
      return value < 10 ? '0$value' : value.toString();
    }

    final String hourLabel = addLeadingZeroIfNeeded(hourOfPeriod);
    final String minuteLabel = addLeadingZeroIfNeeded(minute);

    return '$hourLabel:$minuteLabel $period';
  }

  Map<String, dynamic> toMap() {
    return {
      'hour': hour,
      'minute': minute,
    };
  }
}

class OwnerDetail {
  String name;
  File? profilePicture;

  OwnerDetail({this.name = '', this.profilePicture});
}

class AttendeeDetail {
  String name;
  File? profilePicture;

  AttendeeDetail({this.name = '', this.profilePicture});
}