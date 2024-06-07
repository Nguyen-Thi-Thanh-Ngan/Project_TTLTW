package dao.impl;

import dao.DAOInterface;
import model.NewProduct;
import model.Product;
import db.JDBIConnector;

import java.util.ArrayList;
import java.util.List;

public class NewProductDAO implements DAOInterface<NewProduct> {
    @Override
    public List<NewProduct> selectAll() {
        List<NewProduct> ketQua = JDBIConnector.getConnect().withHandle((handle -> {
            List<NewProduct> newProductDAOS = new ArrayList<>();
            handle.createQuery("SELECT id, product_id FROM new_products")
                    .map((rs, ctx) -> {
                        String id = rs.getString("id");
                        String product_id = rs.getString(("product_id"));

                        Product product = ProductDAO.getById(product_id);
                        NewProduct newProduct = new NewProduct(id, product);
                        newProductDAOS.add(newProduct);

                        return null;
                    }).list();
            return newProductDAOS;
        }));
        return ketQua;
    }


    @Override
    public NewProduct selectById(NewProduct newProduct) {
        return null;
    }

    @Override
    public int insert(NewProduct newProduct) {
        return 0;
    }

    @Override
    public int delete(NewProduct newProduct) {
        return 0;
    }

    @Override
    public int update(NewProduct newProduct) {
        return 0;
    }

    public static void main(String[] args) {
        NewProductDAO ne = new NewProductDAO();
        System.out.println(ne.selectAll());
    }
}
