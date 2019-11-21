package edu.mum.emarket.service.impl;

import edu.mum.emarket.domain.Cart;
import edu.mum.emarket.exception.InvalidCartException;
import edu.mum.emarket.repository.CartRepository;
import edu.mum.emarket.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartRepository cartRepository;

	public Cart create(Cart cart) {
		return cartRepository.save(cart);
	}

	@Override
	public Cart read(String cartId) {
		return cartRepository.findOne(cartId);
	}

	public void update(String cartId, Cart cart) {

		cartRepository.save(cart);
	}

	public void delete(String cartId) {
		cartRepository.delete(cartId);
		
	}

	@Override
	public Cart validate(String cartId) {
		Cart cart = cartRepository.findOne(cartId);
		if(cart==null || cart.getCartItems().size()==0) {
			throw new InvalidCartException(cartId);
		}

		return cart;
	}
}
