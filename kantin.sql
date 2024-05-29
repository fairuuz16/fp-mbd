-- Active: 1702947609752@@127.0.0.1@3306@fp_mbd
-- Active: 1702947609752@@127.0.0.1@3306
CREATE DATABASE fp_mbd
    DEFAULT CHARACTER SET = 'utf8mb4';

USE fp_mbd;

CREATE TABLE Penjual (
    id_penjual CHAR(5) PRIMARY KEY,
    nama_penjual VARCHAR(100),
    email_penjual VARCHAR(100),
    password_penjual VARCHAR(100),
    status_penjual INT
);

CREATE TABLE Pembeli (
    id_pembeli CHAR(5) PRIMARY KEY,
    nama_pembeli VARCHAR(100),
    email_pembeli VARCHAR(100),
    password_pembeli VARCHAR(100)
);

CREATE TABLE Pegawai (
    nik CHAR(16) PRIMARY KEY,
    nama_pegawai VARCHAR(100),
    email_pegawai VARCHAR(100),
    password_pegawai VARCHAR(100),
    penjual_pg_id_penjual CHAR(5),
    FOREIGN KEY (penjual_pg_id_penjual) REFERENCES Penjual(id_penjual)
);

CREATE TABLE Menu (
    id_menu CHAR(5) PRIMARY KEY,
    nama_menu VARCHAR(100),
    durasi_memasak VARCHAR(8),
    stok_menu INT,
    harga_menu DECIMAL(7,2),
    jenis_menu VARCHAR(50),
    penjual_me_id_penjual CHAR(5),
    FOREIGN KEY (penjual_me_id_penjual) REFERENCES Penjual(id_penjual)
);

CREATE TABLE Pesanan (
    id_pesanan CHAR(5) PRIMARY KEY,
    waktu_pesanan TIMESTAMP,
    pembeli_ps_id_pembeli CHAR(5),
    penjual_ps_id_penjual CHAR(5),
    FOREIGN KEY (pembeli_ps_id_pembeli) REFERENCES Pembeli(id_pembeli),
    FOREIGN KEY (penjual_ps_id_penjual) REFERENCES Penjual(id_penjual)
);

CREATE TABLE Pesanan_Menu (
    pesanan_pm_id_pesanan CHAR(5),
    menu_id_menu CHAR(5),
    FOREIGN KEY (pesanan_pm_id_pesanan) REFERENCES Pesanan(id_pesanan),
    FOREIGN KEY (menu_id_menu) REFERENCES Menu(id_menu)
);

CREATE TABLE Detail_Pesanan (
    id_detail_pesanan CHAR(5) PRIMARY KEY,
    jumlah_menu INT,
    total_harga DECIMAL(7,2),
    catatan_khusus VARCHAR(100),
    status_pesanan VARCHAR(100),
    pesanan_dp_id_pesanan CHAR(5),
    FOREIGN KEY (pesanan_dp_id_pesanan) REFERENCES Pesanan(id_pesanan)
);


INSERT INTO Penjual (id_penjual, nama_penjual, email_penjual, password_penjual, status_penjual) 
VALUES 
('P0001', 'Ombens', 'ombens@example.com', 'ombens123', 1),
('P0002', 'Bu Sol', 'buSol@example.com', 'Busol567', 1),
('P0003', 'Mak Nanun', 'nanuni@example.com', 'nanuni5sd67', 1),
('P0004', 'Kantin Mungil', 'mungilkah@example.com', 'IYANich567', 1);

SELECT * FROM Penjual;

