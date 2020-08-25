class Beer {
  double cuantity;
  int amount;
  double price;
  String picture;

  Beer(double cuantity, int amount, double price, String picture) {
    this.cuantity = cuantity;
    this.amount = amount;
    this.price = price;
    this.picture = picture;
  }

  //////////////////////////////////////
  // Add and remove beer from the amount
  void addBeerAmount(int amountToAdd) {
    this.amount += amountToAdd;
  }

  void removeBeerAmount(int amountToRemove) {
    if (amountToRemove <= this.amount) {
      this.amount -= amountToRemove;
    }
  }

  ///////////////////////////////////
  // Get the full price and cuantity
  double getTotalPrice() {
    return price * amount;
  }

  double getTotalCuantity() {
    return cuantity * amount;
  }
}
