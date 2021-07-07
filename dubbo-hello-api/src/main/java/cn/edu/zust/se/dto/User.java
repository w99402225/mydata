package cn.edu.zust.se.dto;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class User implements Serializable {
    private Integer id;
    private String username;
    private String password;
    private String type;
    private String address;
}
