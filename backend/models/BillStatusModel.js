// import connection
import db from "../config/database.js";

// get newest Bill Status
export const getNewestId = (result) => {
    db.query("SELECT id_pesanan FROM Pesanan ORDER BY id_pesanan DESC LIMIT 0, 1", (err,results)=> {
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
    db.query("INSERT INTO Pesanan SET ?",data, (err,results)=> {
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
    db.query("SELECT * FROM Pesanan WHERE pembeli_ps_id_pembeli = ?", [id], (err, results) => {
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
    db.query("SELECT * FROM Pesanan WHERE id_pesanan = ?", [id], (err, results) => {
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
    db.query("SELECT * FROM Pesanan", (err, results) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });
};

//update Status
// export const updateStatus = (id, newStatus, result) => {
//     db.query("UPDATE Pesanan SET status_pesanan = ? WHERE id_pesanan = ?", [newStatus, id], (err, results) => {
//         if (err) {
//             console.log(err);
//             result(err, null);
//         } else {
//             result(null, results);
//         }
//     });
// };


// export const updateStatus = (id, newStatus, result) => {
//     console.log('Updating status for order ID:', id, 'to new status:', newStatus);
    
//     // Check if id and newStatus are valid
//     if (!id || !newStatus) {
//         const errorMsg = 'Invalid id or newStatus';
//         console.log(errorMsg);
//         return result(new Error(errorMsg), null);
//     }

//     const query = "UPDATE Pesanan SET status_pesanan = ? WHERE id_pesanan = ?";
//     db.query(query, [newStatus, id], (err, results) => {
//         if (err) {
//             console.error('Error executing query:', err);
//             result(err, null);
//         } else {
//             console.log('Query results:', results);
//             result(null, results);
//         }
//     });
// };

export const updateStatus = (id,result) => {
    db.query("UPDATE Pesanan SET status_pesanan = status_pesanan + 1  WHERE id_pesanan = ?",id, (err,results)=> {
        if (err){
            console.log(err);
            result(err,null);
        }else{
            result(null,results);
        }
    });
};

// cancel Status
export const cancelStatus = (id, result) => {
    db.query("UPDATE Pesanan SET status_pesanan = 'Cancelled' WHERE id_pesanan = ?", [id], (err, results) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });
};
