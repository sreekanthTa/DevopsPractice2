const express = require('express');

const app = express();
const PORT = process.env.PORT || 3000;
app.use(express.json());

// Sample route
app.get('/', (req, res) => {
  res.send({message:'Hello, World!'});
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});

module.exports=app
