<p align="center">
  <img src="brand/maat_avatar.png" width="150" alt="The Ma'at feather">
</p>

<h1 align="center">Ma'at Data</h1>

<p align="center">Company data verified against the EU's official VAT registry.<br>Runs finish even when sources fail. Pay per result.</p>

---

Ma'at is the Egyptian principle of truth, weighed against a feather. The products carry the name because every record they return states its source. A registered company name in our output is labeled `verificationSource: "VIES"` when it comes from VIES, the European Commission's VAT registry. A field read from a company website carries a lower confidence score, and the record says so.

The products are paid tools on the [Apify platform](https://apify.com/maatdata) under the handle `maatdata`. A buyer runs them from the Apify console or by API call. The same listings are exposed to AI agents through Apify's MCP integration.

## Live products

[**EU Company Enrichment with Official VAT Verification**](https://apify.com/maatdata/eu-company-enrichment-vat-verified)
VAT numbers or company domains in, verified company records out. The registered name and address come from VIES. Given only a domain, the tool reads the company's imprint or legal page, finds the VAT number there, and verifies it. Optional website firmographics add the company description, social links, public emails found on the site, and technology hints. In live testing, a French registry outage mid-run produced `MS_UNAVAILABLE` rows while the remaining countries verified normally. A 500-row CRM cleanup with the website add-on costs $9.01.

[**EU VAT Status Monitor**](https://apify.com/maatdata/eu-vat-status-monitor)
A scheduled watchdog for a supplier list. It stores each company's registry state in your Apify account and reports only the rows that changed since the last run, such as `BECAME_INVALID` or `ADDRESS_CHANGED`. A webhook fires when a watched VAT number goes invalid, in a format Zapier, Make, n8n, and Slack accept. A registry outage never destroys stored state.

Buyer guides with worked pricing examples are at [maatdata docs](https://tareketman.github.io/maatdata-docs/).

## Inside this repository

This repository is the public engineering face of the company. Product source stays closed.

| Path | What it covers |
|---|---|
| [ENGINEERING.md](ENGINEERING.md) | Architecture principles. Failure modes returned as data, the reusable state-diff monitor engine, registry grounding, publish-as-code. |
| [AI-OPERATIONS.md](AI-OPERATIONS.md) | The production methodology. One human directs two frontier-model AI agents under written quality contracts. |
| [packages/eu-vat-normalize](packages/eu-vat-normalize) | Open-source EU VAT number normalizer and format validator covering all 27 member states plus the XI prefix. MIT licensed. |

## Operator

Tarek Etman ([tarekandnati@gmail.com](mailto:tarekandnati@gmail.com)). One-person company. Two AI agents build and research under written specifications, and a human reviews everything that ships. AI-OPERATIONS.md documents the setup.
