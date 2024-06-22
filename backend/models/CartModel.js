// import connection
import db from "../config/database.js";

// get all items by buyer id
export const getAllItems = (id, result) => {
    db.query(`
        SELECT 
            p.id_pesanan, p.waktu_pesanan, pm.menu_id_menu, 
            m.nama_menu, m.harga_menu, dp.jumlah_menu, dp.total_harga, dp.catatan_khusus, dp.status_pesanan
        FROM Pesanan p
        JOIN Detail_Pesanan dp ON p.id_pesanan = dp.pesanan_dp_id_pesanan
        JOIN Pesanan_Menu pm ON p.id_pesanan = pm.pesanan_pm_id_pesanan
        JOIN Menu m ON pm.menu_id_menu = m.id_menu
        WHERE p.pembeli_ps_id_pembeli = ?
    `, [id], (err, results) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });
};

// get a specific item by buyer id and menu id
export const getAItem = (buyerId, menuId, result) => {
    db.query(`
        SELECT 
            p.id_pesanan, p.waktu_pesanan, pm.menu_id_menu, 
            m.nama_menu, m.harga_menu, dp.jumlah_menu, dp.total_harga, dp.catatan_khusus, dp.status_pesanan
        FROM Pesanan p
        JOIN Detail_Pesanan dp ON p.id_pesanan = dp.pesanan_dp_id_pesanan
        JOIN Pesanan_Menu pm ON p.id_pesanan = pm.pesanan_pm_id_pesanan
        JOIN Menu m ON pm.menu_id_menu = m.id_menu
        WHERE p.pembeli_ps_id_pembeli = ? AND pm.menu_id_menu = ?
    `, [buyerId, menuId], (err, results) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });
};

// insert new item to cart
export const insertToCart = (data, result) => {
    const { id_pesanan, waktu_pesanan, pembeli_ps_id_pembeli, penjual_ps_id_penjual, id_detail_pesanan, jumlah_menu, total_harga, catatan_khusus, status_pesanan, menu_id_menu } = data;
    db.query(`
        INSERT INTO Pesanan (id_pesanan, waktu_pesanan, pembeli_ps_id_pembeli, penjual_ps_id_penjual) 
        VALUES (?, ?, ?, ?)
    `, [id_pesanan, waktu_pesanan, pembeli_ps_id_pembeli, penjual_ps_id_penjual], (err, results) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            db.query(`
                INSERT INTO Detail_Pesanan (id_detail_pesanan, jumlah_menu, total_harga, catatan_khusus, status_pesanan, pesanan_dp_id_pesanan) 
                VALUES (?, ?, ?, ?, ?, ?)
            `, [id_detail_pesanan, jumlah_menu, total_harga, catatan_khusus, status_pesanan, id_pesanan], (err, results) => {
                if (err) {
                    console.log(err);
                    result(err, null);
                } else {
                    db.query(`
                        INSERT INTO Pesanan_Menu (pesanan_pm_id_pesanan, menu_id_menu) 
                        VALUES (?, ?)
                    `, [id_pesanan, menu_id_menu], (err, results) => {
                        if (err) {
                            console.log(err);
                            result(err, null);
                        } else {
                            result(null, results);
                        }
                    });
                }
            });
        }
    });
};

// update qty of a cart item
export const updateCartItemQty = (data, result) => {
    const { jumlah_menu, total_harga, pembeli_ps_id_pembeli, menu_id_menu } = data;
    db.query(`
        UPDATE Detail_Pesanan dp
        JOIN Pesanan p ON dp.pesanan_dp_id_pesanan = p.id_pesanan
        JOIN Pesanan_Menu pm ON p.id_pesanan = pm.pesanan_pm_id_pesanan
        SET dp.jumlah_menu = ?, dp.total_harga = ?
        WHERE p.pembeli_ps_id_pembeli = ? AND pm.menu_id_menu = ?
    `, [jumlah_menu, total_harga, pembeli_ps_id_pembeli, menu_id_menu], (err, results) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });
};

// delete cart item
export const deleteItemInCart = (buyerId, menuId, result) => {
    db.query(`
        DELETE dp, pm 
        FROM Pesanan p
        JOIN Detail_Pesanan dp ON p.id_pesanan = dp.pesanan_dp_id_pesanan
        JOIN Pesanan_Menu pm ON p.id_pesanan = pm.pesanan_pm_id_pesanan
        WHERE p.pembeli_ps_id_pembeli = ? AND pm.menu_id_menu = ?
    `, [buyerId, menuId], (err, results) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });
};

// delete all items by buyer id
export const deleteAllItemsByUser = (buyerId, result) => {
    db.query(`
        DELETE dp, pm 
        FROM Pesanan p
        JOIN Detail_Pesanan dp ON p.id_pesanan = dp.pesanan_dp_id_pesanan
        JOIN Pesanan_Menu pm ON p.id_pesanan = pm.pesanan_pm_id_pesanan
        WHERE p.pembeli_ps_id_pembeli = ?
    `, [buyerId], (err, results) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });
};
