class Setting {
  final List<Profile> listProfile;
  final List<Display> listDisplay;
  final List<Account> listAccount;

  Setting({this.listProfile, this.listDisplay, this.listAccount});

  factory Setting.fromJson(Map<String, dynamic> json) {
    return Setting(
      listProfile: json['profile'].map((i) => Profile.fromJson(i)).toList(),
      listAccount: json['account'].map((i) => Account.fromJson(i)).toList(),
      listDisplay: json['display'].map((i) => Display.fromJson(i)).toList(),
    );
  }
}

class Profile {
  final String idType;
  final String type;
  final String name;
  final String email;
  final String password;
  final String language;
  final String currency;
  final String cent;
  final String colorScheme;
  final String googleDrive;
  final String photo;
  final String lastBackup;

  Profile(
      {this.idType,
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
      this.lastBackup});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      idType: json['id_type'],
      type: json['type'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      language: json['language'],
      currency: json['currency'],
      cent: json['cent'],
      colorScheme: json['color_scheme'],
      googleDrive: json['google_drive'],
      photo: json['photo'],
      lastBackup: json['last_backup'],
    );
  }
}

class Display {
  final List<TransactionType> listTransactionType;
  final List<Category> listCategory;

  Display({this.listTransactionType, this.listCategory});

  factory Display.fromJson(Map<String, dynamic> json) {
    return Display(
      listTransactionType: json['transaction_type']
          .map((i) => TransactionType.fromJson(i))
          .toList(),
      listCategory:
          json['categories'].map((i) => Category.fromJson(i)).tiList(),
    );
  }
}

class TransactionType {
  final String transactionId;
  final String trscId;
  final String transactionName;
  final String fromCategoryId;
  final String amountSignFrom;
  final String toCategoryId;
  final String amountSignId;

  TransactionType(
      {this.transactionId,
      this.trscId,
      this.transactionName,
      this.fromCategoryId,
      this.amountSignFrom,
      this.toCategoryId,
      this.amountSignId});

  factory TransactionType.fromJson(Map<String, dynamic> json) {
    return TransactionType(
        transactionId: json['transaction_id'],
        trscId: json['trsc_id'],
        transactionName: json['transaction_name'],
        fromCategoryId: json['from_category_id'],
        amountSignFrom: json['amount_sign_from'],
        toCategoryId: json['to_category_id'],
        amountSignId: json['amount_sign_id']);
  }
}

class Category {
  final String categoryId;
  final String categoryName;
  final String parentId;

  Category({this.categoryId, this.categoryName, this.parentId});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        categoryId: json['category_id'],
        categoryName: json['category_name'],
        parentId: json['parent_id']);
  }
}

class Account {
  final String categoryName;
  final String subcategoryName;
  final String accountName;

  Account({this.categoryName, this.subcategoryName, this.accountName});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
        categoryName: json['category_name'],
        subcategoryName: json['subcategory_name'],
        accountName: json['account_name']);
  }
}