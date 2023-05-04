 function show() {
      document.querySelector(".background").className = "background show";
    }

    function close() {
      document.querySelector(".background").className = "background";
    }

    document.querySelector("#watchlist_button").addEventListener("click", show);
    document.querySelector("#close").addEventListener("click", close);

    
    function brandClick(){
	var doc1 = document.getElementById("main_page");
	doc1.src="Main_0427.jsp";
}

function forPopup(storeCode){
	var doc1 = document.getElementById("main_page");
	doc1.src= "Store_0427.jsp?storeCode="+storeCode;
//	var doc1 = document.getElementById("a_store"+ii);
	
//	doc1.href="../../Store.jsp?storeCode="+storeCode;
}

