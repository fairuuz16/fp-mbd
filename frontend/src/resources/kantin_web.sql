-- Active: 1718165534569@@127.0.0.1@3306@fp_mbd

DROP DATABASE IF EXISTS fp_mbd;
CREATE DATABASE fp_mbd
    DEFAULT CHARACTER SET = 'utf8mb4';

USE fp_mbd;

CREATE TABLE Penjual (
    id_penjual CHAR(5) PRIMARY KEY,
    nama_penjual VARCHAR(100),
    email_penjual VARCHAR(100),
    password_penjual VARCHAR(100),
    status_penjual INT
) ENGINE=INNODB;

CREATE TABLE Pembeli (
    id_pembeli INT AUTO_INCREMENT PRIMARY KEY,
    nama_pembeli VARCHAR(100),
    email_pembeli VARCHAR(100),
    password_pembeli VARCHAR(100)
) ENGINE=INNODB;

CREATE TABLE Pegawai (
    nik CHAR(16) PRIMARY KEY,
    nama_pegawai VARCHAR(100),
    email_pegawai VARCHAR(100),
    password_pegawai VARCHAR(100),
    penjual_pg_id_penjual CHAR(5),
    FOREIGN KEY (penjual_pg_id_penjual) REFERENCES Penjual(id_penjual)
) ENGINE=INNODB;

CREATE TABLE Menu (
    id_menu CHAR(5) PRIMARY KEY,
    nama_menu VARCHAR(100),
    durasi_memasak VARCHAR(8),
    stok_menu INT,
    harga_menu DECIMAL(7,2),
    jenis_menu VARCHAR(50),
    vote_menu VARCHAR(100),
    star_menu VARCHAR(10), -- seasonal/best seller
    status_menu VARCHAR(100), -- di menu 
    diskon_menu VARCHAR(100), -- promo di page home + promotion ?
    src_menu VARCHAR(100), -- link gambar
    penjual_me_id_penjual CHAR(5),
    FOREIGN KEY (penjual_me_id_penjual) REFERENCES Penjual(id_penjual)
) ENGINE=INNODB;

CREATE TABLE Pesanan (
    id_pesanan CHAR(5) PRIMARY KEY,
    waktu_pesanan TIMESTAMP,
    pembeli_ps_id_pembeli INT,
    penjual_ps_id_penjual CHAR(5),
    FOREIGN KEY (pembeli_ps_id_pembeli) REFERENCES Pembeli(id_pembeli),
    FOREIGN KEY (penjual_ps_id_penjual) REFERENCES Penjual(id_penjual)
) ENGINE=INNODB;

CREATE TABLE Pesanan_Menu (
    pesanan_pm_id_pesanan CHAR(5),
    menu_id_menu CHAR(5),
    FOREIGN KEY (pesanan_pm_id_pesanan) REFERENCES Pesanan(id_pesanan),
    FOREIGN KEY (menu_id_menu) REFERENCES Menu(id_menu)
) ENGINE=INNODB;

CREATE TABLE Detail_Pesanan (
    id_detail_pesanan CHAR(5) PRIMARY KEY,
    jumlah_menu INT,
    total_harga DECIMAL(7,2),
    catatan_khusus VARCHAR(100),
    status_pesanan VARCHAR(100),
    pesanan_dp_id_pesanan CHAR(5),
    FOREIGN KEY (pesanan_dp_id_pesanan) REFERENCES Pesanan(id_pesanan)
) ENGINE=INNODB;


INSERT INTO Penjual (id_penjual, nama_penjual, email_penjual, password_penjual, status_penjual) 
VALUES 
('P0001', 'Ombens', 'ombens@example.com', 'ombens123', 1),
('P0002', 'Bu Sol', 'buSol@example.com', 'Busol567', 1),
('P0003', 'Mak Nanun', 'nanuni@example.com', 'nanuni5sd67', 1),
('P0004', 'Kantin Mungil', 'mungilkah@example.com', 'IYANich567', 1),
('P0005', 'Warung Sederhana', 'sederhana@mail.com', 'password123', 1),
('P0006', 'Resto Padang', 'padang@mail.com', 'password123', 1);

