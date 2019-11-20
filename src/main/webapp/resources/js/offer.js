// pathname is contextRoot/path/path/ so we want to get [1] 
// that is where contextRoot is
// [0] has "" as a result of split 
var contextRoot = "/" + window.location.pathname.split('/')[1];

function addOffer() {
	var dataToSend = serializeObject($('#offerForm'));
//	JSON.stringify()
	console.log('>> contextRoot: ',contextRoot,' dataToSend: ',dataToSend);
	console.log('>> product: ',dataToSend['product']);
	
	dataToSend['product'] = {'id':parseInt(dataToSend['product'])};
	console.log('>> contextRoot: ',contextRoot,' dataToSend: ',dataToSend);
	dataToSend=JSON.stringify(dataToSend);
	console.log('>> contextRoot: ',contextRoot,' dataToSend: ',dataToSend);
//	$('#result').
	make_hidden('result');
	$.ajax({
		type : 'POST',
		url : contextRoot + '/addOffer',
		dataType : "json", 
		data : dataToSend,
		contentType : 'application/json', 
		success : function(offer) {
			console.log("data saved succuss")
			$('#result').html("");
			$("#result").append('<H3 align="center"> Saved Offer!! <H3>');
			$("#result").append('<div> Price '+offer.price+'</div>');
			$("#result").append('<div> Description '+offer.description+'</div>');
			$("#result").append('<div> product '+offer.product.title+'</div>');
			$('#result').show();
			resetForm('result');
		},

		error : function(errorObject) {
			// error: function(jqXHR, textStatus, HTTPStatus ){
			// jqXHR = jQuery XMLHttpRequest superset of XMLHttpRequest
			// EXAMPLE values: error: function(jQuery XMLHttpRequest, "error",
			// "Bad Request" ){
			// see http://api.jquery.com/jquery.ajax/

			if (errorObject.responseJSON.errorType == "ValidationError") {
				$('#result').html("");
				$("#result").append('<H3 align="center" style="color:red"> Error(s)!! <H3>');
				$("#result").append('<p>');

				var errorList = errorObject.responseJSON.errors;
				$.each(errorList, function(i, error) {
					$("#result").append('<div style = "padding: 2%;">'+error.message + '</div>');
				});
				$("#result").append('</p>');
				$('#result').show();
			} else {
				alert(errorObject.responseJSON.errors(0)); // "non" Validation
															// Error
			}
		}
	});
}

resetForm = function(id) {
	var element = document.getElementById(id);
	$(element)[0].reset();

}

make_hidden = function(id) {
	var e = document.getElementById(id);
	e.style.display = 'none';
}

make_visible = function(id) {
	var e = document.getElementById(id);
	e.style.display = 'block';
}

// Translate form to array
// Then put in JSON format
function serializeObject(form) {
	var jsonObject = {};
	var array = form.serializeArray();
	$.each(array, function() {
		jsonObject[this.name] = this.value;
	});
	return jsonObject;

};

