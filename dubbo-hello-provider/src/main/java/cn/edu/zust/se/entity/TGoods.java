package cn.edu.zust.se.entity;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "goods")
public class TGoods {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "gname")
    private String gname;

    @Column(name = "gdesc")
    private String gdesc;

    @Column(name = "price")
    private double price;

    @Column(name = "img")
    private String img;

    @Column(name = "state")
    private int state;

    @ManyToOne(targetEntity = TStore.class)
    @JoinColumn(name = "store_id",referencedColumnName = "id")
    private TStore store;

    @Fetch(FetchMode.SUBSELECT)
    @OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY,mappedBy = "goods_id")
    private List<TCart> carts;
}
