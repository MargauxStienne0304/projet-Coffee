import { Router } from "express";
import { homePage, 
catalogPage,
shopPage,
coffeeDetailPage } from "../controllers/main.controller.js";
export const mainRouter = Router();


mainRouter.get("/", homePage);

mainRouter.get("/catalog", catalogPage);

mainRouter.get("/boutique", shopPage);

mainRouter.get("/cafe/:name", coffeeDetailPage);