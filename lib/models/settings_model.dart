class Setting {
  final List<Profile> listProfile;
  final Display display;
  final List<Account> listAccount;

  Setting({this.listProfile, this.display, this.listAccount});

  factory Setting.fromJson(Map<String, dynamic> json) {
    var listProfile = json['profile'] as List;
    List<Profile> profileList =
        listProfile.map((i) => Profile.fromJson(i)).toList();

    var listAccount = json['account'] as List;
    List<Account> accountList =
        listAccount.map((i) => Account.fromJson(i)).toList();

    return Setting(
      listProfile: profileList,
      listAccount: accountList,
      display: null,
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
    var listTransactionType = json['transaction_type'] as List;
    List<TransactionType> transactionTypeList =
        listTransactionType.map((i) => TransactionType.fromJson(i)).toList();

    var listCategory = json['categories'] as List;
    List<Category> categoryList =
        listCategory.map((i) => Category.fromJson(i)).toList();

    return Display(
      listTransactionType: transactionTypeList,
      listCategory: categoryList,
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
  final List<Subcategory> listSubcategory;

  Account({this.listSubcategory});

  factory Account.fromJson(Map<String, dynamic> json) {
    var listSub = json['subcategory'] as List;
    List<Subcategory> subList =
        listSub.map((i) => Subcategory.fromJson(i)).toList();

    return Account(listSubcategory: subList);
  }
}

class Subcategory {
  final String accountId;
  final String accountName;
  final String subcategoryId;
  final String balance;
  final String idType;

  Subcategory(
      {this.accountId,
      this.accountName,
      this.subcategoryId,
      this.balance,
      this.idType});

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
        accountId: json['account_id'],
        accountName: json['account_name'],
        subcategoryId: json['subcategory_id'],
        balance: json['balance'],
        idType: json['id_type']);
  }
}