INSERT INTO Pembeli (id_pembeli, nama_pembeli, email_pembeli, password_pembeli)
VALUES 
('C0001', 'Adi Cahyono', 'adi.cahyono@example.com', 'adicahyono123'),
('C0002', 'Budi Santoso', 'budi.santoso@example.com', 'budisantoso456'),
('C0003', 'Citra Wijaya', 'citra.wijaya@example.com', 'citrawijaya789'),
('C0004', 'Dewi Lestari', 'dewi.lestari@example.com', 'dewilestari123'),
('C0005', 'Eka Putri', 'eka.putri@example.com', 'ekaputri456'),
('C0006', 'Fajar Nugroho', 'fajar.nugroho@example.com', 'fajarnugroho789'),
('C0007', 'Galih Pratama', 'galih.pratama@example.com', 'galihpratama123'),
('C0008', 'Hana Maharani', 'hana.maharani@example.com', 'hanamaharani456'),
('C0009', 'Irfan Setiawan', 'irfan.setiawan@example.com', 'irfansetiawan789'),
('C0010', 'Joko Susanto', 'joko.susanto@example.com', 'jokosusanto123'),
('C0011', 'Krisna Wardhana', 'krisna.wardhana@example.com', 'krisnawardhana456'),
('C0012', 'Larasati Putri', 'larasati.putri@example.com', 'larasatiputri789'),
('C0013', 'Mega Pratiwi', 'mega.pratiwi@example.com', 'megapratiwi123'),
('C0014', 'Nanda Saputra', 'nanda.saputra@example.com', 'nandasaputra456'),
('C0015', 'Oky Darmawan', 'oky.darmawan@example.com', 'okydarmawan789'),
('C0016', 'Putri Aulia', 'putri.aulia@example.com', 'putriaulia123'),
('C0017', 'Rama Wijaya', 'rama.wijaya@example.com', 'ramawijaya456'),
('C0018', 'Sari Indah', 'sari.indah@example.com', 'sariindah789'),
('C0019', 'Tono Susilo', 'tono.susilo@example.com', 'tonosusilo123'),
('C0020', 'Ulfa Nurul', 'ulfa.nurul@example.com', 'ulfanurul456'),
('C0021', 'Vina Rosalina', 'vina.rosalina@example.com', 'vinarosalina789'),
('C0022', 'Wahyu Prabowo', 'wahyu.prabowo@example.com', 'wahyuprabowo123'),
('C0023', 'Xena Putri', 'xena.putri@example.com', 'xenaputri456'),
('C0024', 'Yoga Pratama', 'yoga.pratama@example.com', 'yogapratama789'),
('C0025', 'Zara Damayanti', 'zara.damayanti@example.com', 'zaradamayanti123'),
('C0026', 'Andi Nugraha', 'andi.nugraha@example.com', 'andinugraha456'),
('C0027', 'Bunga Lestari', 'bunga.lestari@example.com', 'bungalestari789'),
('C0028', 'Cici Maulida', 'cici.maulida@example.com', 'cicimaulida123'),
('C0029', 'Dodi Santoso', 'dodi.santoso@example.com', 'dodisantoso456'),
('C0030', 'Eko Suryadi', 'eko.suryadi@example.com', 'ekosuryadi789'),
('C0031', 'Fira Cantika', 'fira.cantika@example.com', 'firacantika123'),
('C0032', 'Galang Pradana', 'galang.pradana@example.com', 'galangpradana456'),
('C0033', 'Hani Damayanti', 'hani.damayanti@example.com', 'hanidamayanti789'),
('C0034', 'Irfan Hidayat', 'irfan.hidayat@example.com', 'irfanhidayat123'),
('C0035', 'Jeni Kartika', 'jeni.kartika@example.com', 'jenikartika456'),
('C0036', 'Krisna Putra', 'krisna.putra@example.com', 'krisnaputra789'),
('C0037', 'Lina Dewi', 'lina.dewi@example.com', 'linadewi123'),
('C0038', 'Mira Ayu', 'mira.ayu@example.com', 'miraayu456'),
('C0039', 'Nadia Fitri', 'nadia.fitri@example.com', 'nadiafitri789'),
('C0040', 'Oki Setiawan', 'oki.setiawan@example.com', 'okisetiawan123');

SELECT * FROM Pembeli;

