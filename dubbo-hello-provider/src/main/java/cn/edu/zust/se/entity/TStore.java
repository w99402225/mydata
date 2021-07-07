package cn.edu.zust.se.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "store")
public class TStore {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "sname")
    private String sname;

    @Column(name = "simg")
    private String simg;

    @Column(name = "user_id")
    private Integer userid;

    @OneToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER,mappedBy = "store")
    private List<TGoods> goodsList;
}
