import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String title;
  final String description;
  final String price;
  final double rawPrice;
  final String currencyCode;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rawPrice,
    required this.currencyCode,
  });

  static var monthly = const Product(
    id: 'monthly_subscription',
    title: 'Monthly',
    description: 'Unlock all features for a month',
    price: '4.99',
    rawPrice: 4.99,
    currencyCode: 'USD',
  );

  static var yearly = const Product(
    id: 'yearly_subscription',
    title: 'Yearly',
    description: 'Unlock all features for a year',
    price: '49.99',
    rawPrice: 49.99,
    currencyCode: 'USD',
  );

  @override
  List<Object?> get props => [id];
}
