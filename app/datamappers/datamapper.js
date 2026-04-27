import { client } from "../db/db-client.js";

export async function findAllCoffee(){
    const result = await client.query (`SELECT coffee.*, country.name as origin FROM "coffee" 
        JOIN "country" ON "coffee"."country_id"= "country"."id";`);
    const coffees = result.rows;
    return coffees;
};

export async function findThreeAvailibilityCoffee(){
    const result = await client.query (`SELECT * FROM "coffee" WHERE "available" = 'true' LIMIT 3;`);
    const availableCoffee = result.rows;
    return availableCoffee;
};

export async function findCoffeeByName(name){
    const result = await client.query (`SELECT coffee.*, 
        country.name AS origin, 
        JSON_AGG(category.label) AS categories
        FROM "coffee" 
        JOIN "country" ON "coffee"."country_id" = "country"."id" 
        JOIN "coffee_category" ON "coffee"."id"= "coffee_category"."coffee_id"
        JOIN "category" ON "category"."id" = "coffee_category"."category_id"
        WHERE "coffee"."name" = $1
        GROUP BY "coffee"."id", "country"."name"`, [name]);
    const coffee = result.rows;
    return coffee;
}