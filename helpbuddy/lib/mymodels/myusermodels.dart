class Info {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String nationality;
  final String gender;

  Info({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.nationality,
    required this.gender,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      nationality: json['nationality'],
      gender: json['gender'],
    );
  }
}

class Funds {
  final String totalBalance;
  final String deposit;
  final String referralBonus;

  Funds({
    required this.totalBalance,
    required this.deposit,
    required this.referralBonus,
  });

  factory Funds.fromJson(Map<String, dynamic> json) {
    return Funds(
      totalBalance: json['total_balance'],
      deposit: json['deposit'],
      referralBonus: json['referral_bonus'],
    );
  }
}

class UserInfo {
  final Info info;
  final Funds funds;

  UserInfo({
    required this.info,
    required this.funds,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      info: Info.fromJson(json['info']),
      funds: Funds.fromJson(json['funds']),
    );
  }
}


class Project {
  final int id;
  final String title;
  final String department;
  final String category;
  final String budget;
  final String serviceType;
  final String deliveryDate;
  final String user;
  final int userId;
  final String? admin;
  final String status;

  Project({
    required this.id,
    required this.title,
    required this.department,
    required this.category,
    required this.budget,
    required this.serviceType,
    required this.deliveryDate,
    required this.user,
    required this.userId,
    required this.admin,
    required this.status,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      title: json['title'],
      department: json['department'],
      category: json['category'],
      budget: json['budget'],
      serviceType: json['service_type'],
      deliveryDate: json['delivery_date'],
      user: json['user'],
      userId: json['user_id'],
      admin: json['admin'],
      status: json['status'],
    );
  }
}