INSERT INTO Pegawai (nik, nama_pegawai, email_pegawai, password_pegawai, penjual_pg_id_penjual)
VALUES
('7682154936278592', 'Rina Fitriana', 'rina.fitriana@example.com', 'pass123', 'P0001'),
('9013746281937462', 'Budi Santoso', 'budi.santoso@example.com', 'budi456', 'P0002'),
('5129374658123490', 'Siti Nurul', 'siti.nurul@example.com', 'siti789', 'P0003'),
('6048912375648392', 'Ahmad Maulana', 'ahmad.maulana@example.com', 'ahmad1234', 'P0004');

SELECT * FROM Pegawai;

INSERT INTO Menu (id_menu, nama_menu, durasi_memasak, stok_menu, harga_menu, jenis_menu, penjual_me_id_penjual)
VALUES
('M0001', 'Es Teh Tarik', '00:05:00', 75, 15000.00, 'Minuman', 'P0001'),
('M0002', 'Nutrisari Jeruk', '00:05:00', 2, 10000.00, 'Minuman', 'P0001'),
('M0003', 'Es Jeruk', '00:05:00', 4, 7000.00, 'Minuman', 'P0001'),
('M0004', 'Es Teh', '00:05:00', 20, 6000.00, 'Minuman', 'P0001'),
('M0005', 'Es Matcha', '00:05:00', 2, 7500.00, 'Minuman', 'P0001'),
('M0006', 'Ice Milk Tea', '00:05:00', 12, 7000.00, 'Minuman', 'P0001'),
('M0007', 'Kopi Panas', '00:05:00', 3, 7000.00, 'Minuman', 'P0001'),
('M0008', 'Es Moccacino', '00:05:00', 4, 7500.00, 'Minuman', 'P0001'),
('M0009', 'Chocolate Blend', '00:08:00', 10, 8000.00, 'Minuman', 'P0001'),
('M0010', 'Ice Good Day', '00:05:00', 3, 7500.00, 'Minuman', 'P0001'),
('M0011', 'Nasi Kuning', '00:04:00', 110, 8000.00, 'Makanan', 'P0002'),
('M0012', 'Chicken Crispy', '00:08:00', 12, 13000.00, 'Makanan', 'P0002'),
('M0013', 'Batagor', '00:01:00', 3, 6000.00, 'Makanan', 'P0002'),
('M0014', 'Nasi Cumi Hitam', '00:07:00', 4, 14000.00, 'Makanan', 'P0002'),
('M0015', 'Nasi Pecel', '00:07:00', 20, 14000.00, 'Makanan', 'P0002'),
('M0016', 'Nasi Ayam Goreng', '00:10:00', 12, 8000.00, 'Makanan', 'P0002'),
('M0017', 'Nasi Dendeng', '00:10:00', 2, 12000.00, 'Makanan', 'P0002'),
('M0018', 'Nasi Chicken Grill', '00:10:00', 12, 12000.00, 'Makanan', 'P0002'),
('M0019', 'Nasi Ayam Cabe', '00:10:00', 20, 16000.00, 'Makanan', 'P0002'),
('M0020', 'Nasi Goreng', '00:10:00', 30, 11000.00, 'Makanan', 'P0002'),
('M0021', 'Nasi Rawon', '00:10:00', 30, 20000.00, 'Makanan', 'P0003'),
('M0022', 'Kwetiau Goreng', '00:12:00', 15, 16000.00, 'Makanan', 'P0003'),
('M0023', 'Mie Ayam Pangsit', '00:08:00', 15, 14000.00, 'Makanan', 'P0003'),
('M0024', 'Mie Ayam Pangsit Bakso', '00:08:00', 14, 16000.00, 'Makanan', 'P0003'),
('M0025', 'Mie Ayam Pangsit Ceker', '00:10:00', 10, 16000.00, 'Makanan', 'P0003'),
('M0026', 'Pisang Goreng', '00:05:00', 3, 6000.00, 'Makanan', 'P0003'),
('M0027', 'Pentol', '00:05:00', 2, 6000.00, 'Makanan', 'P0003'),
('M0028', 'Nasi Rames', '00:07:00', 17, 14000.00, 'Makanan', 'P0003'),
('M0029', 'Nasi Campur', '00:07:00', 19, 14000.00, 'Makanan', 'P0003'),
('M0030', 'Kopi ABC', '00:01:00', 15, 10000.00, 'Minuman', 'P004'),
('M0031', 'Larutan', '00:01:00', 3, 6000.00, 'Minuman', 'P0004'),
('M0032', 'Ultra Milk', '00:01:00', 18, 9000.00, 'Minuman', 'P0004'),
('M0033', 'STee', '00:01:00', 8, 4000.00, 'Minuman', 'P0004'),
('M0034', 'Club', '00:01:00', 90, 3000.00, 'Minuman', 'P0004'),
('M0035', 'Pocari Sweat', '00:01:00', 21, 10000.00, 'Minuman', 'P0004'),
('M0036', 'Vit C', '00:01:00', 4, 9000.00, 'Minuman', 'P0004'),
('M0037', 'Teh Botol', '00:01:00', 26, 10000.00, 'Minuman', 'P0004'),
('M0038', 'Kopi Kenangan', '00:01:00', 14, 10000.00, 'Minuman', 'P0004'),
('M0039', 'Fanta', '00:01:00', 3, 8000.00, 'Minuman', 'P0004');

