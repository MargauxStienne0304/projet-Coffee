function handleDisplayMoreCoffees() {
  const button = document.getElementById("see-all-products-button");
  console.log("button", button);
  button.addEventListener("click", () => {
    const articlesListElem = document.getElementById("articles-list");
    articlesListElem.classList.remove("only-display-3-articles");
    button.remove();
  });
}

handleDisplayMoreCoffees();