import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import fetch from "node-fetch";

admin.initializeApp()

export const fetchRates = functions.pubsub.schedule("25 14 * * *").onRun(async (context) => {
    const response = await fetch("https://api.exchangerate.host/latest?base=eur");
    console.log(response.json());
});
