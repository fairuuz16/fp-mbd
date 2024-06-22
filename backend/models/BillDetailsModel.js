// import connection
import db from "../config/database.js";

// insert Bill Details (Detail_Pesanan)
export const insertBillDetails = (data, result) => {
    const { id_detail_pesanan, jumlah_menu, total_harga, catatan_khusus, status_pesanan, pesanan_dp_id_pesanan } = data;
    db.query("INSERT INTO Detail_Pesanan (id_detail_pesanan, jumlah_menu, total_harga, catatan_khusus, status_pesanan, pesanan_dp_id_pesanan) VALUES (?, ?, ?, ?, ?, ?)", 
    [id_detail_pesanan, jumlah_menu, total_harga, catatan_khusus, status_pesanan, pesanan_dp_id_pesanan], 
    (err, results) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });
};

// get Bill Details (Detail_Pesanan)
export const getBillDetails = (id, result) => {
    db.query("SELECT * FROM Detail_Pesanan WHERE pesanan_dp_id_pesanan = ?", [id], (err, results) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });
};
