var contextRoot = "/" + window.location.pathname.split('/')[1];

var socket = new SockJS(contextRoot+"/offer-stomp-endpoint");
var stompClient = Stomp.over(socket);

// Callback function[renderPrice] to be called when stomp client is connected to
// server
var connectCallback = function() {
	console.log('***** subscript onconnectCallback:  /offer')
	stompClient.subscribe('/offer', renderPrice);
};



// Render price data from server into HTML, registered as callback
// when subscribing to price topic
function renderPrice(frame) {
	console.log('>>>>(renderPrice) web socket recieved : ',message)
	console.log('>>>>(renderPrice) web socket body recieved : ', JSON.parse(message.body))
//	var prices = JSON.parse(frame.body);
//	$('#priceDisplay').empty();
//	for ( var i in prices) {
//		var price = prices[i];
//		$('#priceDisplay').append(
//				price.code + ':$' + price.price.toFixed(2) + '   ');
//
//	}
}

// Callback function to be called when stomp client could not connect to server
var errorCallback = function(error) {
	alert(error.headers.message);
};

// Connect to server via websocket
// with function to display stock in banner[connectCallback]
// and function to handle errors [errorCallback]
stompClient.connect("guest", "guest", connectCallback, errorCallback);

// Register handler for add button
// calls server to save stock
//$(document).ready(function() {
//	$('.add').click(function(e) {
//		e.preventDefault();
//		var code = $('.new .code').val();
//		var price = Number($('.new .price').val());
//		var sendData = JSON.stringify({
//			'code' : code,
//			'price' : price
//		});
//		stompClient.send("/TickerApp/addStock", {}, sendData);
//		return false;
//	});
//});
//
//// Register handler for remove all button
//// calls server to delete all stocks
//$(document).ready(function() {
//	$('.remove-all').click(function(e) {
//		e.preventDefault();
//		stompClient.send("/TickerApp/removeAllStocks");
//		return false;
//	});
//});

var subscriptOffer = function(){
	console.log('>>>> load offers page ajax <<<<'+contextRoot);
	
//	var wsocket = new SockJS(contextRoot+"/gkz-stomp-endpoint");
//	var client = Stomp.over(wsocket);
//	var socket = new SockJS(contextRoot+"/gkz-stomp-endpoint");
//	var stompClient = Stomp.over(socket);
	stompClient.connect({}, function(frame) {
		console.log('*** start subscription <<<')
		stompClient.subscribe('/offer', function (message) {
	    	console.log('>>>> web socket body recieved : ', JSON.parse(message.body));
			let offer = message.body;
//	    	$('#result').html("");
			$("#result").append('<div><H3 align="center"> A new Offer Added!! <H3>');
			$("#result").append('<div> Price '+offer.price+'</div>');
			$("#result").append('<div> Description '+offer.description+'</div>');
//			$("#result").append('<div> product '+offer.product.productTitle+'</div>');
			$("#result").append('</div>');
			$('#result').show();
//	        showMessage(JSON.parse(message.body));
	    });
	});
	
}
