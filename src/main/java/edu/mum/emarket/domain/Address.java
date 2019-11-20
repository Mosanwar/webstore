package edu.mum.emarket.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.Serializable;

@Entity
public class Address implements Serializable{



	private static final long serialVersionUID = -530086768384258062L;
	
 	private String streetName ;
 	private String state;
	private String country;
	@Id
	private String zipCode;
 	public String getStreetName() {
		return streetName;
	}
	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}
 	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
 }