SELECT * FROM Menu;

INSERT INTO Pesanan (id_pesanan, waktu_pesanan, pembeli_ps_id_pembeli, penjual_ps_id_penjual)
VALUES
('PS001', '2023-12-15 14:35:00', 'C0021', 'P0001'),
('PS002', '2023-12-15 13:30:00', 'C0022', 'P0001'),
('PS003', '2023-12-15 12:45:00', 'C0023', 'P0001'),
('PS004', '2023-12-15 14:25:00', 'C0024', 'P0001'),
('PS005', '2023-12-15 17:00:00', 'C0025', 'P0001'),
('PS006', '2023-12-15 11:40:00', 'C0026', 'P0001'),
('PS007', '2023-12-15 10:55:00', 'C0027', 'P0001'),
('PS008', '2023-12-15 15:30:00', 'C0028', 'P0001'),
('PS009', '2023-12-15 08:30:00', 'C0001', 'P0001'),
('PS010', '2023-12-15 17:00:00', 'C0002', 'P0001'),
('PS011', '2023-12-15 11:08:00', 'C0003', 'P0001'),
('PS012', '2023-12-15 13:10:00', 'C0004', 'P0001'),
('PS013', '2023-12-15 08:30:00', 'C0005', 'P0001'),
('PS014', '2023-12-15 17:00:00', 'C0006', 'P0001'),
('PS015', '2023-12-15 11:08:00', 'C0007', 'P0001'),
('PS016', '2023-12-15 08:08:00', 'C0036', 'P0002'),
('PS017', '2023-12-15 08:05:00', 'C0037', 'P0002'),
('PS018', '2023-12-15 10:10:00', 'C0038', 'P0002'),
('PS019', '2023-12-15 13:00:00', 'C0039', 'P0002'),
('PS020', '2023-12-15 09:07:00', 'C0040', 'P0002'),
('PS021', '2023-12-15 12:35:00', 'C0029', 'P0002'),
('PS022', '2023-12-15 10:30:00', 'C0031', 'P0002'),
('PS023', '2023-12-15 16:45:00', 'C0032', 'P0002'),
('PS024', '2023-12-15 11:25:00', 'C0033', 'P0002'),
('PS025', '2023-12-15 17:00:00', 'C0034', 'P0002'),
('PS026', '2023-12-15 08:40:00', 'C0035', 'P0002'),
('PS027', '2023-12-15 07:55:00', 'C0008', 'P0002'),
('PS028', '2023-12-15 12:30:00', 'C0009', 'P0002'),
('PS029', '2023-12-15 09:30:00', 'C0010', 'P0002'),
('PS030', '2023-12-15 10:15:00', 'C0011', 'P0002'),
('PS031', '2023-12-15 14:35:00', 'C0011', 'P0003'),
('PS032', '2023-12-15 13:30:00', 'C0012', 'P0003'),
('PS033', '2023-12-15 09:45:00', 'C0013', 'P0003'),
('PS034', '2023-12-15 14:25:00', 'C0014', 'P0003'),
('PS035', '2023-12-15 13:08:00', 'C0015', 'P0003'),
('PS036', '2023-12-15 10:02:00', 'C0016', 'P0003'),
('PS037', '2023-12-15 08:10:00', 'C0017', 'P0003'),
('PS038', '2023-12-15 15:15:00', 'C0018', 'P0003'),
('PS039', '2023-12-15 10:06:00', 'C0019', 'P0003'),
('PS040', '2023-12-15 12:15:00', 'C0020', 'P0003'),
('PS041', '2023-12-15 14:35:00', 'C0021', 'P0003'),
('PS042', '2023-12-15 13:30:00', 'C0022', 'P0003'),
('PS043', '2023-12-15 16:45:00', 'C0023', 'P0003'),
('PS044', '2023-12-15 14:25:00', 'C0024', 'P0003'),
('PS045', '2023-12-15 13:08:00', 'C0025', 'P0003'),
('PS046', '2023-12-15 10:02:00', 'C0026', 'P0003'),
('PS047', '2023-12-15 08:10:00', 'C0017', 'P0004'),
('PS048', '2023-12-15 15:15:00', 'C0018', 'P0004'),
('PS049', '2023-12-15 10:06:00', 'C0019', 'P0004'),
('PS050', '2023-12-15 12:15:00', 'C0020', 'P0004'),
('PS051', '2023-12-15 14:35:00', 'C0021', 'P0004'),
('PS052', '2023-12-15 13:30:00', 'C0022', 'P0004'),
('PS053', '2023-12-15 15:45:00', 'C0023', 'P0004'),
('PS054', '2023-12-15 14:25:00', 'C0024', 'P0004'),
('PS055', '2023-12-15 13:08:00', 'C0025', 'P0004'),
('PS056', '2023-12-15 10:02:00', 'C0011', 'P0004'),
('PS057', '2023-12-15 10:12:00', 'C0027', 'P0004'),
('PS058', '2023-12-15 10:22:00', 'C0012', 'P0004'),
('PS059', '2023-12-15 10:32:00', 'C0009', 'P0004'),
('PS060', '2023-12-15 10:42:00', 'C0004', 'P0004'),
('PS061', '2023-12-13 10:30:00', 'C0010', 'P0002'),
('PS062', '2023-12-14 12:30:00', 'C0010', 'P0002');

