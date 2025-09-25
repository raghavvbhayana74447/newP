const express = require('express');
const app = express();
const port = 3000;

// Prod environment message
app.get('/', (req, res) => {
  res.send('<h1>Hello from PROD Environment íº€</h1>');
});

app.listen(port, () => {
  console.log(`Prod app running at http://localhost:${port}`);
});

