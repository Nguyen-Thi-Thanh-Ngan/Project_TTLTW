package model;

import lombok.*;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
    private Integer id;
    private String name;
    private Double price;
    private ProductType productType;
    private Integer quantity;
    private Producer producer;
    private String status;
    private Date import_date;
    private Integer couponId;
    private String detail;
    private List<Image> images;
    private List<Rate> rates;
}

