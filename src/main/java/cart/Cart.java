package cart;

import model.cart.CartItem;
import service.IProductService;
import service.impl.ProductServiceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Cart {
    private IProductService productService = new ProductServiceImpl();
    Map<Integer, List<CartItem>> data = new HashMap<>();

}


