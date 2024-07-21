package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Coupon {
    private Integer id;
    private String code;
    private Integer percent_discount;
    private LocalDateTime date_start;
    private LocalDateTime date_end;
    private List<Product> products;
}
