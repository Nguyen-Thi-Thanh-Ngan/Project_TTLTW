package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    List<Product> findNewProduct();
    List<Product> findSaleProduct();
    List<Product> findSellingProduct();
    Product findProductById(int id);
    List<Product> findByName(String productName);
    List<Product> findByProducer(Integer idProducer);
    List<Product> findByCategory(Integer idCategory);
    List<Product> getPaging(int index);
}
