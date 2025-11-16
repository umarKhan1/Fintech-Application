
import 'package:fintechapp/core/constants/app_images.dart';

class CardModel {
  CardModel({
    required this.holderName,
    required this.cardType,
    required this.cardNumber,
    required this.balance,
    required this.backgroundImage,
  });
  final String holderName;
  final String cardType;
  final String cardNumber;
  final String balance;
  final String backgroundImage;


static  final List<CardModel> sampleCards = [
  CardModel(
    holderName: 'John Doe',
    cardType: 'Platinum',
    cardNumber: '1234 5678 9012 3456',
    balance: r'$5,250.75',
    backgroundImage: AppImages.cardImage,
  ),
   CardModel(
    holderName: 'Jane Smith',
    cardType: 'Gold',
    cardNumber: '9876 5432 1098 7654',
    balance: r'$3,120.00',
    backgroundImage: AppImages.mastercard,
  ),
   CardModel(
    holderName: 'Alice Johnson',
    cardType: 'Silver',
    cardNumber: '4567 8901 2345 6789',
    balance: r'$1,450.50',
    backgroundImage: AppImages.cardImage,
  ),
];

}

