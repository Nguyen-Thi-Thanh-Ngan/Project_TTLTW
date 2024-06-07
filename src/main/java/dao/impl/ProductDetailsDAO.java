package dao.impl;

import dao.DAOInterface;
import model.Product;
import model.ProductDetails;
import db.JDBIConnector;

import java.util.List;
import java.util.Optional;

public class ProductDetailsDAO implements DAOInterface<ProductDetails> {

    @Override
    public List<ProductDetails> selectAll() {
        return null;
    }

    @Override
    public ProductDetails selectById(ProductDetails productDetails) {
        return null;
    }

    @Override
    public int insert(ProductDetails productDetails) {
        int ketQua = JDBIConnector.getConnect().withHandle(handle ->
                    handle.createUpdate("INSERT INTO product_details (id, product_id, description, quantity) " +
                                    "VALUES (:id, :productId, :description, :quantity)")
                            .bind("id", productDetails.getId())
                            .bind("productId", productDetails.getProduct().getId())
                            .bind("description", productDetails.getDescription())
                            .bind("quantity", productDetails.getQuantity())
                            .execute()
            );
        return ketQua;
    }


    @Override
    public int delete(ProductDetails productDetails) {
        int ketQua =  JDBIConnector.getConnect().withHandle(handle ->
                    handle.createUpdate("DELETE FROM product_details WHERE id = :id")
                            .bind("id", productDetails.getId())
                            .execute()
            );
        return ketQua;
    }

    @Override
    public int update(ProductDetails productDetails) {
        int ketQua = JDBIConnector.getConnect().withHandle(handle ->
                handle.createUpdate("UPDATE product_details " +
                                "SET id = :id, product_id = :productId, content = :content, quantity = :quantity " +
                                "WHERE id = :id")
                        .bindBean(productDetails)
                        .execute()
        );
        return ketQua;
    }


    public ProductDetails getProductDetail(Product product){
        Optional<ProductDetails> productDetails = JDBIConnector.getConnect().withHandle((handle ->
                handle.createQuery("SELECT pd.id, pd.product_id, pd.content, pd.quantity " +
                                        "FROM product_details pd " +
                                        "JOIN products p ON pd.product_id = p.id " +
                                        "WHERE p.id = ?")
                        .bind(0, product.getId())
                        .map((rs, ctx) -> {
                            String id = rs.getString("id");
                            String content = rs.getString("content");
                            int quantity = rs.getInt("quantity");
                            String product_id = rs.getString("product_id");
                            Product p = ProductDAO.getById(product_id);

                            ProductDetails productDl = new ProductDetails(id, p, content, quantity);
                            return productDl;
                        }).stream().findFirst()
        ));
        return productDetails.isEmpty() ? null : productDetails.get();
    };

    public static void main(String[] args) {
        ProductDetailsDAO pdd = new ProductDetailsDAO();
        Product p = new Product("1", null, 0, null, 0, null, null);
        System.out.println(pdd.getProductDetail(p));
    }
}
