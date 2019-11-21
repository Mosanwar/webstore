package edu.mum.emarket.domain;


import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "PRODUCT")
public class Product implements Serializable {

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@NotEmpty
	private String productTitle;

	private long unitsInStock;

	@Column(name = "PRODUCT_ID")
	private String productId;
	@Column(name = "DESCRIPTION")
	private String description;
	@Column(name = "PRICE")
	private BigDecimal price;
	public BigDecimal getPrice() {
		return price;
	}

	@Column(name = "CITY")
	private String city;
	@Column(name = "COUNTRY")
	private String country;

	@ManyToOne
	@JoinColumn(name = "CATEGORY_ID")
	private Category category;


	@ManyToOne
	@JoinColumn(name = "USER_ID")
	@JsonIgnoreProperties(value = { "offers", "products", "makeReports", "hasReports" })
	private User user;

	@OneToMany(fetch = FetchType.EAGER, targetEntity = Offer.class, mappedBy = "product")
	@JsonIgnoreProperties(value = { "product" })
	private Set<Offer> offers;

//	@OneToMany(fetch = FetchType.EAGER, targetEntity = Photo.class, mappedBy = "product", cascade = CascadeType.ALL)
//	@JsonIgnoreProperties(value = { "product" })
//	private Set<Photo> photos;
	
//	@OneToOne( cascade = CascadeType.ALL)
//	@JsonIgnoreProperties(value = { "product" })
//	@JoinColumn(name="photo_")
	private String photo;

	@Transient
	private MultipartFile productImage;
	

	public Product() {
	}

	public Product(long id, String title, String description, LocalDate expirDate, BigDecimal price, String city,
			String country) {
		this.id = id;
		this.productTitle = title;
		this.description = description;
		this.price = price;
		this.city = city;
		this.country = country;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getProductTitle() {
		return productTitle;
	}

	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Set<Offer> getOffers() {
		return offers;
	}

	public void setOffers(Set<Offer> offers) {
		this.offers = offers;
	}

//	public Set<Photo> getPhotos() {
//		return photos;
//	}
//
//	public void setPhotos(Set<Photo> photos) {
//		this.photos = photos;
//	}
	

	public MultipartFile getProductImage() {
		return productImage;
	}

//	public Photo getPhoto() {
//		return photo;
//	}
//
//	public void setPhoto(Photo photo) {
//		this.photo = photo;
//	}
	
	

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	

}
