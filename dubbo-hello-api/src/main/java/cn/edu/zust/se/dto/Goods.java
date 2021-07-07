package cn.edu.zust.se.dto;


import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class Goods implements Serializable {
    private Integer id;
    private String gname;
    private String gdesc;
    private double price;
    private String img;
    private Store stored;
    private int storeid;
    private int state;
}
