package edu.mum.emarket.domain;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "PERSON")
@Inheritance(strategy = InheritanceType.JOINED)
public class Person {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	@Column(name = "NAME")
	@NotEmpty
	private String name;

	@Email(message = "please enter valid email")
	@Column(name = "EMAIL", nullable = false, unique = true)
	@NotEmpty
	private String email;

	@Column(name = "PASSWORD", nullable = false)
	@NotEmpty @Size(min = 6, max = 100)
	private String password;

	@Column(name = "PHONR")
	private String phone;
	
	@Column(name = "ADDRESS")
	private String address;

	@Column(name = "ROLE")
	private PersonType role = PersonType.user;

//
	public Person() {
		// TODO Auto-generated constructor stub
	}

	public Person(long id, String name, String email, String password, String phone, String address, PersonType role) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.address = address;
		this.role = role;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public PersonType getRole() {
		return role;
	}

	public void setRole(PersonType role) {
		this.role = role;
	}

}