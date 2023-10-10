const fs = require('fs');
const path = require('path');
const util = require('util');

const readdir = util.promisify(fs.readdir);
const stat = util.promisify(fs.stat);

async function listJSFiles(dir) {
  try {
    const files = await readdir(dir);
    for (const file of files) {
      const filePath = path.join(dir, file);
      const fileStat = await stat(filePath);
      
      if (fileStat.isDirectory()) {
        await listJSFiles(filePath);
      } else if (path.extname(file) === '.js') {
        console.log(filePath);
      }
    }
  } catch (err) {
    console.error(err);
  }
}

const dir = './test';
listJSFiles(dir);