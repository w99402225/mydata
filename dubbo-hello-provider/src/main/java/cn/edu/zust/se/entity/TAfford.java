package cn.edu.zust.se.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@Entity
@Table(name = "afford")
public class TAfford {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @ManyToOne(targetEntity = TGoods.class )
    @JoinColumn(name="goods_id",referencedColumnName = "id")
    private TGoods goods_id;

    @ManyToOne(targetEntity = TUser.class)
    @JoinColumn(name="user_id",referencedColumnName = "id")
    private TUser user_id;

    @Column(name = "amount")
    private int amount;

    @Column(name = "price")
    private double price;

    @Column(name = "buytime")
    private Date buytime;

//    订单状态：0为待发货，1为已发货，2为确认收货
    @Column(name = "state")
    private int state;

    @Column(name = "address")
    private String address;
}