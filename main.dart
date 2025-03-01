import 'package:flutter/material.dart';
import 'dart:io';

class Product {
   String name;
   double price;

   Product(this.name, this.price);
}

class ShoppingCart {
   List<Product> products = [];
   double totalAmount = 0.0;


   void addProduct(Product product) {
      products.add(product);
      totalAmount += product.price;
      print("Ürün eklendi: ${product.name} - Fiyat: ${product.price.toStringAsFixed(2)}");
   }

   void showProducts() {
      print("\nAlışveriş sepeti:");
      for (var product in products) {
         print("- ${product.name}: ${product.price.toStringAsFixed(2)}");
      }
      print("Toplam tutar: ${totalAmount.toStringAsFixed(2)}\n");
   }
}

void main() {
   int age, no;
   double totalSpent;
   print("yaşınızı girin: ");
   age = int.parse(stdin.readLineSync()!);

   print("müşteri numaranızı girin: ");
   no = int.parse(stdin.readLineSync()!);

   print("Lütfen alışveriş toplam tutarını girin: ");
   totalSpent = double.parse(stdin.readLineSync()!);
   double discountRate = 0.0;

   if (age < 18) {
      discountRate = 0.10; // %10 indirim
   } else if (age >= 18 && age <= 60) {
      discountRate = 0.05; // %5 indirim
   } else if (age > 60) {
      discountRate = 0.15; // %15 indirim
   }

   double discountAmount = totalSpent * discountRate;
   double discountedTotal = totalSpent - discountAmount;

   print("\nMüşteri Numarası: $no");
   print("Yaş: $age");
   print("Toplam Tutar: \$${totalSpent.toStringAsFixed(2)}");
   print("İndirimli Tutar: \$${discountedTotal.toStringAsFixed(2)}");

   ShoppingCart cart = ShoppingCart();
   String? input;

   do {
      print("Ürün adını girin (Çıkmak için 'q' yazın): ");
      input = stdin.readLineSync();

      if (input != 'q') {
         print("Ürün fiyatını girin: ");
         String? priceInput = stdin.readLineSync();
         double? price = double.tryParse(priceInput ?? '0');

         if (price != null) {
            Product product = Product(input!, price);
            cart.addProduct(product);
            cart.showProducts();
         } else {
            print("hatalı fiyat");
         }
      }
   } while (input != 'q');

   cart.showProducts();
}