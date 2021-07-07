package cn.edu.zust.se.dto;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
public class Store implements Serializable {
    private Integer id;
    private String sname;
    private String simg;
    private Integer userid;
}
