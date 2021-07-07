package cn.edu.zust.se.dto;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class Cart implements Serializable {
    private Integer id;
    private Goods goods_id;
    private UserDto user_id;
    private int amount;
    private int goodsid;
    private int userid;
}
