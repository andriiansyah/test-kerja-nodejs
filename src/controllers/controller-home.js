const config = require('../configs/database');

let mysql      = require('mysql');
let pool       = mysql.createPool(config);

pool.on('error',(err)=> {
    console.error(err);
});

// module.exports ={
//     home(req,res){
//         res.render("home",{
//             url: 'http://localhost:5050/',
//             userName: req.session.username,
//         });
//     }
// }

module.exports ={
    home(req,res){
        let id = req.session.userid
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
                SELECT * FROM user;
                `
            , function (error, results) {
                if(error) throw error;
                res.render("home",{
                    url: 'http://localhost:5050/',
                    userName: req.session.username,
                    data: results,
                });
            });
            connection.release();
        })
    }
}