package edu.mum.emarket.domain;


import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;


@Entity
@Table(name = "ADMIN")
@PrimaryKeyJoinColumn(name = "ID")
public class Admin extends Person {

	private static final long serialVersionUID = 1L;

	public Admin(){}

	public Admin(long id, String name, String email, String password, String phone, String address, PersonType role) {
		super(id, name, email, password, phone, address, role);

	}

}
