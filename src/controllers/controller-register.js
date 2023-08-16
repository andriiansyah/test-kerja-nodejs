// Definisikan configurasi Database
const config = require('../configs/database');

const crypto = require('crypto');

var validator = require('validator');
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
            data: '',
        });
    },
    // Fungsi untuk menyimpan data
    saveRegister(req,res){
        // Tampung inputan user kedalam varibel username, email dan password
        let username = req.body.username;
        let password = req.body.pass;
        let hashPass = hashPassword(password);
        let age = req.body.age;

        const usernameCek = validator.isEmail(username);

        const options = {
            minLength: 6,
            minUppercase: 1,
            minNumbers: 1,
            minSymbols: 0, // Opsi tambahan, bisa disesuaikan
            returnScore: false // Opsi tambahan, jika ingin mendapatkan skor kekuatan
        };

        const passCek = validator.isStrongPassword(password, options);
        const ageCek = validator.isInt(age.toString(), { min: 18 });
        console.log(passCek);
        console.log(usernameCek);
        console.log(ageCek);

        valiGagal = [];
        if(usernameCek == false || passCek == false || ageCek == false) {
            if(usernameCek == false) {
                const push1 = {email: "Email tidak valid"};
                valiGagal.push(push1);
            }
            if(passCek == false) {
                const push2 = {password: "Password minimal 8 karakter, 1 huruf besar, 1 angka"};
                valiGagal.push(push2);
            }
            if(ageCek == false) {
                const push3 = {age: "Umur minimal 18 Tahun"};
                valiGagal.push(push3);
            }
                res.render("register",{
                    url : 'http://localhost:5050/',
                    // Kirim juga library flash yang telah di set
                    data: valiGagal,
                });
            throw '';
        }

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