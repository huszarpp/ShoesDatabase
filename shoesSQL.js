
let xmlhttpColour = new XMLHttpRequest();
xmlhttpColour.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
        document.getElementById("colours").innerHTML = this.responseText;
    }
};
xmlhttpColour.open("GET", "ColourFilter.php", true);
xmlhttpColour.send();


let xmlhttpSize = new XMLHttpRequest();
xmlhttpSize.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
        document.getElementById("sizes").innerHTML = this.responseText;
    }
};
xmlhttpSize.open("GET", "SizeFilter.php", true);
xmlhttpSize.send();


let xmlhttpCount = new XMLHttpRequest();
xmlhttpCount.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
        document.getElementById("item-number").innerHTML = this.responseText;
        let totalPages = document.getElementById("item-number").innerHTML;
        document.querySelector("#total-pages").innerHTML = Math.ceil(totalPages / 8);
    }
};
xmlhttpCount.open("GET", "ItemCounter.php", true);
xmlhttpCount.send();


function filterShoes(colour, size, order) {
    let xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            document.querySelector(".item-wrapper").innerHTML = this.responseText;
            document.querySelector("#page-number").innerHTML = "1";
        }
    };
    xmlhttp.open("GET", "shoesSQL.php?colourID=" + colour + "&sizeID=" + size + "&order=" + order, true);
    xmlhttp.send();
}


function changePage(colour, size, order, pageChange) {
    let xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            document.querySelector(".item-wrapper").innerHTML = this.responseText;
            if (pageChange == "up") {
                document.querySelector("#page-number").innerHTML += 1;
            } else {
                document.querySelector("#page-number").innerHTML -= 1;
            }
        }
    };
    let pageNumber = document.querySelector("#page-number").innerHTML;
    xmlhttp.open("GET", "shoesSQL.php?colourID=" + colour + "&sizeID=" + size + "&order=" + order + "&pageNumber=" + pageNumber + "&pageChange=" + pageChange, true);
    xmlhttp.send();
}
