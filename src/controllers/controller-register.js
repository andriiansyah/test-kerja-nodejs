// Definisikan configurasi Database
const config = require('../configs/database');

const crypto = require('crypto');
// Gunakan library mysql
let mysql      = require('mysql');
// Buat koneksi
let pool       = mysql.createPool(config);

// Kirim error jika koneksi gagal
pool.on('error',(err)=> {
    console.error(err);
});

function hashPassword(password) {
    const sha2Hash = crypto.createHash('sha256');
    sha2Hash.update(password);
    return sha2Hash.digest('hex');
  }

module.exports ={
    // Fungsi untuk merender file register yang ada pada folder 'src/views/register.ejs'
    formRegister(req,res){
        res.render("register",{
            // Definisikan semua varibel yang ingin ikut dirender kedalam register.ejs
            url : 'http://localhost:5050/',
        });
    },
    // Fungsi untuk menyimpan data
    saveRegister(req,res){
        // Tampung inputan user kedalam varibel username, email dan password
        let username = req.body.username;
        let password = req.body.pass;
        let hashPass = hashPassword(password);
        let age = req.body.age;
        // Pastikan semua varibel terisi
        if (username && age && password) {
            // Panggil koneksi dan eksekusi query
            pool.getConnection(function(err, connection) {
                if (err) throw err;
                connection.query(
                    `INSERT INTO user (username,password,age) VALUES (?,?,?);`
                , [username, hashPass, age],function (error, results) {
                    if (error) throw error;
                    // Jika tidak ada error, set library flash untuk menampilkan pesan sukses
                    req.flash('color', 'success');
                    req.flash('status', 'Yes..');
                    req.flash('message', 'Registrasi berhasil');
                    // Kembali kehalaman login
                    res.redirect('/login');
                });
                // Koneksi selesai
                connection.release();
            })
        } else {
            // Kondisi apabila variabel username, email dan password tidak terisi
            res.redirect('/login');
            res.end();
        }
    }
}