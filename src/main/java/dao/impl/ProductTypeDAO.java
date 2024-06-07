package dao.impl;

import dao.DAOInterface;
import model.*;
import db.JDBIConnector;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class ProductTypeDAO implements DAOInterface<ProductType> {
    @Override
    public List<ProductType> selectAll() {
        List<ProductType> productTypes = JDBIConnector.getConnect().withHandle((handle ->
                handle.createQuery("SELECT id, name FROM product_types")
                        .mapToBean(ProductType.class).stream().collect(Collectors.toList())
        ));
        return productTypes;
    }

    @Override
    public ProductType selectById(ProductType productTypeP) {
        Optional<ProductType> productType = JDBIConnector.getConnect().withHandle((handle ->
                handle.createQuery("SELECT id, name FROM product_types WHERE id = ?")
                        .bind(0, productTypeP.getId())
                        .mapToBean(ProductType.class).stream().findFirst()
        ));
        return productType.isEmpty() ? null : productType.get();
    }

    @Override
    public int insert(ProductType productType) {
        int ketQua = JDBIConnector.getConnect().withHandle(handle ->
                handle.createUpdate("INSERT INTO product_types (id, name) VALUES (:id, :name)")
                        .bind("id", productType.getId())
                        .bind("name", productType.getName())
                        .execute()
        );
        return ketQua;
    }

    @Override
    public int delete(ProductType productType) {
        int ketQua = JDBIConnector.getConnect().withHandle(handle ->
                handle.createUpdate("DELETE FROM product_types WHERE id = :id")
                        .bind("id", productType.getId())
                        .execute()
        );
        return ketQua;
    }

    @Override
    public int update(ProductType productType) {
        int ketQua = JDBIConnector.getConnect().withHandle(handle ->
                handle.createUpdate("UPDATE product_types SET name = :name WHERE id = :id")
                        .bind("name", productType.getName())
                        .bind("id", productType.getId())
                        .execute()
        );
        return ketQua;
    }

    public static ProductType getById(String id) {
        Optional<ProductType> productType = JDBIConnector.getConnect().withHandle((handle ->
                handle.createQuery("SELECT id, name FROM product_types WHERE id = ?")
                        .bind(0, id)
                        .map((rs, ctx) -> {
                            String nameProductType = rs.getString("name");
                            ProductType pt = new ProductType(id, nameProductType);
                            return pt;
                        }).stream().findFirst()
        ));
        return productType.isEmpty() ? null : productType.get();
    }

    public static void main(String[] args) {
        ProductTypeDAO productTypeDAO = new ProductTypeDAO();
        System.out.println(productTypeDAO.getById("Pt_1"));
    }
}
