package cn.edu.zust.se.dto;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
public class Afford implements Serializable {
    private Integer id;
    private Goods goods_id;
    private UserDto user_id;
    private int amount;
    private double price;
    private Date buytime;
    private int goodsid;
    private int userid;
    private int state;
    private String address;
}
