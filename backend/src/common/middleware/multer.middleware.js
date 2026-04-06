const mluter = require('multer');

//store in memory(temporary)

const storage = mluter.memoryStorage();

const upload = mluter({ storage });

module.exports = upload;