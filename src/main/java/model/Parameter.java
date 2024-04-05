package model;

import java.sql.Date;

public class Parameter {
    private String id;
    private double numberCustomer;
    private double numberProduct;
    private double numberOrder;
    private double revenue;
    private Date updateDate;
    public Parameter() {
    }

    public Parameter(String id, double numberCustomer, double numberProduct, double numberOrder, double revenue, Date updateDate) {
        this.id = id;
        this.numberCustomer = numberCustomer;
        this.numberProduct = numberProduct;
        this.numberOrder = numberOrder;
        this.revenue = revenue;
        this.updateDate = updateDate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public double getNumberCustomer() {
        return numberCustomer;
    }

    public void setNumberCustomer(double numberCustomer) {
        this.numberCustomer = numberCustomer;
    }

    public double getNumberProduct() {
        return numberProduct;
    }

    public void setNumberProduct(double numberProduct) {
        this.numberProduct = numberProduct;
    }

    public double getNumberOrder() {
        return numberOrder;
    }

    public void setNumberOrder(double numberOrder) {
        this.numberOrder = numberOrder;
    }

    public double getRevenue() {
        return revenue;
    }

    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    @Override
    public String toString() {
        return "Parameter{" +
                "id='" + id + '\'' +
                ", number_cus=" + numberCustomer +
                ", number_pro=" + numberProduct +
                ", number_ord=" + numberOrder +
                ", revenue=" + revenue +
                ", update_date=" + updateDate +
                '}';
    }
}