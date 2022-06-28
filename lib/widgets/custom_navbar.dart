import 'dart:io';

import 'package:project_app/models/payment_method_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app/screens/logout_screen.dart';
import '/widgets/widgets.dart';
import '/blocs/blocs.dart';
import '/models/models.dart';

class CustomNavBar extends StatelessWidget {
  final String screen;
  final Product? product;

  const CustomNavBar({
    Key? key,
    required this.screen,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _selectNavBar(context, screen)!,
        ),
      ),
    );
  }

  List<Widget>? _selectNavBar(context, screen) {
    switch (screen) {
      case '/':
        return _buildNavBar(context);
      case '/catalog':
        return _buildNavBar(context);
      case '/wishlist':
        return _buildNavBar(context);
      case '/payment-selection':
        return _buildNavBar(context);
      case '/product':
        return _buildAddToCartNavBar(context, product);
      case '/cart':
        return _buildGoToCheckoutNavBar(context);
      case '/checkout':
        return _buildOrderNowNavBar(context);
      case '/order-confirmation':
        return _buildNavBar(context);

      default:
        _buildNavBar(context);
    }
  }

  List<Widget> _buildNavBar(context) {
    return [
      IconButton(
        icon: Icon(Icons.home, color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
      ),
      IconButton(
        icon: Icon(Icons.shopping_cart, color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
      ),
      InkWell(
        child: IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogoutScreen()),
              );
            }),
      )
    ];
  }

  List<Widget> _buildAddToCartNavBar(context, product) {
    return [
      IconButton(
        icon: Icon(Icons.share, color: Colors.white),
        onPressed: () {},
      ),
      BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return CircularProgressIndicator();
          }
          if (state is WishlistLoaded) {
            return IconButton(
              icon: Icon(Icons.favorite, color: Colors.white),
              onPressed: () {
                final snackBar =
                    SnackBar(content: Text('Added to your Wishlist!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                context.read<WishlistBloc>().add(AddProductToWishlist(product));
              },
            );
          }
          return Text('Something went wrong!');
        },
      ),
      BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return CircularProgressIndicator();
          }
          if (state is CartLoaded) {
            return ElevatedButton(
              onPressed: () {
                context.read<CartBloc>().add(
                      AddProduct(product),
                    );
                Navigator.pushNamed(context, '/cart');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(),
              ),
              child: Text(
                'ADD TO CART',
                style: Theme.of(context).textTheme.headline3,
              ),
            );
          }
          return Text('Something went wrong!');
        },
      )
    ];
  }

  List<Widget> _buildGoToCheckoutNavBar(context) {
    return [
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/checkout');
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(),
        ),
        child: Text(
          'GO TO CHECKOUT',
          style: Theme.of(context).textTheme.headline3,
        ),
      )
    ];
  }

  List<Widget> _buildOrderNowNavBar(context) {
    return [
      BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CheckoutLoaded) {
            if (Platform.isAndroid) {
              switch (state.paymentMethod) {
                case PaymentMethod.google_pay:
                  return GooglePay(
                    products: state.products!,
                    total: state.total!,
                  );
                case PaymentMethod.credit_card:
                  return Container(
                    child: Text(
                      'Pay with Credit Card',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.white),
                    ),
                  );
                default:
                  return GooglePay(
                    products: state.products!,
                    total: state.total!,
                  );
              }
            }
            if (Platform.isIOS) {
              switch (state.paymentMethod) {
                case PaymentMethod.apple_pay:
                  return ApplePay(
                    products: state.products!,
                    total: state.total!,
                  );
                case PaymentMethod.credit_card:
                  return Container();
                default:
                  return ApplePay(
                    products: state.products!,
                    total: state.total!,
                  );
              }
            } else {
              return ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/payment-selection');
                },
                child: Text(
                  'CHOOSE PAYMENT',
                  style: Theme.of(context).textTheme.headline3,
                ),
              );
            }
          } else {
            return Text('Something went wrong');
          }
        },
      )
    ];
  }
}
