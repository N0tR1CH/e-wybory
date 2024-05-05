import {Controller} from "@hotwired/stimulus"
import {get} from "@rails/request.js"

// Connects to data-controller="render-response"
export default class extends Controller {
    connect() {
    }

    async getElectionSheetPartial() {
        const response = await get("/elections/election_sheet_field")

        if (response.ok) {
            const body = await response.html;
            const electionSheetsSection = document.querySelector("#election_sheets");
            const templateEl = document.createElement("template");
            templateEl.innerHTML = body;

            electionSheetsSection.appendChild(templateEl.content.firstElementChild);
        }
    }
}