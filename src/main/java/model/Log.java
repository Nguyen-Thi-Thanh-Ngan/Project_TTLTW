package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import utils.LevelLog;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Log {
    private Integer id;
    private LevelLog level;
    private String action;
    private String addressIP;
    private Integer userId;
    private LocalDate createdAt;
}
