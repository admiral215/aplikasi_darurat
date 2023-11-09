class kontakDarurat {
  final String id;
  final String name;
  final String phone;
  final bool isActive;
  final String createdDate;
  final String updateDate;


  const kontakDarurat({
    required this.id,
    required this.name,
    required this.phone,
    required this.isActive,
    required this.createdDate,
    required this.updateDate,
    
  });

  factory kontakDarurat.fromJson(Map<String, dynamic> json) {
    return kontakDarurat(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      isActive:json['isActive'],
      createdDate: json['createdDate'],
      updateDate: json['updatedDate']
    );
  }
}

class profile {
  final String id;
  final String name;
  final String phone;
  final String email;
  final  isVerified;
  

  const profile({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.isVerified,
    
  });

  factory profile.fromJson(Map<String, dynamic> json) {
    return profile(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      isVerified:json['isActive'],
    );
  }
}

class dataInstansi {
  final String id;
  final String name;
  final String address;
  final String phone;
  final String distance;  

  const dataInstansi({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.distance,
    
  });

  factory dataInstansi.fromJson(Map<String, dynamic> json) {
    return dataInstansi(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      distance:json['isActive'],
    );
  }
}

