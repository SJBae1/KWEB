const express = require('express');
const port = 3000;
const app = express();

app.use(express.urlencoded({ extended: true }));

const ObjToStr = obj => Object.keys(obj).map(k => `${k}: ${obj[k]}`).join('\n');

app.get('/', (req, res) => res.send(ObjToStr(req.query)));
app.post('/', (req, res) => res.send(ObjToStr(req.body)));
app.put('/', (req, res) => res.send(ObjToStr(req.body)));
app.delete('/', (req, res) => res.send(ObjToStr(req.body)));

app.listen(port, () => console.log(`Server listening on port ${port}!`));
