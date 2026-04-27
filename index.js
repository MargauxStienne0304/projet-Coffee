import "dotenv/config";
import path from "node:path";
import express from "express";
import { mainRouter } from "./app/routers/main.router.js";
import { notFoundPage } from "./app/middlewares/error.middleware.js"

const app = express();
const __dirname = import.meta.dirname;
const PORT = process.env.PORT || 3000;

app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "app/views"));

app.use(express.static(path.join(__dirname, "public")));

app.use(express.urlencoded({ extended: true }));

app.use(mainRouter);

app.use(notFoundPage);

app.listen(PORT, ()=> {
    console.log(`http://localhost:${PORT}`)
});