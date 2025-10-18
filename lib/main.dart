import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

// 🌟 Root Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3E2723), // coffee brown
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/coffee.png',
              width: 180,
              height: 180,
            ),
            const SizedBox(height: 20),
            const Text(
              '   Fresh coffee\n   fresh vibes',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// ☕ LOGIN PAGE
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('images/login_bg.png', fit: BoxFit.cover),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                const Text(
                  "Welcome back!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Login to your account.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black54)),
                const SizedBox(height: 40),

                buildInputField("Username"),
                const SizedBox(height: 20),
                buildInputField("Phone Number",
                    keyboardType: TextInputType.phone),
                const SizedBox(height: 30),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB87333),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateAccountPage()),
                    );
                  },
                  child: const Text(
                    "Create new account",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.brown,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputField(String label,
      {bool obscureText = false, TextInputType? keyboardType}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

// 🟢 CREATE ACCOUNT PAGE
class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('images/login_bg.png', fit: BoxFit.cover),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
            child: Column(
              children: [
                const SizedBox(height: 100),
                const Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(height: 40),
                buildInputField("Full Name"),
                const SizedBox(height: 20),
                buildInputField("Address"),
                const SizedBox(height: 20),
                buildInputField("Mobile Number",
                    keyboardType: TextInputType.phone),
                const SizedBox(height: 20),
                buildInputField("Password", obscureText: true),
                const SizedBox(height: 20),
                buildInputField("Confirm Password", obscureText: true),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB87333),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VerifyOtpPage()),
                      );
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputField(String label,
      {bool obscureText = false, TextInputType? keyboardType}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

// 🔢 OTP VERIFY PAGE
class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('images/login_bg.png', fit: BoxFit.cover),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Enter 4 Digit OTP",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      4,
                          (index) => SizedBox(
                        width: 50,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          decoration: const InputDecoration(
                            counterText: "",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB87333),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                    },
                    child: const Text(
                      "Verify",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =================== HOME PAGE ====================



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = "COFFEE";

  final Map<String, List<Map<String, String>>> categoryItems = {
    "COFFEE": [
      {"title": "Cappuccino", "price": "Rs: 150", "image": "images/cappuccino.jpeg"},
      {"title": "Black Coffee", "price": "Rs: 50", "image": "images/black.jpeg"},
      {"title": "Cold Coffee", "price": "Rs: 100", "image": "images/cold.jpeg"},
      {"title": "Vanilla Coffee", "price": "Rs: 200", "image": "images/velila.jpeg"},
      {"title": "Chocolate Coffee", "price": "Rs: 170", "image": "images/choocliatecofee.jpeg"},
      {"title": "Iced Cappuccino", "price": "Rs: 250", "image": "images/icedcappuccino.jpg"},
    ],
    "DESSERTS": [
      {"title": "Palkova", "price": "Rs: 250", "image": "images/palkova.jpg"},
      {"title": "BlueBerry", "price": "Rs: 270", "image": "images/blueberry.png"},
      {"title": "StrawBerry", "price": "Rs: 350", "image": "images/strawberry.jpeg"},
    ],
    "CAKE": [
      {"title": "BlackForest", "price": "Rs: 50", "image": "images/blacforest.jpeg"},
      {"title": "WhiteForest", "price": "Rs: 50", "image": "images/whiteforest.jpeg"},
      {"title": "Chocolate", "price": "Rs: 50", "image": "images/chocliatecake.jpeg"},
    ],
  };

  static List<Map<String, dynamic>> cartItems = [];

  @override
  Widget build(BuildContext context) {
    final currentItems = categoryItems[selectedCategory]!;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourite'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage(cartItems: cartItems)),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          }
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              const Row(
                children: [
                  Icon(Icons.location_pin, color: Colors.brown),
                  SizedBox(width: 5),
                  Text(
                    "Ukraine, Ivano-Frankivsk,\nKonovaltsya 132",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: 'Search...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text("Categories", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                children: categoryItems.keys.map((category) {
                  return ChoiceChip(
                    label: Text(category),
                    selected: selectedCategory == category,
                    selectedColor: Colors.brown.shade200,
                    onSelected: (value) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: currentItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final item = currentItems[index];
                  return _buildItemCard(item["title"]!, item["price"]!, item["image"]!);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemCard(String title, String price, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              title: title,
              price: price,
              imagePath: imagePath,
              onAddToCart: (cartItem) {
                setState(() {
                  cartItems.add(cartItem);
                });
              },
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(price, style: const TextStyle(color: Colors.brown)),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = "Lora Roberts";
  String phoneNumber = "+380483746375";
  String address = "Ukraine, Ivano-Frankivsk, Konovaltsya 132";
  String cartName = "My Cart";

  void _editField(String title, String currentValue, Function(String) onSave) {
    TextEditingController controller = TextEditingController(text: currentValue);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit $title"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: "Enter $title",
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
            onPressed: () {
              setState(() {
                String newValue = controller.text.trim();
                if (newValue.isNotEmpty) {
                  onSave(newValue);
                }
              });
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String text,
    required VoidCallback onEdit,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.brown),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            onPressed: onEdit,
            icon: Icon(Icons.edit, color: Colors.brown.shade300, size: 20),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.brown),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage("images/profile.jpg"),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5),
                IconButton(
                  icon: const Icon(Icons.edit, size: 18, color: Colors.brown),
                  onPressed: () => _editField("Name", userName, (val) => userName = val),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Settings",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            _buildSettingItem(
              icon: Icons.phone,
              text: phoneNumber,
              onEdit: () => _editField("Phone Number", phoneNumber, (val) => phoneNumber = val),
            ),
            _buildSettingItem(
              icon: Icons.location_on,
              text: address,
              onEdit: () => _editField("Address", address, (val) => address = val),
            ),
            _buildSettingItem(
              icon: Icons.shopping_cart,
              text: cartName,
              onEdit: () => _editField("Cart Name", cartName, (val) => cartName = val),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.brown.shade400, fontSize: 16),
                  ),
                  const SizedBox(width: 5),
                  Icon(Icons.logout,
                      color: Colors.brown.shade400, size: 20),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// =================== PRODUCT DETAIL PAGE ====================

class ProductDetailPage extends StatefulWidget {
  final String title;
  final String price;
  final String imagePath;
  final Function(Map<String, dynamic>) onAddToCart;

  const ProductDetailPage({
    super.key,
    required this.title,
    required this.price,
    required this.imagePath,
    required this.onAddToCart,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    double basePrice = double.parse(widget.price.replaceAll(RegExp(r'[^0-9]'), ''));
    double totalPrice = basePrice * quantity;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(widget.imagePath, height: 300, width: double.infinity, fit: BoxFit.cover),
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.brown),
                      SizedBox(width: 4),
                      Text("4.9", style: TextStyle(color: Colors.brown)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text("About", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text(
                    "Deliciously brewed and crafted with care. Perfect to enjoy at any time of the day.",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  const Text("Item Quantity", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Number of Items", style: TextStyle(fontSize: 16)),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) quantity--;
                              });
                            },
                          ),
                          Text(quantity.toString(), style: const TextStyle(fontSize: 16)),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      widget.onAddToCart({
                        "title": widget.title,
                        "image": widget.imagePath,
                        "quantity": quantity,
                        "price": totalPrice,
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(
                            cartItems: _HomePageState.cartItems,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Add to Cart  Rs: ${totalPrice.toStringAsFixed(2)}",
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =================== CART PAGE ====================


class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String selectedPayment = "UPI";

  @override
  Widget build(BuildContext context) {
    double total = widget.cartItems.fold(0, (sum, item) => sum + item["price"]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Order"),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  final item = widget.cartItems[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.asset(
                          item["image"], width: 60, fit: BoxFit.cover),
                      title: Text(item["title"],
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text("x${item["quantity"]}"),
                      trailing: Text("Rs: ${item["price"]}"),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Payment Method:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                _buildPaymentOption("UPI", Icons.account_balance_wallet),
                _buildPaymentOption("Card", Icons.credit_card),
                _buildPaymentOption("Cash", Icons.money),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderSuccessPage()),
                    );
                  },
                  child: const Text("Confirm Order"),
                ),
                Text(
                  "Total: Rs ${total.toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPayment = title;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: selectedPayment == title ? Colors.brown.shade100 : Colors.grey
              .shade200,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selectedPayment == title ? Colors.brown : Colors.grey
                .shade300,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.brown),
            const SizedBox(width: 10),
            Text(title, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}


class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 120),
              const SizedBox(height: 30),
              const Text(
                "Congratulations!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Your order is placed and\nit’s on its way to you",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 40),

              // ✅ Track Order Button → navigates to Order Status Page
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OrderStatusPage()),
                  );
                },
                child: const Text("Track Order"),
              ),

              const SizedBox(height: 15),

              // ✅ Back Home Button
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.green, width: 2),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                        (route) => false,
                  );
                },
                child: const Text(
                  "Back Home",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class OrderStatusPage extends StatelessWidget {
  const OrderStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Order Status Details",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildStatusStep(
              icon: Icons.inventory_2,
              title: "Order Confirmed",
              date: "20-12-2022",
              time: "11:00 PM",
              isCompleted: true,
              isActive: true,
            ),
            _buildStatusStep(
              icon: Icons.settings,
              title: "Order Processed",
              date: "20-12-2022",
              time: "10:00 PM",
              isCompleted: false,
            ),
            _buildStatusStep(
              icon: Icons.local_shipping,
              title: "On Delivery",
              date: "20-12-2022",
              time: "12:00 PM",
              isCompleted: false,
            ),
            _buildStatusStep(
              icon: Icons.thumb_up,
              title: "Order Completed",
              date: "------",
              time: "",
              isCompleted: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusStep({
    required IconData icon,
    required String title,
    required String date,
    required String time,
    required bool isCompleted,
    bool isActive = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(icon, color: isCompleted ? Colors.orange : Colors.grey),
            Container(
              width: 2,
              height: 50,
              color: Colors.grey.shade300,
            ),
          ],
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text(date, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
                Text(time, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
