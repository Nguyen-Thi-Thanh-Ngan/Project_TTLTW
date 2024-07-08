package dao.impl;

import dao.IProductDAO;
import db.JDBIConnector;
import model.Product;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

    public class ProductDAOImpl implements IProductDAO {
        private static final String BASE_QUERY = "SELECT id, name, price, product_type_id, producer_id, quantity, status, coupon_id, detail, import_date FROM products";

        @Override
        public boolean addProduct(Product product) {

            return false;
        }

        @Override
        public boolean updateProduct(Product product) {
            return false;
        }

        @Override
        public boolean deleteProduct(Integer idProduct) {
            int rowsAffected = JDBIConnector.getConnect().withHandle(handle ->
                    handle.createUpdate("DELETE FROM products WHERE id = :idProduct")
                            .bind("idProduct", idProduct)
                            .execute()
            );
            return rowsAffected > 0;
        }

        @Override
        public List<Product> findAll() {
            List<Product> products = JDBIConnector.getConnect().withHandle(handle -> {
                return handle.createQuery(BASE_QUERY)
                        .mapToBean(Product.class)
                        .list();
            });
            return products;
        }

        @Override
        public Product findById(Integer id) {
            Product product = JDBIConnector.getConnect().withHandle(handle -> {
                return handle.createQuery(BASE_QUERY + " WHERE id = :id")
                        .bind("id", id)
                        .mapToBean(Product.class)
                        .findFirst()
                        .orElse(null);
            });
            return product;
        }

        @Override
        public List<Product> findByName(String name) {
            List<Product> products =  JDBIConnector.getConnect().withHandle(handle -> {
                return handle.createQuery(BASE_QUERY + " where name LIKE '" +name +  "%'" + " OR name LIKE '%" +name + "%'" + " OR name LIKE '%" + name+ "'")
                        .mapToBean(Product.class)
                        .list();
            });
            return products;
        }

        @Override
        public List<Product> findByCategory(Integer categoryId) {
            List<Product> products = JDBIConnector.getConnect().withHandle(handle -> {
                 return handle.createQuery(BASE_QUERY + " where product_type_id = :productTypeId")
                        .bind("productTypeId", categoryId)
                         .mapToBean(Product.class)
                         .list();
            });
            return products;
        }

        @Override
        public List<Product> findByProducer(Integer producerId){
            List<Product> products = JDBIConnector.getConnect().withHandle(handle -> {
                return handle.createQuery(BASE_QUERY + " where producer_id = :producerId")
                        .bind("producerId", producerId)
                        .mapToBean(Product.class)
                        .list();
            });
            return products;
        }

        @Override
        public List<Product> findNewProduct() {
            List<Product> products = JDBIConnector.getConnect().withHandle(handle -> {
                return handle.createQuery(BASE_QUERY + " WHERE import_date >= :date")
                        .bind("date", LocalDate.now().minusDays(10).format(DateTimeFormatter.ISO_DATE))
                        .mapToBean(Product.class)
                        .list();
            });
            return products;
        }

        @Override
        public List<Product> findSaleProduct() {
            List<Product> products = JDBIConnector.getConnect().withHandle(handle -> {
                return handle.createQuery(BASE_QUERY + " WHERE status = 'sale'")
                        .mapToBean(Product.class)
                        .list();
            });
            return  products;
        }

        @Override
        public List<Product> findProductIsSelling() {
            List<Product> products = JDBIConnector.getConnect().withHandle(handle -> {
                return handle.createQuery(BASE_QUERY + " WHERE status = 'selling'")
                        .mapToBean(Product.class)
                        .list();
            });
            return products;
        }
        @Override
        public List<Product> getPaging(int index) {
            int pageSize = 20;
            int offset = (index - 1) * pageSize;
            List<Product> result  = JDBIConnector.getConnect().withHandle(handle ->
                    handle.createQuery("SELECT id, name, price, product_type_id, quantity, producer_id " +
                                    "FROM products ORDER BY id LIMIT :pageSize OFFSET :offset")
                            .bind("pageSize", pageSize)
                            .bind("offset", offset)
                            .mapToBean(Product.class)
                            .list()
            );
            return result;
        }

        public static void main(String[] args) {
            ProductDAOImpl productDAO = new ProductDAOImpl();
            Integer categoryID = 1;
            List<Product> productsByCategory = productDAO.findByCategory(categoryID);
            System.out.println("Products found by category '1':");
            for (Product product : productsByCategory) {
                System.out.println(product);
            }
        }
    }