SELECT * FROM Pesanan;

INSERT INTO Pesanan_Menu (pesanan_pm_id_pesanan, menu_id_menu)
VALUES
('PS001', 'M0011'),
('PS001', 'M0012'),
('PS002', 'M0013'),
('PS003', 'M0014'),
('PS003', 'M0015'),
('PS003', 'M0016'),
('PS004', 'M0018'),
('PS005', 'M0019'),
('PS006', 'M0016'),
('PS006', 'M0018'),
('PS007', 'M0019'),
('PS008', 'M0012'),
('PS009', 'M0017'),
('PS010', 'M0020'),
('PS011', 'M0021'),
('PS012', 'M0029'),
('PS012', 'M0023'),
('PS012', 'M0006'),
('PS012', 'M0004'),
('PS013', 'M0008'),
('PS013', 'M0010'),
('PS014', 'M0005'),
('PS014', 'M0008'),
('PS014', 'M0010'),
('PS015', 'M0002'),
('PS016', 'M0011'),
('PS017', 'M0014'),
('PS017', 'M0013'),
('PS017', 'M0014'),
('PS018', 'M0015'),
('PS019', 'M0011'),
('PS019', 'M0014'),
('PS020', 'M0013'),
('PS021', 'M0012'),
('PS021', 'M0013'),
('PS022', 'M0015'),
('PS023', 'M0018'),
('PS023', 'M0012'),
('PS024', 'M0014'),
('PS025', 'M0016'),
('PS026', 'M0017'),
('PS027', 'M0020'),
('PS028', 'M0019'),
('PS028', 'M0014'),
('PS029', 'M0013'),
('PS029', 'M0019'),
('PS030', 'M0013'),
('PS030', 'M0014'),
('PS030', 'M0015'),
('PS031', 'M0029'),
('PS031', 'M0027'),
('PS031', 'M0021'),
('PS031', 'M0025'),
('PS032', 'M0026'),
('PS033', 'M0024'),
('PS033', 'M0023'),
('PS033', 'M0021'),
('PS034', 'M0027'),
('PS034', 'M0028'),
('PS035', 'M0025'),
('PS035', 'M0021'),
('PS036', 'M0023'),
('PS036', 'M0025'),
('PS037', 'M0024'),
('PS038', 'M0021'),
('PS039', 'M0022'),
('PS039', 'M0024'),
('PS039', 'M0026'),
('PS040', 'M0023'),
('PS040', 'M0029'),
('PS041', 'M0024'),
('PS042', 'M0025'),
('PS043', 'M0026'),
('PS043', 'M0022'),
('PS043', 'M0023'),
('PS044', 'M0028'),
('PS045', 'M0027'),
('PS046', 'M0029'),
('PS047', 'M0031'),
('PS047', 'M0032'),
('PS048', 'M0030'),
('PS049', 'M0036'),
('PS049', 'M0037'),
('PS049', 'M0038'),
('PS050', 'M0033'),
('PS051', 'M0039'),
('PS052', 'M0033'),
('PS052', 'M0038'),
('PS053', 'M0037'),
('PS054', 'M0036'),
('PS055', 'M0032'),
('PS056', 'M0030'),
('PS056', 'M0035'),
('PS057', 'M0034'),
('PS058', 'M0030'),
('PS058', 'M0036'),
('PS058', 'M0037'),
('PS058', 'M0039'),
('PS059', 'M0036'),
('PS059', 'M0038'),
('PS060', 'M0033'),
('PS060', 'M0034'),
('PS060', 'M0035'),
('PS062', 'M0013'),
('PS061', 'M0013');

