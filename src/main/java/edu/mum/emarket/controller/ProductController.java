package edu.mum.emarket.controller;

import java.io.File;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.mum.emarket.domain.Photo;
import edu.mum.emarket.domain.Product;
import edu.mum.emarket.repository.CategoryRepository;
import edu.mum.emarket.service.CategoryService;
import edu.mum.emarket.service.productService;

@Controller
public class ProductController {

	@Autowired
	productService productService;
	@Autowired
	CategoryService categoryService;

	@RequestMapping(value = { "/addProduct" }, method = RequestMethod.GET)
	public String addproduct(@ModelAttribute("product") Product product, Model model) {
		model.addAttribute("categories", categoryService.getAllCategories());
		return "addProduct";
	}

	@RequestMapping(value = { "/addProduct" }, method = RequestMethod.POST)
	public String postProduct(@Valid @ModelAttribute("product") Product product, BindingResult result,
			HttpServletRequest request) {
		
		MultipartFile productImage = product.getProductImage();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");

		if (productImage != null && !productImage.isEmpty()) {
			try {
				String path = rootDirectory + "resources\\images\\" + product.getId() + ".png";
				productImage.transferTo(new File(path));
				Photo photo = new Photo();
				photo.setUrl(path);
				Set<Photo> photos = new HashSet<Photo>();
				photos.add(photo);
				product.setPhotos(photos);
			} catch (Exception e) {
				throw new RuntimeException("Product Image saving failed", e);
			}
		}
		productService.addProduct(product);
		return "redirect:/";
	}

	@RequestMapping(value = { "/product" }, method = RequestMethod.GET)
	public String viewProduct() {
		return "product";
	}

	@RequestMapping(value = { "/editProduct" }, method = RequestMethod.GET)
	public String editproduct(@RequestParam("id") int id, Model model) {
		Product product = productService.getProductById(id);
		model.addAttribute("product", product);
		return "editProduct";
	}

	@RequestMapping(value = { "/editProduct" }, method = RequestMethod.POST)
	public String postEdit(@Valid @ModelAttribute("editedProduct") Product p, BindingResult result,
			RedirectAttributes redirectAttributes) {
		if (result.hasErrors())
			return "redirect:/editProduct";
		productService.editProduct(p);
		return "redirect:/";
	}
}
