// import connection
import db from "../config/database.js";

// get newest Bill Status
export const getNewestId = (result) => {
    db.query("SELECT id_detail_pesanan FROM Detail_Pesanan ORDER BY id_detail_pesanan DESC LIMIT 1", (err, results) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results[0]);
        }
    });
};

// insert Bill Status
export const insertBillStatus = (data, result) => {
    const { jumlah_menu, total_harga, catatan_khusus, status_pesanan, pesanan_dp_id_pesanan } = data;
    db.query("INSERT INTO Detail_Pesanan (jumlah_menu, total_harga, catatan_khusus, status_pesanan, pesanan_dp_id_pesanan) VALUES (?, ?, ?, ?, ?)", 
    [jumlah_menu, total_harga, catatan_khusus, status_pesanan, pesanan_dp_id_pesanan], 
    (err, results) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });
};

// get all Bills Status by User
export const getBillsByUser = (id, result) => {
    db.query("SELECT * FROM Detail_Pesanan dp JOIN Pesanan p ON dp.pesanan_dp_id_pesanan = p.id_pesanan WHERE p.pembeli_ps_id_pembeli = ?", [id], (err, results) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });
};

// get all Bills Status by Bill
export const getBillsByBill = (id, result) => {
    db.query("SELECT * FROM Detail_Pesanan WHERE pesanan_dp_id_pesanan = ?", [id], (err, results) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });
};

// get all Bills Status
export const getAll = (result) => {
    db.query("SELECT * FROM Detail_Pesanan", (err, results) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });
};

// update Status
export const updateStatus = (id, newStatus, result) => {
    db.query("UPDATE Detail_Pesanan SET status_pesanan = ? WHERE id_detail_pesanan = ?", [newStatus, id], (err, results) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });
};

// update Paid
export const updatePaid = (id, result) => {
    db.query("UPDATE Detail_Pesanan SET status_pesanan = 'Paid' WHERE id_detail_pesanan = ?", [id], (err, results) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });
};

// cancel Status
export const cancelStatus = (id, result) => {
    db.query("UPDATE Detail_Pesanan SET status_pesanan = 'Cancelled' WHERE id_detail_pesanan = ?", [id], (err, results) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });
};