SELECT * FROM Pesanan_Menu;

INSERT INTO Detail_Pesanan (id_detail_pesanan, jumlah_menu, total_harga, catatan_khusus, status_pesanan, pesanan_dp_id_pesanan)
VALUES
('DP001', 1, 25000.00, 'Tidak pedas', 'Siap', 'PS001'),
('DP002', 1, 45000.00, 'Tidak ada', 'Siap', 'PS002'),
('DP003', 1, 15000.00, 'Tambah gula', 'Baru', 'PS003'),
('DP004', 1, 35000.00, 'Roti tipis', 'Siap', 'PS004'),
('DP005', 1, 28000.00, 'Tidak ada', 'Siap', 'PS005'),
('DP006', 1, 90000.00, 'Medium rare', 'Proses', 'PS006'),
('DP007', 1, 50000.00, 'Tambahan wasabi', 'Siap', 'PS007'),
('DP008', 1, 18000.00, 'Tidak ada', 'Siap', 'PS008'),
('DP009', 1, 22000.00, 'Tidak ada', 'Siap', 'PS009'),
('DP010', 1, 19000.00, 'Tidak pakai pangsit', 'Baru', 'PS010'),
('DP011', 1, 17000.00, 'Tidak ada', 'Siap', 'PS011'),
('DP012', 1, 12000.00, 'Bakar kering', 'Siap', 'PS012'),
('DP013', 1, 15000.00, 'Tanpa timun', 'Siap', 'PS013'),
('DP014', 1, 12000.00, 'Tidak pedas', 'Proses', 'PS014'),
('DP015', 1, 18000.00, 'Tidak ada', 'Siap', 'PS015'),
('DP016', 1, 14000.00, 'Coklat dan kelapa', 'Siap', 'PS016'),
('DP017', 1, 10000.00, 'Tidak ada', 'Siap', 'PS017'),
('DP018', 1, 27000.00, 'Tidak ada', 'Baru', 'PS018'),
('DP019', 1, 20000.00, 'Tidak ada', 'Siap', 'PS019'),
('DP020', 1, 32000.00, 'Tidak ada', 'Siap', 'PS020'),
('DP021', 2, 14000.00, 'Tidak ada', 'Baru', 'PS001'),
('DP022', 1, 10000.00, 'Tidak ada', 'Siap', 'PS002'),
('DP023', 3, 22000.00, 'Tidak ada', 'Proses', 'PS003'),
('DP024', 1, 6000.00, 'Tidak ada', 'Siap', 'PS004'),
('DP025', 1, 8000.00, 'Tidak ada', 'Siap', 'PS005'),
('DP026', 2, 17500.00, 'Tidak ada', 'Baru', 'PS006'),
('DP027', 1, 7000.00, 'Tidak ada', 'Siap', 'PS007'),
('DP028', 1, 7000.00, 'Tidak ada', 'Siap', 'PS008'),
('DP029', 1, 15000.00, 'Tidak ada', 'Siap', 'PS009'),
('DP030', 2, 12000.00, 'Tidak ada', 'Siap', 'PS010'),
('DP031', 1, 6000.00, 'Tidak ada', 'Siap', 'PS011'),
('DP032', 4, 27000.00, 'Tidak ada', 'Proses', 'PS012'),
('DP033', 2, 15000.00, 'Tidak ada', 'Siap', 'PS013'),
('DP034', 3, 22500.00, 'Tidak ada', 'Siap', 'PS014'),
('DP035', 1, 10000.00, 'Tidak ada', 'Baru', 'PS015'),
('DP036', 1, 8000.00, 'Tidak ada', 'Proses', 'PS016'),
('DP037', 3, 34000.00, 'Tidak ada', 'Siap', 'PS017'),
('DP038', 1, 14000.00, 'Tidak ada', 'Siap', 'PS018'),
('DP039', 2, 22000.00, 'Tidak ada', 'Proses', 'PS019'),
('DP040', 1, 6000.00, 'Tidak ada', 'Siap', 'PS020'),
('DP041', 2, 19000.00, 'Tidak ada', 'Siap', 'PS021'),
('DP042', 1, 14000.00, 'Tidak ada', 'Siap', 'PS022'),
('DP043', 2, 25000.00, 'Tidak ada', 'Baru', 'PS043'),
('DP044', 1, 14000.00, 'Tidak ada', 'Proses', 'PS024'),
('DP045', 1, 8000.00, 'Tidak ada', 'Siap', 'PS025'),
('DP046', 1, 12000.00, 'Tidak ada', 'Siap', 'PS026'),
('DP047', 1, 1100.00, 'Tidak ada', 'Siap', 'PS027'),
('DP048', 2, 30000.00, 'Sambal Dipisah', 'Proses', 'PS028'),
('DP049', 2, 22000.00, 'Tidak ada', 'Siap', 'PS029'),
('DP050', 3, 34000.00, 'Tidak ada', 'Siap', 'PS030'),
('DP051', 4, 56000.00, 'Tidak ada', 'Siap', 'PS031'),
('DP052', 1, 6000.00, 'Extra Susu', 'Siap', 'PS032'),
('DP053', 3, 50000.00, 'Tidak ada', 'Proses', 'PS033'),
('DP054', 2, 20000.00, 'Tidak ada', 'Siap', 'PS034'),
('DP055', 2, 36000.00, 'Tidak ada', 'Baru', 'PS035'),
('DP056', 2, 30000.00, 'Tidak ada', 'Siap', 'PS036'),
('DP057', 1, 16000.00, 'Tidak ada', 'Siap', 'PS037'),
('DP058', 1, 20000.00, 'Tidak ada', 'Siap', 'PS038'),
('DP059', 3, 38000.00, 'Tidak ada', 'Proses', 'PS039'),
('DP060', 2, 28000.00, 'Tidak ada', 'Siap', 'PS040'),
('DP061', 1, 16000.00, 'Tidak ada', 'Siap', 'PS041'),
('DP062', 1, 16000.00, 'Tidak ada', 'Siap', 'PS042'),
('DP063', 3, 36000.00, 'Extra Susu', 'Siap', 'PS043'),
('DP064', 1, 14000.00, 'Tidak ada', 'Proses', 'PS044'),
('DP065', 1, 6000.00, 'Tidak ada', 'Siap', 'PS045'),
('DP066', 1, 14000.00, 'Tidak ada', 'Siap', 'PS046'),
('DP067', 2, 15000.00, 'Tidak ada', 'Siap', 'PS047'),
('DP068', 1, 10000.00, 'Tidak ada', 'Proses', 'PS048'),
('DP069', 3, 29000.00, 'Tidak ada', 'Siap', 'PS049'),
('DP070', 1, 4000.00, 'Tidak ada', 'Siap', 'PS050'),
('DP071', 1, 8000.00, 'Tidak ada', 'Baru', 'PS051'),
('DP072', 2, 14000.00, 'Tidak ada', 'Siap', 'PS052'),
('DP073', 1, 10000.00, 'Tidak ada', 'Siap', 'PS053'),
('DP074', 1, 9000.00, 'Tidak ada', 'Siap', 'PS054'),
('DP075', 1, 9000.00, 'Tidak ada', 'Siap', 'PS055'),
('DP076', 2, 20000.00, 'Tidak ada', 'Baru', 'PS056'),
('DP077', 1, 3000.00, 'Tidak ada', 'Siap', 'PS057'),
('DP078', 4, 37000.00, 'Tidak ada', 'Proses', 'PS058'),
('DP079', 2, 19000.00, 'Tidak ada', 'Siap', 'PS059'),
('DP080', 3, 17000.00, 'Tidak ada', 'Siap', 'PS060'),
('DP081', 1, 6000.00, 'Tidak pedas', 'Selesai', 'PS061'),
('DP082', 1, 6000.00, 'Tidak pedas', 'Selesai', 'PS062');