SELECT * FROM Penjual;


INSERT INTO Pembeli (nama_pembeli, email_pembeli, password_pembeli)
VALUES 
('Adi Cahyono', 'adi.cahyono@example.com', 'adicahyono123'),
('Budi Santoso', 'budi.santoso@example.com', 'budisantoso456'),
('Citra Wijaya', 'citra.wijaya@example.com', 'citrawijaya789'),
('Dewi Lestari', 'dewi.lestari@example.com', 'dewilestari123'),
('Eka Putri', 'eka.putri@example.com', 'ekaputri456');

SELECT * FROM Pembeli;

INSERT INTO Pegawai (nik, nama_pegawai, email_pegawai, password_pegawai, penjual_pg_id_penjual)
VALUES
('7682154936278592', 'Rina Fitriana', 'rina.fitriana@example.com', 'pass123', 'P0001'),
('9013746281937462', 'Budi Santoso', 'budi.santoso@example.com', 'budi456', 'P0002'),
('5129374658123490', 'Siti Nurul', 'siti.nurul@example.com', 'siti789', 'P0003'),
('6048912375648392', 'Ahmad Maulana', 'ahmad.maulana@example.com', 'ahmad1234', 'P0004');

SELECT * FROM Pegawai;

INSERT INTO Menu (id_menu, nama_menu, durasi_memasak, stok_menu, harga_menu, jenis_menu, vote_menu, star_menu, status_menu, diskon_menu, src_menu, penjual_me_id_penjual)
VALUES
('M0001', 'Es Teh Tarik', '00:05:00', 20, 15000.00, 'Minuman', '100', '4.5', 'best seller', 2000.00, 'drink/1-1.png', 'P0001'),
('M0002', 'Nutrisari Jeruk', '00:05:00', 2, 10000.00, 'Minuman', '500','2.0' ,'best seller', 0.00, 'drink/1-2.png', 'P0001'),
('M0003', 'Es Jeruk', '00:05:00', 4, 7000.00, 'Minuman', '1000', '4.0', 'seasonal dishes', 0.00, 'drink/1-3.png', 'P0001'),
('M0004', 'Es Teh', '00:05:00', 20, 6000.00, 'Minuman', '500', '3.5', 'best seller', 1000.00, 'drink/1-4.png', 'P0001'),
('M0005', 'Es Matcha', '00:05:00', 2, 7500.00, 'Minuman', '2', '2.5', 'new dishes', 1500.00, 'drink/1-5.png', 'P0001'),
('M0006', 'Ice Milk Tea', '00:05:00', 12, 7000.00, 'Minuman', '500', '3.0', 'best seller', 0.00, 'drink/1-6.png', 'P0001'),
('M0007', 'Kopi Panas', '00:05:00', 3, 7000.00, 'Minuman', '10', '2.0', 'seasonal dishes', 0.00, 'drink/1-7.png', 'P0001'),
('M0008', 'Es Moccacino', '00:05:00', 4, 7500.00, 'Minuman', '11', '4.5', 'new dishes', 0.00, 'drink/1-8.png', 'P0001'),
('M0009', 'Chocolate Blend', '00:08:00', 10, 8000.00, 'Minuman', '58', '3.5', 'seasonal dishes', 0.00, 'drink/1-9.png', 'P0001'),
('M0010', 'Ice Good Day', '00:05:00', 3, 7500.00, 'Minuman', '10', '2.5', 'best seller', 0.00, 'drink/1-10.png', 'P0001'),
('M0011', 'Nasi Kuning', '00:04:00', 110, 15000.00, 'Makanan', '800', '4.5', 'best seller', 2000.00, 'food/2-1.png', 'P0002'),
('M0012', 'Chicken Crispy', '00:08:00', 12, 13000.00, 'Makanan', '800', '4.0', 'seasonal dishes', 0.00, 'food/2-2.png', 'P0002'),
('M0013', 'Batagor', '00:01:00', 3, 6000.00, 'Makanan', '100', '3.5', 'new dishes', 0.00, 'food/2-3.png', 'P0002'),
('M0014', 'Nasi Cumi Hitam', '00:07:00', 4, 14000.00, 'Makanan', '10', '3.0', 'seasonal dishes', 0.00, 'food/2-4.png', 'P0002'),
('M0015', 'Nasi Pecel', '00:07:00', 20, 14000.00, 'Makanan', '50', '2.5', 'regular', 0.00, 'food/2-5.png', 'P0002'),
('M0016', 'Nasi Ayam Goreng', '00:10:00', 12, 8000.00, 'Makanan', '75', '4.0', 'best seller', 0.00, 'food/2-6.png', 'P0002'),
('M0017', 'Nasi Dendeng', '00:10:00', 2, 12000.00, 'Makanan', '65', '3.5', 'best seller', 0.00, 'food/2-7.png', 'P0002'),
('M0018', 'Nasi Chicken Grill', '00:10:00', 12, 12000.00, 'Makanan', '90', '3.0', 'regular', 0.00, 'food/2-8.png', 'P0002'),
('M0019', 'Nasi Ayam Cabe', '00:10:00', 20, 16000.00, 'Makanan', '80', '2.5', 'regular', 0.00, 'food/2-9.png', 'P0002'),
('M0020', 'Nasi Goreng', '00:10:00', 30, 11000.00, 'Makanan', '100', '4.5', 'regular', 0.00, 'food/2-10.png', 'P0002'),
('M0021', 'Nasi Rawon', '00:10:00', 30, 20000.00, 'Makanan', '90', '4.0', 'seasonal dishes', 8000.00, 'food/3-1.png', 'P0003'),
('M0022', 'Kwetiau Goreng', '00:12:00', 15, 16000.00, 'Makanan', '85', '3.5', 'best seller', 0.00, 'food/3-2.png', 'P0003'),
('M0023', 'Mie Ayam Pangsit', '00:08:00', 15, 14000.00, 'Makanan', '75', '3.0', 'best seller', 0.00, 'food/3-3.png', 'P0003'),
('M0024', 'Mie Ayam Pangsit Bakso', '00:08:00', 14, 16000.00, 'Makanan', '70', '2.5', 'regular', 0.00, 'food/3-4.png', 'P0003'),
('M0025', 'Mie Ayam Pangsit Ceker', '00:10:00', 10, 16000.00, 'Makanan', '60', '4.5', 'new dishes', 0.00, 'food/3-5.png', 'P0003'),
('M0026', 'Pisang Goreng', '00:05:00', 3, 6000.00, 'Makanan', '45', '4.0', 'best seller', 1000.00, 'food/3-6.png', 'P0003'),
('M0027', 'Pentol', '00:05:00', 2, 6000.00, 'Makanan', '40', '3.5', 'regular', 0.00, 'food/3-7.png', 'P0003'),
('M0028', 'Nasi Rames', '00:07:00', 17, 14000.00, 'Makanan', '75', '3.0', 'best seller', 3000.00, 'food/3-8.png', 'P0003'),
('M0029', 'Nasi Campur', '00:07:00', 19, 14000.00, 'Makanan', '80', '2.5', 'best seller', 1000.00, 'food/3-9.png', 'P0003'),
('M0030', 'Kopi ABC', '00:01:00', 15, 10000.00, 'Minuman', '50', '4.5', 'regular', 0.00, 'drink/4-1.png', 'P0004'),
('M0031', 'Larutan', '00:01:00', 3, 6000.00, 'Minuman', '30', '4.0', 'regular', 0.00, 'drink/4-2.png', 'P0004'),
('M0032', 'Ultra Milk', '00:01:00', 18, 9000.00, 'Minuman', '55', '3.5', 'regular',  0.00, 'drink/4-3.png', 'P0004'),
('M0033', 'STee', '00:01:00', 8, 4000.00, 'Minuman', '20', '4.8', 'best seller', 0.00, 'drink/4-4.png', 'P0004'),
('M0034', 'Club', '00:01:00', 90, 3000.00, 'Minuman', '100', '4.7', 'best seller', 0.00, 'drink/4-5.png', 'P0004'),
('M0035', 'Pocari Sweat', '00:01:00', 21, 10000.00, 'Minuman', '70', '4.5', 'regular', 0.00, 'drink/4-6.png', 'P0004'),
('M0036', 'Vit C', '00:01:00', 4, 9000.00, 'Minuman', '25', '4.2', 'new dishes', 0.00, 'drink/4-7.png', 'P0004'),
('M0037', 'Teh Botol', '00:01:00', 26, 10000.00, 'Minuman', '85', '4.6', 'regular', 0.00, 'drink/4-8.png', 'P0004'),
('M0038', 'Kopi Kenangan', '00:01:00', 14, 10000.00, 'Minuman', '60', '4.9', 'best seller', 0.00, 'drink/4-9.png', 'P0004'),
('M0039', 'Fanta', '00:01:00', 3, 8000.00, 'Minuman', '40', '4.1', 'regular', 0.00, 'drink/4-10.png', 'P0004'),
('M0040', 'Nasi Uduk', '00:10:00', 30, 12000.00, 'Makanan', '100', '4.3', 'new dishes', 0.00, 'food/5-1.png', 'P0005'),
('M0041', 'Rendang', '00:15:00', 20, 25000.00, 'Makanan', '90', '4.8', 'best seller', 10000.00, 'food/5-2.png', 'P0005'),
('M0042', 'Gado-Gado', '00:10:00', 25, 14000.00, 'Makanan', '85', '4.5', 'regular', 2000.00, 'food/5-3.png', 'P0005'),
('M0043', 'Sate Ayam', '00:12:00', 30, 18000.00, 'Makanan', '100', '4.7', 'regular', 0.00, 'food/5-4.png', 'P0005'),
('M0044', 'Sate Kambing', '00:15:00', 15, 22000.00, 'Makanan', '80', '4.6', 'seasonal dishes', 0.00, 'food/5-5.png', 'P0005'),
('M0045', 'Es Cendol', '00:05:00', 40, 8000.00, 'Minuman', '100', '4.5', 'regular', 0.00, 'drink/5-6.png', 'P0005'),
('M0046', 'Jus Alpukat', '00:07:00', 20, 12000.00, 'Minuman', '90', '4.8', 'best seller', 0.00, 'drink/5-7.png', 'P0005'),
('M0047', 'Jus Mangga', '00:07:00', 25, 10000.00, 'Minuman', '80', '4.4', 'regular', 0.00, 'drink/5-8.png', 'P0005'),
('M0048', 'Sop Buntut', '00:20:00', 10, 30000.00, 'Makanan', '70', '4.5', 'regular', 0.00, 'food/5-9.png', 'P0005'),
('M0049', 'Ayam Bakar', '00:15:00', 20, 20000.00, 'Makanan', '90', '4.7', 'best seller', 0.00, 'food/5-10.png', 'P0005'),
('M0050', 'Ikan Bakar', '00:18:00', 15, 22000.00, 'Makanan', '85', '4.6', 'regular', 2000.00, 'food/5-11.png', 'P0005'),
('M0051', 'Rendang Daging', '00:20:00', 20, 30000.00, 'Makanan', '100', '4.9', 'best seller', 5000.00, 'food/6-1.png', 'P0006'),
('M0052', 'Ayam Pop', '00:15:00', 25, 25000.00, 'Makanan', '90', '4.8', 'best seller', 0.00, 'food/6-2.png', 'P0006'),
('M0053', 'Dendeng Balado', '00:18:00', 15, 28000.00, 'Makanan', '85', '4.5', 'seasonal dishes', 0.00, 'food/6-3.png', 'P0006'),
('M0054', 'Gulai Ikan', '00:17:00', 20, 26000.00, 'Makanan', '80', '4.4', 'seasonal dishes', 6000.00, 'food/6-4.png', 'P0006'),
('M0055', 'Soto Padang', '00:15:00', 20, 22000.00, 'Makanan', '75', '4.3', 'new dishes', 0.00, 'food/6-5.png', 'P0006'),
('M0056', 'Sate Padang', '00:12:00', 25, 23000.00, 'Makanan', '85', '4.7', 'best seller', 0.00, 'food/6-6.png', 'P0006'),
('M0057', 'Telur Barendo', '00:08:00', 30, 15000.00, 'Makanan', '80', '4.4', 'seasonal dishes', 0.00, 'food/6-7.png', 'P0006'),
('M0058', 'Perkedel Kentang', '00:07:00', 35, 12000.00, 'Makanan', '90', '4.6', 'regular', 0.00, 'food/6-8.png', 'P0006'),
('M0059', 'Gulai Kikil', '00:15:00', 20, 25000.00, 'Makanan', '85', '4.5', 'regular', 5000.00, 'food/6-9.png', 'P0006'),
('M0060', 'Es Teh Manis', '00:05:00', 50, 5000.00, 'Minuman', '100', '4.3', 'regular', 0.00, 'drink/6-10', 'P0006'),
('M0061', 'Es Jeruk', '00:05:00', 40, 7000.00, 'Minuman', '90', '4.4', 'best seller', 0.00, 'drink/6-11', 'P0006'),
('M0062', 'Teh Panas', '00:03:00', 30, 4000.00, 'Minuman', '80', '4.2', 'regular', 0.00, 'drink/6-12', 'P0006'),
('M0063', 'Kopi Hitam', '00:05:00', 20, 6000.00, 'Minuman', '70', '4.1', 'regular', 0.00, 'drink/6-13', 'P0006');

