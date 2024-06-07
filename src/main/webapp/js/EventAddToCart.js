function addToCart(productId) {
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "add-cart", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            window.location.reload();
        }
    };

    xhr.send("id=" + productId);
}