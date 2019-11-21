// jQuery example

$(document).ready(function() {
	
	
	var contextRoot = "/" + window.location.pathname.split( '/' )[1];

	
  
	 // Click on Product [row] in cart
       $("#products").click(function() { 
			console.log("i am herrrrre")	
    	   showProducts();
	          });

	   // Get product object from Server...
	   function showProducts() {
			$.ajax({
				type: 'GET',
				url: contextRoot + '/showAllProducts',
				dataType: "json",
			 	 success: function (response) {
			 		console.log('>>> get product success',response)	
			 		 displayProduct(response);
					},
					error: function(error){
						console.log('>>> error',error)
 			 	 } 
		   });
	   }
	   
	   function displayProduct(products) {
	 
		   	let tableTags= '<table class="table table-striped"><thead><tr> <th scope="col">Product Id</th>'+
			' <th scope="col">Product Name</th> <th scope="col">Price</th>'+
			' </tr> </thead> <tbody>';
			$('#result').html("");
			$("#result").append('<h4 align="right"> <a href="#" onclick="toggle_visibility(\'result\');"><b>CLOSE</b> </a> </h4>');
			$("#result").append( '<H3 align="center"> Products List <H3>');  
			   
 	 	        $.each(products,  function(i,product) {		
 	 	        	tableTags+='<tr> <td>'+product.id+'</td> <td>'+product.productTitle+'</td> <td>'+product.price+'</td>'+
	    				+'</tr>';
                     });
 	 	      tableTags +='</tbody> </table>';
 	 	    $("#result").append( tableTags);
			$("#result").attr("style", "display: block")
	 		} 
	 
	   toggle_visibility = function(id) {
	       var e = document.getElementById(id);
	       if(e.style.display == 'block')
	          e.style.display = 'none';
	       else
	          e.style.display = 'block';
	    }	   
// ------------------TO BE Implemented-------------------------------------
	   
/*
 * getCartId = function( ) { $.ajax({ url: '/webstore08/rest/cart/getId/', type:
 * 'GET', success : function(id) { cartId = id; } }); }
 * 
 * 
 * 
 * refreshCart = function() { getCartId(); $.ajax({ url:
 * '/webstore8/rest/cart/'+ cartId, type: 'GET', dataType: "json", success :
 * function(cartData) { } }); }
 * 
 */
});

 