SELECT * FROM Menu;

INSERT INTO Pesanan (id_pesanan, waktu_pesanan, pembeli_ps_id_pembeli, penjual_ps_id_penjual) 
VALUES 
('P0001', '2022-05-01 12:00:00', 1, 'P0001'),
('P0002', '2022-05-02 12:00:00', 2, 'P0002'),
('P0003', '2022-05-03 12:00:00', 3, 'P0003'),
('P0004', '2022-05-04 12:00:00', 4, 'P0004');

SELECT * FROM Pesanan;

INSERT INTO Pesanan_Menu (pesanan_pm_id_pesanan, menu_id_menu)
VALUES
('P0001', 'M0001'),
('P0001', 'M0002'),
('P0001', 'M0003'),
('P0002', 'M0004'),
('P0002', 'M0005'),
('P0002', 'M0006'),
('P0003', 'M0007'),
('P0004', 'M0008');

SELECT * FROM Pesanan_Menu;

INSERT INTO Detail_Pesanan (id_detail_pesanan, jumlah_menu, total_harga, catatan_khusus, status_pesanan, pesanan_dp_id_pesanan)
VALUES
('D0001', 2, 30000.00, 'Tidak pakai gula', 'dibayar', 'P0001'),
('D0002', 3, 21000.00, 'Tidak pakai es', 'dibayar', 'P0002'),
('D0003', 1, 7000.00, 'Tidak pakai gula', 'dibayar', 'P0003'),
('D0004', 2, 14000.00, 'Tidak pakai es', 'dibayar', 'P0004');

SELECT * FROM Detail_Pesanan;
