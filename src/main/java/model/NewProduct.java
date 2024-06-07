package model;

public class NewProduct {
    private String id;
    private Product product;

    public NewProduct() {
    }

    public NewProduct(String id, Product product) {
        this.id = id;
        this.product = product;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "New_Product{" +
                "id='" + id + '\'' +
                ", product=" + product +
                '}';
    }
}
