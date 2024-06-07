package dao.impl;

import db.JDBIConnector;
import model.Producer;
import model.Product;
import model.ProductType;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class ProductDAO implements DAOInterface<Product> {
    @Override
    public List<Product> selectAll() {
        List<Product> products = JDBIConnector.getConnect().withHandle((handle -> {
            return handle.createQuery("SELECT id, name, price, product_type_id, quantity, producer_id, image FROM products")
                    .mapToBean(Product.class).list();
        }));
        return products;
    }

    @Override
    public Product selectById(Product product) {
        return null;
    }

    @Override
    public int insert(Product product) {
        int ketQua  = JDBIConnector.getConnect().withHandle(handle ->
                    handle.createUpdate("INSERT INTO products (id, name, price, product_type_id, quantity, producer_id, image) " +
                                    "VALUES (:id, :name, :price, :product_type_id, :quantity, :producer_id, :image)")
                            .bindBean(product)
                            .execute()
            );
        return ketQua;
    }

    @Override
    public int delete(Product product) {
        int ketQua = JDBIConnector.getConnect().withHandle(handle ->
                handle.createUpdate("DELETE FROM products WHERE id = :id")
                        .bind("id", product.getId())
                        .execute()
        );
        return ketQua;
    }


            @Override
    public int update(Product product) {
        int ketQua = JDBIConnector.getConnect().withHandle(handle ->
                handle.createUpdate("UPDATE products " +
                                "SET " +
                                "name = :name," +
                                "price = :price," +
                                "product_type_id = :product_type_id," +
                                "quantity = :quantity," +
                                "producer_id = :producer_id," +
                                "image = :image " +
                                "WHERE id = :id")
                        .bindBean(product)
                        .execute()
        );
        return ketQua;
    }


    public static List<Product> searchByName(String text) {
        return JDBIConnector.getConnect().withHandle(handle -> {
            String[] keywords = text.split("\\s+");
            String query = buildSearchQuery(keywords);
            return handle.createQuery(query)
                    .bindMap(bindKeywords(keywords))
                    .map((rs, ctx) -> mapToProduct(rs))
                    .list();
        });
    }

    private static String buildSearchQuery(String[] keywords) {
        StringJoiner queryBuilder = new StringJoiner(" AND ", "SELECT id, name, price, product_type_id, quantity, producer_id, image FROM products WHERE ", "");
        for (int i = 0; i < keywords.length; i++) {
            queryBuilder.add("name LIKE :keyword" + i);
        }
        return queryBuilder.toString();
    }

    public static Product getById(String id) {
        Optional<Product> product = JDBIConnector.getConnect().withHandle(handle ->
                handle.createQuery("SELECT id, name, price, product_type_id, quantity," +
                                " producer_id, image FROM products WHERE id = :id")
                        .bind("id", id)
                        .map((rs, ctx) -> {
                            String nameProduct = rs.getString("name");
                            double price = rs.getDouble("price");
                            String productType_id = rs.getString("product_type_id");
                            int quantity = rs.getInt("quantity");
                            String producer_id = rs.getString("producer_id");
                            String img = rs.getString("image");
                            Producer producer = new ProducerDAO().selectById(new Producer(producer_id, null));
                            ProductType productType = new ProductTypeDAO().selectById(new ProductType(productType_id, null));

                            Product p = new Product(id, nameProduct, price, productType, quantity, producer, img);
                            return p;
                        }).stream().findFirst()
        );
        return product.get();
    }

    public static List<Product> selectByIdProductType(String idProductType) {
        return JDBIConnector.getConnect().withHandle(handle ->
                handle.createQuery("SELECT id, name, price, product_type_id, quantity, producer_id, image FROM products WHERE product_type_id = :idProductType")
                        .bind("idProductType", idProductType)
                        .map((rs, ctx) -> {
                            Product pro = new Product();
                            pro.setId(rs.getString("id"));
                            pro.setName(rs.getString("name"));
                            pro.setPrice(rs.getDouble("price"));

                            ProductTypeDAO productTypeDAO = new ProductTypeDAO();
                            pro.setProductType(productTypeDAO.selectById(new ProductType(rs.getString("product_type_id"), null)));

                            pro.setQuantity(rs.getInt("quantity"));

                            ProducerDAO producerDAO = new ProducerDAO();
                            pro.setProducer(producerDAO.selectById(new Producer(rs.getString("producer_id"), null)));

                            pro.setImg(rs.getString("image"));

                            return pro;
                        })
                        .list()
        );
    }

    public List<Product> getPagingProducer(String idProducer, int index) {
        List<Product> ketQua = JDBIConnector.getConnect().withHandle(handle ->
                handle.createQuery("SELECT id, name, price, product_type_id, quantity, producer_id, image FROM products WHERE producer_id = :idProducer ORDER BY id LIMIT 20 OFFSET :offset")
                        .bind("idProducer", idProducer)
                        .bind("offset", (index - 1) * 20)
                        .map((rs, ctx) -> {
                            String id = rs.getString("id");
                            String nameProduct = rs.getString("name");
                            double price = rs.getDouble("price");
                            String productType_id = rs.getString("product_type_id");
                            int quantity = rs.getInt("quantity");
                            String producer_id = rs.getString("producer_id");
                            String img = rs.getString("image");

                            Producer producer = new ProducerDAO().selectById(new Producer(producer_id, null));
                            ProductType productType = new ProductTypeDAO().selectById(new ProductType(productType_id, null));
                            return new Product(id, nameProduct, price, productType, quantity, producer, img);
                        })
                        .list()
        );
        return ketQua;
    }

    public int deleteProductById(String id) {
        int ketQua = JDBIConnector.getConnect().withHandle(handle ->
                handle.createUpdate("DELETE FROM products WHERE id = :id")
                        .bind("id", id)
                        .execute()
        );
        return ketQua;
    }

    public int getNumberPage() {
        int ketQua = JDBIConnector.getConnect().withHandle(handle ->
                handle.createQuery("SELECT COUNT(id) FROM products").mapTo(Integer.class).one()
        );
        int countPage = ketQua / 20;
        if (ketQua % 20 != 0) {
            countPage++;
        }
        ketQua = countPage;

        return ketQua;
    }

    public List<Product> selectByIdProducer(String idProducer) {
        List<Product> ketQua = JDBIConnector.getConnect().withHandle(handle ->
                handle.createQuery("SELECT id, name, price, product_type_id, quantity, producer_id, image " +
                                "FROM products WHERE producer_id LIKE :idProducer")
                        .bind("idProducer", "%" + idProducer + "%")
                        .map((rs, ctx) -> new Product(
                                rs.getString("id"),
                                rs.getString("name"),
                                rs.getDouble("price"),
                                new ProductTypeDAO().selectById(new ProductType(rs.getString("product_type_id"), null)),
                                rs.getInt("quantity"),
                                new ProducerDAO().selectById(new Producer(rs.getString("producer_id"), null)),
                                rs.getString("image")
                        ))
                        .list()
        );
        return ketQua;
    }

    public static List<Product> getAll() {
        List<Product> products = JDBIConnector.getConnect().withHandle((handle -> {
            List<Product> list = new ArrayList<>();
            handle.createQuery("SELECT id, name, price, product_type_id, quantity, producer_id, image FROM products")
                    .map((rs, ctx) -> {
                        String id = rs.getString("id");
                        String nameProduct = rs.getString("name");
                        double price = rs.getDouble("price");
                        String productType_id = rs.getString("product_type_id");
                        int quantity = rs.getInt("quantity");
                        String producer_id = rs.getString("producer_id");
                        String img = rs.getString("image");
                        Producer producer = new ProducerDAO().selectById(new Producer(producer_id, null));
                        ProductType productType = new ProductTypeDAO().selectById(new ProductType(productType_id, null));

                        Product product = new Product(id, nameProduct, price, productType, quantity, producer, img);
                        list.add(product);
                        return null;
                    }).list();
            return list;
        }));
        return products;
    }

    //===========================================================================
    private static Map<String, Object> bindKeywords(String[] keywords) {
        return IntStream.range(0, keywords.length)
                .boxed()
                .collect(Collectors.toMap(i -> "keyword" + i, i -> "%" + keywords[i] + "%"));
    }

    private static Product mapToProduct(ResultSet rs) throws SQLException {
        String id = rs.getString("id");
        String name = rs.getString("name");
        double price = rs.getDouble("price");
        String productTypeId = rs.getString("product_type_id");
        int quantity = rs.getInt("quantity");
        String producerId = rs.getString("producer_id");
        String img = rs.getString("image");

        Producer producer = new ProducerDAO().selectById(new Producer(producerId, null));
        ProductType productType = new ProductTypeDAO().selectById(new ProductType(productTypeId, null));
        return new Product(id, name, price, productType, quantity, producer, img);
    }

    public List<Product> getPaging(int index) {
        int pageSize = 20;
        int offset = (index - 1) * pageSize;
       List<Product> ketQua  = JDBIConnector.getConnect().withHandle(handle ->
                    handle.createQuery("SELECT id, name, price, product_type_id, quantity, producer_id, image " +
                                    "FROM products ORDER BY id LIMIT :pageSize OFFSET :offset")
                            .bind("pageSize", pageSize)
                            .bind("offset", offset)
                            .mapToBean(Product.class)
                            .list()
            );
        return ketQua;
    }
}
