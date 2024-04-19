
const payment = () => {
const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const profitDom = document.getElementById("profit");

    priceInput.addEventListener("input", () => {
    const inputValue = parseFloat(priceInput.value);
    
    const salesTax = Math.floor(inputValue * 0.1); 
    
    
    const profit = inputValue - salesTax;

    addTaxDom.innerHTML = salesTax;
    profitDom.innerHTML = profit; 
});
};


window.addEventListener("turbo:load", payment);
window.addEventListener("turbo:render", payment);