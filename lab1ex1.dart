double processOrder({
  required String orderId,
  required double itemPrice,
  String? promoCode,
  double? deliveryFee,
}) {
  double price = itemPrice;

  if (promoCode == "SAVE10") {
    price = price * 0.9;
  }

  double delivery = deliveryFee ?? 500.0;
  double finalTotal = price + delivery;

  print('OrderId: $orderId');
  print('ItemPrice: $itemPrice');
  print('PromoCode: $promoCode');
  print('Delivery: $delivery');
  print('FinalTotal: $finalTotal');

  return finalTotal;
}

void main() {
  double total = processOrder(
    orderId: "01",
    itemPrice: 50000.0,
    promoCode: "SAVE10",
    deliveryFee: 350,
  );

  print("Total: $total");
}