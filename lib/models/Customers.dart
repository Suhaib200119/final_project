class Customers{

    String? name;
    String? phoneNumber;
    String? name_employee;
    String? name_region;
    double? previous_reading;
    double? current_reading;
    String? last_read_date;
    double? balance;

  Customers(

      this.name,
      this.phoneNumber,
      this.name_employee,
      this.name_region,
      this.balance,
      this.previous_reading,
      this.current_reading,
      this.last_read_date
   );

    @override
  String toString() {
    return 'Customers{name: $name, phoneNumber: $phoneNumber, name_employee: $name_employee, name_region: $name_region, previous_reading: $previous_reading, current_reading: $current_reading, last_read_date: $last_read_date, balance: $balance}';
  }
}
///
// class Customers{
//
//   String? _name;
//   String? _phone_number;
//   double? _balance =0.0;
//   String? _name_employee;
//   String? _name_region;
//   double? _previous_reading=0.0;
//   double? _current_reading=0.0;
//   String? _last_read_date;
//
//   Customers(
//       this._name,
//       this._phone_number,
//       this._name_employee,
//       this._name_region,
//       );
//
//   String get last_read_date {
//     return  last_read_date;
//   }
//
//   set last_read_date(String value) {
//     _last_read_date = value;
//   }
//
//   double get current_reading {
//     return current_reading;
//   }
//
//   set current_reading(double value) {
//     _current_reading = value;
//   }
//
//   double get previous_reading {
//     return previous_reading;
//   }
//
//   set previous_reading(double value) {
//     _previous_reading = value;
//   }
//
//   String get name_region {
//     return name_region;
//   }
//
//   set name_region(String value) {
//     _name_region = value;
//   }
//
//   String get name_employee {
//     return name_employee;
//   }
//
//   set name_employee(String value) {
//     _name_employee = value;
//   }
//
//   double get balance {
//
//     return balance;
//   }
//
//   set balance(double value) {
//     _balance = value;
//   }
//
//   String get phone_number {return phone_number;}
//
//   set phone_number(String value) {
//     _phone_number = value;
//   }
//
//   String get name {
//     return name;
//   }
//
//   set name(String value) {
//     _name = value;
//   }
// }
//