package cn.edu.zust.se.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "cart")
public class TCart {
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
}