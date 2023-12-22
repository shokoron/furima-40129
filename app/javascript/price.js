function price() {
  const priceInput = document.getElementById('item-price');
  const taxPriceOutput = document.getElementById('add-tax-price');
  const profitOutput = document.getElementById('profit');
  
  priceInput.addEventListener('input', () => {
    const price = parseInt(priceInput.value) || 0;

    const taxRate = 0.1;
    const taxPrice = Math.floor(price * taxRate);
    const profit = price - taxPrice;

    taxPriceOutput.textContent = taxPrice.toLocaleString();
    profitOutput.textContent = profit.toLocaleString();

  });
};

window.addEventListener('turbo:load', price);
