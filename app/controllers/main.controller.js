import { findAllCoffee, findCoffeeByName, findThreeAvailibilityCoffee } from "../datamappers/datamapper.js";


export async function homePage(req, res) {
  const coffees = await findThreeAvailibilityCoffee();
  res.render("home.ejs", {coffees});
};

export async function catalogPage(req, res){
  const coffees = await findAllCoffee();
  res.render("catalog.ejs", {coffees});
};

export async function coffeeDetailPage (req, res){
  const data = req.params.name; 

  const coffees = await findCoffeeByName(data);

  res.render("detail.ejs", {coffees});
};

export function shopPage (req, res){
  res.send("la boutique est ouverte");
};

