class SettingModel {
  final List<Profile> profile;
  final Display display;
  final List<Account> account;

  SettingModel({
    this.profile,
    this.display,
    this.account,
  });

  factory SettingModel.fromJson(Map<String, dynamic> json) {
    var list1 = json['profile'] as List;
    List<Profile> profile = list1.map((i) => Profile.fromJson(i)).toList();

    var list2 = json['account'] as List;
    List<Account> accountList = list2.map((i) => Account.fromJson(i)).toList();

    return SettingModel(
      profile: profile,
      display: Display.fromJson(json["display"]),
      account: accountList,
    );
  }

  Map<String, dynamic> toJson() => {
    "profile": List<dynamic>.from(profile.map((x) => x.toJson())),
    "display": display.toJson(),
    "account": List<dynamic>.from(account.map((x) => x.toJson())),
  };
}

class Account {
  String categoryName;
  String subcategoryName;
  String accountName;

  Account({
    this.categoryName,
    this.subcategoryName,
    this.accountName,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      categoryName: json["category_name"],
      subcategoryName: json["subcategory_name"],
      accountName: json["account_name"],
    );
  }

  Map<String, dynamic> toJson() => {
    "category_name": categoryName,
    "subcategory_name": subcategoryName,
    "account_name": accountName,
  };
}

class Display {
  List<TransactionType> transactionType;
  List<Category> categories;

  Display({
    this.transactionType,
    this.categories,
  });

  factory Display.fromJson(Map<String, dynamic> json) {
    return Display(
      transactionType: List<TransactionType>.from(json["transaction_type"].map((x) => TransactionType.fromJson(x))),
      categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "transaction_type": List<dynamic>.from(transactionType.map((x) => x.toJson())),
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class Category {
  String categoryId;
  String categoryName;
  String parentId;

  Category({
    this.categoryId,
    this.categoryName,
    this.parentId,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json["category_id"],
      categoryName: json["category_name"],
      parentId: json["parent_id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "parent_id": parentId,
  };
}

class TransactionType {
  String transactionId;
  String trscId;
  String transactionName;
  String fromCategoryId;
  GoogleDrive amountSignFrom;
  String toCategoryId;
  GoogleDrive amountSignId;

  TransactionType({
    this.transactionId,
    this.trscId,
    this.transactionName,
    this.fromCategoryId,
    this.amountSignFrom,
    this.toCategoryId,
    this.amountSignId,
  });

  factory TransactionType.fromJson(Map<String, dynamic> json) {
   return TransactionType(
      transactionId: json["transaction_id"],
      trscId: json["trsc_id"],
      transactionName: json["transaction_name"],
      fromCategoryId: json["from_category_id"],
      amountSignFrom: googleDriveValues.map[json["amount_sign_from"]],
      toCategoryId: json["to_category_id"],
      amountSignId: googleDriveValues.map[json["amount_sign_id"]],
    );
  }

  Map<String, dynamic> toJson() => {
    "transaction_id": transactionId,
    "trsc_id": trscId,
    "transaction_name": transactionName,
    "from_category_id": fromCategoryId,
    "amount_sign_from": googleDriveValues.reverse[amountSignFrom],
    "to_category_id": toCategoryId,
    "amount_sign_id": googleDriveValues.reverse[amountSignId],
  };
}

enum GoogleDrive { EMPTY, GOOGLE_DRIVE }

final googleDriveValues = EnumValues({
  "-": GoogleDrive.EMPTY,
  "+": GoogleDrive.GOOGLE_DRIVE
});

class Profile {
  String idType;
  String type;
  String name;
  String email;
  String password;
  String language;
  String currency;
  String cent;
  String colorScheme;
  GoogleDrive googleDrive;
  GoogleDrive photo;
  String lastBackup;

  Profile({
    this.idType,
    this.type,
    this.name,
    this.email,
    this.password,
    this.language,
    this.currency,
    this.cent,
    this.colorScheme,
    this.googleDrive,
    this.photo,
    this.lastBackup,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      idType: json["id_type"],
      type: json["type"],
      name: json["name"],
      email: json["email"],
      password: json["password"],
      language: json["language"],
      currency: json["currency"],
      cent: json["cent"],
      colorScheme: json["color_scheme"],
      googleDrive: googleDriveValues.map[json["google_drive"]],
      photo: googleDriveValues.map[json["photo"]],
      lastBackup: json["last_backup"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id_type": idType,
    "type": type,
    "name": name,
    "email": email,
    "password": password,
    "language": language,
    "currency": currency,
    "cent": cent,
    "color_scheme": colorScheme,
    "google_drive": googleDriveValues.reverse[googleDrive],
    "photo": googleDriveValues.reverse[photo],
    "last_backup": lastBackup,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