SELECT * FROM Detail_Pesanan;

DROP PROCEDURE IF EXISTS UpdateStokMenu;
DROP FUNCTION IF EXISTS CalculateTotalPrice;
DROP TRIGGER IF EXISTS AfterInsertPesananMenu;
DROP TRIGGER IF EXISTS BeforeInsertDetailPesanan;

CREATE PROCEDURE UpdateStokMenu(IN menu_id CHAR(5), IN jumlah INT)
BEGIN
    UPDATE Menu
    SET stok_menu = stok_menu - jumlah
    WHERE id_menu = menu_id;
END

CREATE FUNCTION CalculateTotalPrice(jumlah INT, harga DECIMAL(7,2)) RETURNS DECIMAL(7,2)
BEGIN
    DECLARE total DECIMAL(7,2);
    SET total = jumlah * harga;
    RETURN total;
END

CREATE TRIGGER AfterInsertPesananMenu
AFTER INSERT ON Pesanan_Menu
FOR EACH ROW
BEGIN
    CALL UpdateStokMenu(NEW.menu_id_menu, 1);
END

CREATE TRIGGER BeforeInsertDetailPesanan
BEFORE INSERT ON Detail_Pesanan
FOR EACH ROW
BEGIN
    DECLARE harga DECIMAL(7,2);
    SELECT harga_menu INTO harga FROM Menu WHERE id_menu = (SELECT menu_id_menu FROM Pesanan_Menu WHERE pesanan_pm_id_pesanan = NEW.pesanan_dp_id_pesanan);
    SET NEW.total_harga = CalculateTotalPrice(NEW.jumlah_menu, harga);
END