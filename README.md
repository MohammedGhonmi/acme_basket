# 🧺 Acme Widget Basket

A clean and modular Ruby implementation of a shopping basket system built for Acme Widget Co.  
Supports product catalog, delivery charge rules, and promotional offers.

---

## 🚀 How It Works

### 🛒 Basket Behavior
- Add products to a basket by product code.
- Apply promotions automatically (e.g., buy-one-get-one-half-off).
- Apply delivery charges based on the subtotal.

### 📦 Example Usage
Run the script:

```bash
ruby spec/basket_spec.rb
```

Expected Output:

```text
Basket: B01, G01 => Total: $37.85
Basket: R01, R01 => Total: $54.37
Basket: R01, G01 => Total: $60.85
Basket: B01, B01, R01, R01, R01 => Total: $98.27
```

Assumptions Made
- The system is in-memory only — no DB or Rails.
- Focus is on object-oriented design, not UI or persistence.
- Offers and delivery logic are injected for testability and flexibility.
- The spec file acts as a basic unit test runner.

Design Notes
- Uses strategy pattern for applying offers (Offer base class).
- Delivery charge logic is encapsulated in DeliveryRule.
- Products are simple value objects (Product) and duplicated on addition to the basket to allow price adjustment.

