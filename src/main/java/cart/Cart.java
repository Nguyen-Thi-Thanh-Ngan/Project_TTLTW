package cart;

import model.Product;
import service.ProductService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Cart {
    Map<String, CartProduct> data = new HashMap<>();
    public Map<String, CartProduct> getData() {
        return data;
    }
    private double totalPrice = 0;

    public boolean add(String add) {
        return add(add, 1);
    }

    public boolean add(String add, int quantity) {
        Product p = ProductService.getInstance().getById(add);
        if (p == null) return false;
        CartProduct cartProduct;
        if (data.containsKey(add)) {
            cartProduct = data.get(add);
            cartProduct.increaseQuantity(quantity);
        } else {
            cartProduct = new CartProduct(quantity, p);
        }

        data.put(add, cartProduct);
        return true;
    }

    public int getTotal() {
        return data.size();
    }

    public List<CartProduct> getCartProducts() {
        return new ArrayList<>(data.values());
    }

    public double amount(List<CartProduct> cartProducts) {
        double result = 0;
        for (CartProduct cartProduct : cartProducts) {
            result = cartProduct.getProduct().getPrice() + result;
        }
        return result;

    }

    public void removeProduct(String productId) {
        // Kiểm tra xem sản phẩm có tồn tại trong giỏ hàng không
        if (data.containsKey(productId)) {
            // Xóa sản phẩm khỏi giỏ hàng
            data.remove(productId);
        }
    }

    public boolean updateProduct(String productId, int quantity) {
        Product p = ProductService.getInstance().getById(productId);
        if (p == null) return false;
        CartProduct cartProduct;
        if (data.containsKey(productId)) {
            cartProduct = data.get(productId);
            cartProduct.setQuantity(quantity);
        } else {
            cartProduct = new CartProduct(quantity, p);
        }

        data.put(productId, cartProduct);
        return true;
    }


    @Override
    public String toString() {
        return "Cart{" +
                "data=" + data +
                '}' + "\n";
    }

    public static void main(String[] args) {
        Cart c = new Cart();
        c.add("1");
        c.add("2");
        List<CartProduct> a = c.getCartProducts();
        System.out.println(a);
        System.out.println(c.amount(a));
        c.removeProduct("2");
        System.out.println(c);
    }
}


