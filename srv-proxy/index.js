"use strict";

const express = require("express");
const http = require("http");
const xsenv = require('@sap/xsenv');

const proxy = require("@sap/cds-odata-v2-adapter-proxy");

const host = "0.0.0.0";
const port = process.env.PORT || 4004;
const target = process.env.srv_api_url || "http://localhost:8000";

(async () => {
  const app = express();

  // serve odata v2
  process.env.XS_APP_LOG_LEVEL = "warning";
  app.use(proxy({
    path: "v2",
    model: "./gen/csn.json",
    standalone: true,
    target: target,
    services: {
      "/odata/v4/": "DowntimeService",
      "/odata/v4/": "CockpitService"
    }
  }));

  // start server
  const server = app.listen(port, host, () => console.info(`app is listing at ${host}:${port}`));
  server.on("error", error => console.error(error.stack));
})();