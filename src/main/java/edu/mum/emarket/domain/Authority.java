package edu.mum.emarket.domain;

import javax.persistence.*;

@Entity
@Table(name = "AUTHORITY")
public class Authority {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Long id;

    @Column(name = "AUTHORITY")
    private String authority;

    @Column(name = "EMAIL")
    private String email;

    //------------------------------------constructors---------------

    public Authority() {
    }

    public Authority(String authority, String email) {
        this.authority = authority;
        this.email = email;
    }

    //------------------------------------setters and getters-------------

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
