-- Active: 1718165534569@@127.0.0.1@3306
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
('P0004', 'Kantin Mungil', 'mungilkah@example.com', 'IYANich567', 1),
('P0005', 'Warung Sederhana', 'sederhana@mail.com', 'password123', 1),
('P0006', 'Resto Padang', 'padang@mail.com', 'password123', 1),
('P0007', 'Bakso Mas Ari', 'bakso_ari@mail.com', 'password123', 0),
('P0008', 'Ayam Geprek Bunda', 'geprek_bunda@mail.com', 'password123', 1),
('P0009', 'Soto Kudus Pak Min', 'soto_min@mail.com', 'password123', 1),
('P0010', 'Mie Ayam Ceker', 'mie_cekek@mail.com', 'password123', 1),
('P0011', 'Nasi Goreng 24 Jam', 'nasgor24@mail.com', 'password123', 0),
('P0012', 'Kopi Senja', 'kopisenja@mail.com', 'password123', 1),
('P0013', 'Pecel Lele Lela', 'lelelela@mail.com', 'password123', 0),
('P0014', 'Ayam Bakar Pak Kumis', 'pak_kumis@gmail.com', 'ayamku123', 1),
('P0015', 'Bakso Malang Cak Uban', 'cak_uban@gmail.com', 'bakso456', 0),
('P0016', 'Nasi Padang Ibu Lia', 'ibu_lia@gmail.com', 'padang789', 1),
('P0017', 'Sate Kambing Mas Tono', 'mas_tono@gmail.com', 'sate1234', 1),
('P0018', 'Mie Ayam Bang Jali', 'bang_jali@gmail.com', 'mie567', 0),
('P0019', 'Pempek Palembang Asli', 'pempek_asli@gmail.com', 'pempek890', 1),
('P0020', 'Soto Lamongan Cak Ali', 'cak_ali@gmail.com', 'soto111', 1),
('P0021', 'Gado-Gado Bu Ningsih', 'bu_ningsih@gmail.com', 'gado222', 0),
('P0022', 'Bubur Ayam Spesial', 'bubur_ayam@gmail.com', 'bubur333', 1),
('P0023', 'Nasi Goreng Pak No', 'pak_no@gmail.com', 'nasi123', 1),
('P0024', 'Sop Buntut Mak Nyak', 'mak_nyak@gmail.com', 'sop456', 1),
('P0025', 'Bebek Goreng Bu Rani', 'bu_rani@gmail.com', 'bebek789', 0),
('P0026', 'Sushi Enak Jepang', 'sushi_enak@gmail.com', 'sushi1234', 1),
('P0027', 'Pecel Lele Mas Bagyo', 'mas_bagyo@gmail.com', 'lele567', 1),
('P0028', 'Kebab Turki Ustad', 'ustad_kebab@gmail.com', 'kebab890', 1),
('P0029', 'Pizza Italiano', 'pizza_italiano@gmail.com', 'pizza111', 0),
('P0030', 'Dimsum Halal', 'dimsum_halal@gmail.com', 'dimsum222', 1),
('P0031', 'Bubur Kacang Ijo', 'bubur_kacang@gmail.com', 'kacang333', 1),
('P0032', 'Es Teler Segar', 'es_teler@gmail.com', 'es444', 1),
('P0033', 'Martabak Manis', 'martabak_manis@gmail.com', 'martabak555', 1),
('P0034', 'Pisang Goreng Madu', 'pisang_goreng@gmail.com', 'pisang666', 0),
('P0035', 'Rujak Buah Segar', 'rujak_buah@gmail.com', 'rujak777', 1),
('P0036', 'Warung Soto Betawi', 'soto_betawi@gmail.com', 'betawi888', 1),
('P0037', 'Sate Padang', 'sate_padang@gmail.com', 'sate999', 1),
('P0038', 'Tahu Gejrot', 'tahu_gejrot@gmail.com', 'tahu000', 1),
('P0039', 'Gulai Kambing', 'gulai_kambing@gmail.com', 'gulai1111', 0),
('P0040', 'Bakmi Jawa', 'bakmi_jawa@gmail.com', 'bakmi2222', 1),
('P0041', 'Kerak Telor', 'kerak_telor@gmail.com', 'telor3333', 1),
('P0042', 'Siomay Bandung', 'siomay_bandung@gmail.com', 'siomay4444', 1),
('P0043', 'Kwetiau Goreng', 'kwetiau_goreng@gmail.com', 'kwetiau5555', 1),
('P0044', 'Ayam Geprek Pedas', 'ayam_geprek@gmail.com', 'geprek6666', 1),
('P0045', 'Lontong Sayur', 'lontong_sayur@gmail.com', 'lontong7777', 1),
('P0046', 'Nasi Campur Bali', 'nasi_campur@gmail.com', 'campur8888', 1),
('P0047', 'Ayam Penyet Sambal', 'ayam_penyet@gmail.com', 'penyet9999', 0),
('P0048', 'Burger Enak', 'burger_enak@gmail.com', 'burger0000', 1),
('P0049', 'Mie Rebus Pedas', 'mie_rebus@gmail.com', 'rebus111', 1),
('P0050', 'Tahu Bulat', 'tahu_bulat@gmail.com', 'bulat222', 1);

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
('M0030', 'Kopi ABC', '00:01:00', 15, 10000.00, 'Minuman', 'P0004'),
('M0031', 'Larutan', '00:01:00', 3, 6000.00, 'Minuman', 'P0004'),
('M0032', 'Ultra Milk', '00:01:00', 18, 9000.00, 'Minuman', 'P0004'),
('M0033', 'STee', '00:01:00', 8, 4000.00, 'Minuman', 'P0004'),
('M0034', 'Club', '00:01:00', 90, 3000.00, 'Minuman', 'P0004'),
('M0035', 'Pocari Sweat', '00:01:00', 21, 10000.00, 'Minuman', 'P0004'),
('M0036', 'Vit C', '00:01:00', 4, 9000.00, 'Minuman', 'P0004'),
('M0037', 'Teh Botol', '00:01:00', 26, 10000.00, 'Minuman', 'P0004'),
('M0038', 'Kopi Kenangan', '00:01:00', 14, 10000.00, 'Minuman', 'P0004'),
('M0039', 'Fanta', '00:01:00', 3, 8000.00, 'Minuman', 'P0004'),
('M0040', 'Nasi Uduk', '00:10:00', 30, 12000.00, 'Makanan', 'P0005'),
('M0041', 'Rendang', '00:15:00', 20, 25000.00, 'Makanan', 'P0005'),
('M0042', 'Gado-Gado', '00:10:00', 25, 14000.00, 'Makanan', 'P0005'),
('M0043', 'Sate Ayam', '00:12:00', 30, 18000.00, 'Makanan', 'P0005'),
('M0044', 'Sate Kambing', '00:15:00', 15, 22000.00, 'Makanan', 'P0005'),
('M0045', 'Es Cendol', '00:05:00', 40, 8000.00, 'Minuman', 'P0005'),
('M0046', 'Jus Alpukat', '00:07:00', 20, 12000.00, 'Minuman', 'P0005'),
('M0047', 'Jus Mangga', '00:07:00', 25, 10000.00, 'Minuman', 'P0005'),
('M0048', 'Sop Buntut', '00:20:00', 10, 30000.00, 'Makanan', 'P0005'),
('M0049', 'Ayam Bakar', '00:15:00', 20, 20000.00, 'Makanan', 'P0005'),
('M0050', 'Ikan Bakar', '00:18:00', 15, 22000.00, 'Makanan', 'P0005'),
('M0051', 'Rendang Daging', '00:20:00', 20, 30000.00, 'Makanan', 'P0006'),
('M0052', 'Ayam Pop', '00:15:00', 25, 25000.00, 'Makanan', 'P0006'),
('M0053', 'Dendeng Balado', '00:18:00', 15, 28000.00, 'Makanan', 'P0006'),
('M0054', 'Gulai Ikan', '00:17:00', 20, 26000.00, 'Makanan', 'P0006'),
('M0055', 'Soto Padang', '00:15:00', 20, 22000.00, 'Makanan', 'P0006'),
('M0056', 'Dendeng Balado', '00:10:00', 30, 20000.00, 'Makanan', 'P0006'),
('M0057', 'Sate Padang', '00:12:00', 25, 23000.00, 'Makanan', 'P0006'),
('M0058', 'Telur Barendo', '00:08:00', 30, 15000.00, 'Makanan', 'P0006'),
('M0059', 'Perkedel Kentang', '00:07:00', 35, 12000.00, 'Makanan', 'P0006'),
('M0060', 'Gulai Kikil', '00:15:00', 20, 25000.00, 'Makanan', 'P0006'),
('M0061', 'Es Teh Manis', '00:05:00', 50, 5000.00, 'Minuman', 'P0006'),
('M0062', 'Es Jeruk', '00:05:00', 40, 7000.00, 'Minuman', 'P0006'),
('M0063', 'Teh Panas', '00:03:00', 30, 4000.00, 'Minuman', 'P0006'),
('M0064', 'Kopi Hitam', '00:05:00', 20, 6000.00, 'Minuman', 'P0006'),
('M0065', 'Es Cendol', '00:05:00', 40, 8000.00, 'Minuman', 'P0006'),
('M0066', 'Bakso Kuah', '00:10:00', 30, 15000.00, 'Makanan', 'P0007'),
('M0067', 'Bakso Urat', '00:12:00', 25, 17000.00, 'Makanan', 'P0007'),
('M0068', 'Bakso Tahu', '00:10:00', 20, 16000.00, 'Makanan', 'P0007'),
('M0069', 'Bakso Telur', '00:12:00', 15, 18000.00, 'Makanan', 'P0007'),
('M0070', 'Bakso Beranak', '00:15:00', 10, 25000.00, 'Makanan', 'P0007'),
('M0071', 'Bakso Bakar', '00:10:00', 20, 20000.00, 'Makanan', 'P0007'),
('M0072', 'Bakso Gepeng', '00:12:00', 15, 19000.00, 'Makanan', 'P0007'),
('M0073', 'Bakso Keju', '00:12:00', 15, 21000.00, 'Makanan', 'P0007'),
('M0074', 'Bakso Campur', '00:10:00', 20, 22000.00, 'Makanan', 'P0007'),
('M0075', 'Bakso Goreng', '00:10:00', 30, 15000.00, 'Makanan', 'P0007'),
('M0076', 'Teh Manis Dingin', '00:05:00', 40, 5000.00, 'Minuman', 'P0007'),
('M0077', 'Teh Manis Panas', '00:03:00', 35, 4000.00, 'Minuman', 'P0007'),
('M0078', 'Es Jeruk', '00:05:00', 30, 7000.00, 'Minuman', 'P0007'),
('M0079', 'Es Kelapa Muda', '00:05:00', 20, 12000.00, 'Minuman', 'P0007'),
('M0080', 'Kopi Hitam', '00:05:00', 25, 6000.00, 'Minuman', 'P0007'),
('M0081', 'Ayam Geprek Original', '00:10:00', 30, 18000.00, 'Makanan', 'P0008'),
('M0082', 'Ayam Geprek Pedas', '00:10:00', 25, 20000.00, 'Makanan', 'P0008'),
('M0083', 'Ayam Geprek Crispy', '00:12:00', 20, 22000.00, 'Makanan', 'P0008'),
('M0084', 'Ayam Geprek Sambal Matah', '00:10:00', 15, 22000.00, 'Makanan', 'P0008'),
('M0085', 'Ayam Geprek Keju', '00:12:00', 15, 23000.00, 'Makanan', 'P0008'),
('M0086', 'Ayam Geprek BBQ', '00:12:00', 20, 25000.00, 'Makanan', 'P0008'),
('M0087', 'Ayam Geprek Telur Mata Sapi', '00:15:00', 20, 24000.00, 'Makanan', 'P0008'),
('M0088', 'Ayam Geprek Bakar', '00:15:00', 15, 23000.00, 'Makanan', 'P0008'),
('M0089', 'Ayam Geprek Balado', '00:12:00', 20, 22000.00, 'Makanan', 'P0008'),
('M0090', 'Ayam Geprek Mozarella', '00:12:00', 20, 26000.00, 'Makanan', 'P0008'),
('M0091', 'Es Teh Manis', '00:05:00', 50, 5000.00, 'Minuman', 'P0008'),
('M0092', 'Es Jeruk', '00:05:00', 40, 7000.00, 'Minuman', 'P0008'),
('M0093', 'Teh Panas', '00:03:00', 30, 4000.00, 'Minuman', 'P0008'),
('M0094', 'Kopi Hitam', '00:05:00', 20, 6000.00, 'Minuman', 'P0008'),
('M0095', 'Es Kelapa Muda', '00:05:00', 30, 10000.00, 'Minuman', 'P0008'),
('M0096', 'Soto Kudus Biasa', '00:15:00', 30, 20000.00, 'Makanan', 'P0009'),
('M0097', 'Soto Kudus Daging', '00:18:00', 25, 25000.00, 'Makanan', 'P0009'),
('M0098', 'Soto Kudus Ayam', '00:15:00', 20, 22000.00, 'Makanan', 'P0009'),
('M0099', 'Soto Kudus Kaki', '00:20:00', 15, 27000.00, 'Makanan', 'P0009'),
('M0100', 'Soto Kudus Empal', '00:18:00', 10, 30000.00, 'Makanan', 'P0009'),
('M0101', 'Soto Kudus Iga', '00:20:00', 20, 28000.00, 'Makanan', 'P0009'),
('M0102', 'Soto Kudus Bakso', '00:15:00', 20, 23000.00, 'Makanan', 'P0009'),
('M0103', 'Soto Kudus Telur', '00:10:00', 25, 18000.00, 'Makanan', 'P0009'),
('M0104', 'Soto Kudus Bening', '00:15:00', 30, 19000.00, 'Makanan', 'P0009'),
('M0105', 'Soto Kudus Pedas', '00:15:00', 25, 22000.00, 'Makanan', 'P0009'),
('M0106', 'Es Teh Manis', '00:05:00', 50, 5000.00, 'Minuman', 'P0009'),
('M0107', 'Es Jeruk', '00:05:00', 40, 7000.00, 'Minuman', 'P0009'),
('M0108', 'Teh Panas', '00:03:00', 30, 4000.00, 'Minuman', 'P0009'),
('M0109', 'Kopi Hitam', '00:05:00', 20, 6000.00, 'Minuman', 'P0009'),
('M0110', 'Es Kelapa Muda', '00:05:00', 30, 10000.00, 'Minuman', 'P0009'),
('M0111', 'Mie Ayam Ceker Biasa', '00:10:00', 30, 15000.00, 'Makanan', 'P0010'),
('M0112', 'Mie Ayam Ceker Spesial', '00:12:00', 25, 18000.00, 'Makanan', 'P0010'),
('M0113', 'Mie Ayam Ceker Extra Pedas', '00:12:00', 20, 20000.00, 'Makanan', 'P0010'),
('M0114', 'Mie Ayam Ceker Bakar', '00:15:00', 15, 22000.00, 'Makanan', 'P0010'),
('M0115', 'Mie Ayam Ceker Soto', '00:15:00', 20, 20000.00, 'Makanan', 'P0010'),
('M0116', 'Es Teh Tarik', '00:05:00', 40, 7000.00, 'Minuman', 'P0010'),
('M0117', 'Es Kopyor', '00:05:00', 30, 12000.00, 'Minuman', 'P0010'),
('M0118', 'Es Jeruk Lemon', '00:05:00', 30, 10000.00, 'Minuman', 'P0010'),
('M0119', 'Es Cincau Hijau', '00:05:00', 25, 9000.00, 'Minuman', 'P0010'),
('M0120', 'Es Campur', '00:07:00', 20, 15000.00, 'Minuman', 'P0010'),
('M0121', 'Es Kelapa Muda', '00:05:00', 25, 10000.00, 'Minuman', 'P0010'),
('M0122', 'Nasi Goreng Special', '00:15:00', 30, 20000.00, 'Makanan', 'P0011'),
('M0123', 'Nasi Goreng Ayam', '00:12:00', 25, 22000.00, 'Makanan', 'P0011'),
('M0124', 'Nasi Goreng Seafood', '00:18:00', 20, 25000.00, 'Makanan', 'P0011'),
('M0125', 'Nasi Goreng Jawa', '00:15:00', 20, 18000.00, 'Makanan', 'P0011'),
('M0126', 'Nasi Goreng Kambing', '00:20:00', 15, 28000.00, 'Makanan', 'P0011'),
('M0127', 'Nasi Goreng Telur Dadar', '00:10:00', 20, 15000.00, 'Makanan', 'P0011'),
('M0128', 'Nasi Goreng Spesial', '00:12:00', 20, 23000.00, 'Makanan', 'P0011'),
('M0129', 'Nasi Goreng Sosis', '00:10:00', 25, 18000.00, 'Makanan', 'P0011'),
('M0130', 'Nasi Goreng Bakso', '00:12:00', 20, 20000.00, 'Makanan', 'P0011'),
('M0131', 'Nasi Goreng Jumbo', '00:18:00', 15, 25000.00, 'Makanan', 'P0011'),
('M0132', 'Es Teh Manis', '00:05:00', 40, 5000.00, 'Minuman', 'P0011'),
('M0133', 'Es Jeruk', '00:05:00', 30, 7000.00, 'Minuman', 'P0011'),
('M0134', 'Teh Panas', '00:03:00', 25, 4000.00, 'Minuman', 'P0011'),
('M0135', 'Kopi Hitam', '00:05:00', 20, 6000.00, 'Minuman', 'P0011'),
('M0136', 'Es Campur', '00:07:00', 25, 12000.00, 'Minuman', 'P0011'),
('M0137', 'Kopi Tubruk', '00:03:00', 30, 8000.00, 'Minuman', 'P0012'),
('M0138', 'Kopi Susu', '00:05:00', 25, 10000.00, 'Minuman', 'P0012'),
('M0139', 'Es Kopi Susu', '00:05:00', 25, 12000.00, 'Minuman', 'P0012'),
('M0140', 'Kopi Hitam', '00:03:00', 35, 9000.00, 'Minuman', 'P0012'),
('M0141', 'Es Kopi Hitam', '00:03:00', 30, 11000.00, 'Minuman', 'P0012'),
('M0142', 'Kopi Latte', '00:05:00', 20, 15000.00, 'Minuman', 'P0012'),
('M0143', 'Es Kopi Latte', '00:05:00', 20, 17000.00, 'Minuman', 'P0012'),
('M0144', 'Kopi Cappuccino', '00:05:00', 20, 16000.00, 'Minuman', 'P0012'),
('M0145', 'Es Kopi Cappuccino', '00:05:00', 20, 18000.00, 'Minuman', 'P0012'),
('M0146', 'Kopi Mocha', '00:05:00', 20, 17000.00, 'Minuman', 'P0012'),
('M0147', 'Es Kopi Mocha', '00:05:00', 20, 19000.00, 'Minuman', 'P0012'),
('M0148', 'Kopi Vietnam', '00:05:00', 20, 18000.00, 'Minuman', 'P0012'),
('M0149', 'Espresso', '00:05:00', 20, 20000.00, 'Minuman', 'P0012'),
('M0150', 'Teh Manis Dingin', '00:05:00', 40, 5000.00, 'Minuman', 'P0012'),
('M0151', 'Teh Tarik', '00:05:00', 30, 7000.00, 'Minuman', 'P0012'),
('M0152', 'Es Teh Tarik', '00:05:00', 35, 8000.00, 'Minuman', 'P0012'),
('M0153', 'Lele Penyet', '00:15:00', 30, 18000.00, 'Makanan', 'P0013'),
('M0154', 'Lele Goreng', '00:18:00', 25, 22000.00, 'Makanan', 'P0013'),
('M0155', 'Lele Sambal Kangkung', '00:20:00', 20, 25000.00, 'Makanan', 'P0013'),
('M0156', 'Pecel Lele Bakar', '00:20:00', 15, 23000.00, 'Makanan', 'P0013'),
('M0157', 'Pecel Lele Goreng', '00:18:00', 20, 20000.00, 'Makanan', 'P0013'),
('M0158', 'Pecel Lele Lela', '00:15:00', 25, 21000.00, 'Makanan', 'P0013'),
('M0159', 'Pecel Lele Sambal Ijo', '00:18:00', 20, 22000.00, 'Makanan', 'P0013'),
('M0160', 'Pecel Lele Sambal Terasi', '00:18:00', 20, 22000.00, 'Makanan', 'P0013'),
('M0161', 'Pecel Lele Sambal Matah', '00:18:00', 20, 23000.00, 'Makanan', 'P0013'),
('M0162', 'Pecel Lele Sambal Kecap', '00:18:00', 20, 23000.00, 'Makanan', 'P0013'),
('M0163', 'Es Teh Manis', '00:05:00', 50, 5000.00, 'Minuman', 'P0013'),
('M0164', 'Es Jeruk', '00:05:00', 40, 7000.00, 'Minuman', 'P0013'),
('M0165', 'Wedang Jahe', '00:05:00', 35, 10000.00, 'Minuman', 'P0013'),
('M0166', 'Jus Alpukat', '00:07:00', 30, 12000.00, 'Minuman', 'P0013'),
('M0167', 'Teh Tarik', '00:05:00', 30, 8000.00, 'Minuman', 'P0013'),
('M0168', 'Teh Hangat', '00:03:00', 35, 5000.00, 'Minuman', 'P0013'),
('M0169', 'Ayam Bakar Original', '00:30:00', 20, 35000.00, 'Makanan', 'P0014'),
('M0170', 'Ayam Bakar Spesial', '00:35:00', 15, 38000.00, 'Makanan', 'P0014'),
('M0171', 'Ayam Bakar Madu', '00:30:00', 20, 38000.00, 'Makanan', 'P0014'),
('M0172', 'Ayam Bakar Kecap', '00:30:00', 20, 36000.00, 'Makanan', 'P0014'),
('M0173', 'Ayam Bakar Pedas', '00:30:00', 15, 38000.00, 'Makanan', 'P0014'),
('M0174', 'Ayam Bakar Rica-Rica', '00:35:00', 15, 39000.00, 'Makanan', 'P0014'),
('M0175', 'Ayam Bakar Taliwang', '00:35:00', 15, 40000.00, 'Makanan', 'P0014'),
('M0176', 'Ayam Bakar Bumbu Rujak', '00:30:00', 20, 37000.00, 'Makanan', 'P0014'),
('M0177', 'Ayam Bakar Lada Hitam', '00:30:00', 20, 38000.00, 'Makanan', 'P0014'),
('M0178', 'Ayam Bakar Bali', '00:35:00', 15, 40000.00, 'Makanan', 'P0014'),
('M0179', 'Es Teh Manis', '00:05:00', 50, 5000.00, 'Minuman', 'P0014'),
('M0180', 'Es Jeruk', '00:05:00', 40, 7000.00, 'Minuman', 'P0014'),
('M0181', 'Es Sirup', '00:05:00', 25, 8000.00, 'Minuman', 'P0014'),
('M0182', 'Es Jeruk Nipis', '00:05:00', 30, 8000.00, 'Minuman', 'P0014'),
('M0185', 'Bakso Malang Biasa', '00:10:00', 40, 15000.00, 'Makanan', 'P0015'),
('M0186', 'Bakso Malang Special', '00:12:00', 35, 18000.00, 'Makanan', 'P0015'),
('M0187', 'Bakso Malang Super Pedas', '00:15:00', 30, 20000.00, 'Makanan', 'P0015'),
('M0188', 'Bakso Malang Bakar', '00:15:00', 25, 22000.00, 'Makanan', 'P0015'),
('M0189', 'Bakso Malang Goreng', '00:12:00', 30, 18000.00, 'Makanan', 'P0015'),
('M0190', 'Bakso Malang Kuah', '00:10:00', 35, 16000.00, 'Makanan', 'P0015'),
('M0191', 'Bakso Malang Telur', '00:12:00', 25, 17000.00, 'Makanan', 'P0015'),
('M0192', 'Bakso Malang Spesial', '00:15:00', 20, 20000.00, 'Makanan', 'P0015'),
('M0193', 'Bakso Malang Ayam', '00:12:00', 25, 18000.00, 'Makanan', 'P0015'),
('M0194', 'Bakso Malang Sosis', '00:10:00', 30, 17000.00, 'Makanan', 'P0015'),
('M0195', 'Es Teh Manis', '00:05:00', 50, 5000.00, 'Minuman', 'P0015'),
('M0196', 'Es Jeruk', '00:05:00', 40, 7000.00, 'Minuman', 'P0015'),
('M0197', 'Es Campur', '00:07:00', 30, 12000.00, 'Minuman', 'P0015'),
('M0198', 'Teh Tarik', '00:05:00', 35, 8000.00, 'Minuman', 'P0015'),
('M0199', 'Teh Hangat', '00:03:00', 40, 5000.00, 'Minuman', 'P0015'),
('M0200', 'Kopi Hitam', '00:05:00', 30, 6000.00, 'Minuman', 'P0015'),
('M0201', 'Rendang', '00:30:00', 25, 25000.00, 'Makanan', 'P0016'),
('M0202', 'Gulai Ayam', '00:25:00', 30, 22000.00, 'Makanan', 'P0016'),
('M0203', 'Sate Padang', '00:20:00', 35, 20000.00, 'Makanan', 'P0016'),
('M0204', 'Gulai Kambing', '00:30:00', 20, 28000.00, 'Makanan', 'P0016'),
('M0205', 'Dendeng Balado', '00:25:00', 25, 23000.00, 'Makanan', 'P0016'),
('M0206', 'Ayam Pop', '00:20:00', 30, 22000.00, 'Makanan', 'P0016'),
('M0207', 'Telur Balado', '00:15:00', 35, 18000.00, 'Makanan', 'P0016'),
('M0208', 'Paru Balado', '00:25:00', 25, 24000.00, 'Makanan', 'P0016'),
('M0209', 'Gulai Jengkol', '00:30:00', 20, 27000.00, 'Makanan', 'P0016'),
('M0210', 'Daun Singkong', '00:20:00', 30, 21000.00, 'Makanan', 'P0016'),
('M0211', 'Es Teh Manis', '00:05:00', 50, 5000.00, 'Minuman', 'P0016'),
('M0212', 'Es Jeruk', '00:05:00', 40, 7000.00, 'Minuman', 'P0016'),
('M0213', 'Es Cincau', '00:05:00', 25, 8000.00, 'Minuman', 'P0016'),
('M0214', 'Es Teler', '00:07:00', 25, 15000.00, 'Minuman', 'P0016'),
('M0215', 'Sate Kambing', '00:20:00', 30, 25000.00, 'Makanan', 'P0017'),
('M0216', 'Kambing Tongseng', '00:25:00', 25, 28000.00, 'Makanan', 'P0017'),
('M0217', 'Es Teh Manis', '00:05:00', 50, 5000.00, 'Minuman', 'P0017'),
('M0218', 'Es Jeruk', '00:05:00', 40, 7000.00, 'Minuman', 'P0017'),
('M0219', 'Mie Ayam Spesial', '00:12:00', 35, 18000.00, 'Makanan', 'P0018'),
('M0220', 'Mie Ayam', '00:15:00', 30, 20000.00, 'Makanan', 'P0018'),
('M0221', 'Mie Ayam Bakso', '00:15:00', 25, 22000.00, 'Makanan', 'P0018'),
('M0222', 'Mie Ayam Pangsit', '00:12:00', 30, 18000.00, 'Makanan', 'P0018'),
('M0223', 'Mie Ayam Jamur', '00:10:00', 35, 16000.00, 'Makanan', 'P0018'),
('M0224', 'Mie Ayam Telur Puyuh', '00:12:00', 25, 17000.00, 'Makanan', 'P0018'),
('M0225', 'Mie Ayam Baso Tahu', '00:15:00', 20, 20000.00, 'Makanan', 'P0018'),
('M0226', 'Mie Ayam Soto', '00:15:00', 20, 18000.00, 'Makanan', 'P0018'),
('M0227', 'Mie Ayam Sambal Ijo', '00:12:00', 25, 22000.00, 'Makanan', 'P0018'),
('M0228', 'Es Teh Manis', '00:05:00', 50, 5000.00, 'Minuman', 'P0018'),
('M0229', 'Es Jeruk', '00:05:00', 40, 7000.00, 'Minuman', 'P0018'),
('M0230', 'Es Cincau', '00:05:00', 25, 8000.00, 'Minuman', 'P0018'),
('M0231', 'Es Teler', '00:07:00', 25, 15000.00, 'Minuman', 'P0018'),
('M0232', 'Pempek Kapal Selam', '00:20:00', 30, 25000.00, 'Makanan', 'P0019'),
('M0233', 'Pempek Lenjer', '00:18:00', 35, 22000.00, 'Makanan', 'P0019'),
('M0234', 'Pempek Adaan', '00:25:00', 25, 28000.00, 'Makanan', 'P0019'),
('M0235', 'Pempek Pistel', '00:20:00', 30, 23000.00, 'Makanan', 'P0019'),
('M0236', 'Pempek Lenggang', '00:22:00', 25, 26000.00, 'Makanan', 'P0019'),
('M0237', 'Pempek Tahu', '00:20:00', 30, 27000.00, 'Makanan', 'P0019'),
('M0238', 'Pempek Kulit', '00:18:00', 35, 24000.00, 'Makanan', 'P0019'),
('M0239', 'Pempek Kapal Terbang', '00:25:00', 25, 29000.00, 'Makanan', 'P0019'),
('M0240', 'Pempek Keriting', '00:20:00', 30, 26000.00, 'Makanan', 'P0019'),
('M0241', 'Pempek Telur', '00:22:00', 25, 27000.00, 'Makanan', 'P0019'),
('M0242', 'Es Teh Manis', '00:05:00', 50, 5000.00, 'Minuman', 'P0019'),
('M0243', 'Es Jeruk', '00:05:00', 40, 7000.00, 'Minuman', 'P0019'),
('M0244', 'Es Cincau', '00:05:00', 25, 8000.00, 'Minuman', 'P0019'),
('M0245', 'Es Teler', '00:07:00', 25, 15000.00, 'Minuman', 'P0019'),
('M0246', 'Soto Ayam', '00:25:00', 30, 18000.00, 'Makanan', 'P0020'),
('M0247', 'Soto Daging', '00:30:00', 25, 20000.00, 'Makanan', 'P0020'),
('M0248', 'Soto Babat', '00:35:00', 20, 22000.00, 'Makanan', 'P0020'),
('M0249', 'Es Teh Manis', '00:05:00', 50, 5000.00, 'Minuman', 'P0020'),
('M0250', 'Es Jeruk', '00:05:00', 40, 7000.00, 'Minuman', 'P0020'),
('M0251', 'Gado-Gado Spesial', '00:15:00', 30, 20000.00, 'Makanan', 'P0021'),
('M0252', 'Gado-Gado Klasik', '00:12:00', 35, 18000.00, 'Makanan', 'P0021'),
('M0253', 'Gado-Gado Komplit', '00:18:00', 25, 22000.00, 'Makanan', 'P0021'),
('M0254', 'Gado-Gado Jumbo', '00:20:00', 30, 25000.00, 'Makanan', 'P0021'),
('M0255', 'Gado-Gado Medan', '00:15:00', 35, 19000.00, 'Makanan', 'P0021'),
('M0256', 'Gado-Gado Vegetarian', '00:10:00', 40, 17000.00, 'Makanan', 'P0021'),
('M0257', 'Gado-Gado Ayam', '00:15:00', 35, 21000.00, 'Makanan', 'P0021'),
('M0258', 'Gado-Gado Seafood', '00:18:00', 25, 24000.00, 'Makanan', 'P0021'),
('M0259', 'Gado-Gado Telur Puyuh', '00:12:00', 30, 19000.00, 'Makanan', 'P0021'),
('M0260', 'Gado-Gado Tahu Tempe', '00:15:00', 25, 22000.00, 'Makanan', 'P0021'),
('M0261', 'Es Teh Manis', '00:05:00', 50, 5000.00, 'Minuman', 'P0021'),
('M0262', 'Bubur Ayam Telur', '00:12:00', 35, 15000.00, 'Makanan', 'P0022'),
('M0263', 'Bubur Ayam Kacang', '00:15:00', 30, 18000.00, 'Makanan', 'P0022'),
('M0264', 'Bubur Ayam Biasa', '00:10:00', 40, 13000.00, 'Makanan', 'P0022'),
('M0265', 'Bubur Ayam Spesial', '00:15:00', 35, 20000.00, 'Makanan', 'P0022'),
('M0266', 'Bubur Ayam Tahu', '00:12:00', 30, 16000.00, 'Makanan', 'P0022'),
('M0267', 'Bubur Ayam Kuning', '00:10:00', 40, 14000.00, 'Makanan', 'P0022'),
('M0268', 'Bubur Ayam Soto', '00:12:00', 35, 17000.00, 'Makanan', 'P0022'),
('M0269', 'Bubur Ayam Asam', '00:15:00', 30, 19000.00, 'Makanan', 'P0022'),
('M0270', 'Bubur Ayam Manis', '00:10:00', 40, 16000.00, 'Makanan', 'P0022'),
('M0271', 'Es Teh Manis', '00:05:00', 50, 5000.00, 'Minuman', 'P0022'),
('M0272', 'Es Jeruk', '00:05:00', 40, 7000.00, 'Minuman', 'P0022'),
('M0273', 'Nasi Goreng Biasa', '00:15:00', 30, 15000.00, 'Makanan', 'P0023'),
('M0274', 'Nasi Goreng Seafood', '00:20:00', 25, 20000.00, 'Makanan', 'P0023'),
('M0275', 'Nasi Goreng Spesial', '00:25:00', 20, 25000.00, 'Makanan', 'P0023'),
('M0276', 'Nasi Goreng Komplit', '00:20:00', 30, 18000.00, 'Makanan', 'P0023'),
('M0277', 'Nasi Goreng Ayam', '00:18:00', 35, 17000.00, 'Makanan', 'P0023'),
('M0278', 'Nasi Goreng Telur', '00:15:00', 30, 16000.00, 'Makanan', 'P0023'),
('M0279', 'Nasi Goreng Ikan Asin', '00:20:00', 25, 19000.00, 'Makanan', 'P0023'),
('M0280', 'Nasi Goreng Jawa', '00:18:00', 35, 18000.00, 'Makanan', 'P0023'),
('M0281', 'Es Teh Manis', '00:05:00', 50, 5000.00, 'Minuman', 'P0023'),
('M0282', 'Es Jeruk', '00:05:00', 40, 7000.00, 'Minuman', 'P0023'),
('M0283', 'Es Cincau', '00:05:00', 25, 8000.00, 'Minuman', 'P0023'),
('M0284', 'Es Teler', '00:07:00', 25, 15000.00, 'Minuman', 'P0023'),
('M0285', 'Sop Buntut Biasa', '00:30:00', 20, 30000.00, 'Makanan', 'P0024'),
('M0286', 'Sop Buntut Spesial', '00:35:00', 15, 35000.00, 'Makanan', 'P0024'),
('M0287', 'Sop Buntut Khas Indonesia', '00:40:00', 10, 40000.00, 'Makanan', 'P0024'),
('M0288', 'Sop Buntut Istimewa', '00:45:00', 10, 45000.00, 'Makanan', 'P0024'),
('M0289', 'Sop Buntut Special Edition', '00:50:00', 5, 50000.00, 'Makanan', 'P0024'),
('M0290', 'Sop Buntut Komplit', '00:35:00', 15, 38000.00, 'Makanan', 'P0024'),
('M0291', 'Sop Buntut Ayam', '00:30:00', 20, 32000.00, 'Makanan', 'P0024'),
('M0292', 'Sop Buntut Bakar', '00:35:00', 15, 37000.00, 'Makanan', 'P0024'),
('M0293', 'Sop Buntut Sapi', '00:40:00', 10, 42000.00, 'Makanan', 'P0024'),
('M0294', 'Sop Buntut Lezat', '00:45:00', 10, 46000.00, 'Makanan', 'P0024'),
('M0295', 'Es Teh Manis', '00:05:00', 50, 5000.00, 'Minuman', 'P0024'),
('M0296', 'Es Jeruk', '00:05:00', 40, 7000.00, 'Minuman', 'P0024'),
('M0297', 'Es Cincau', '00:05:00', 25, 8000.00, 'Minuman', 'P0024'),
('M0298', 'Es Teler', '00:07:00', 25, 15000.00, 'Minuman', 'P0024'),
('M0299', 'Bebek Goreng Biasa', '00:25:00', 30, 25000.00, 'Makanan', 'P0025'),
('M0300', 'Bebek Goreng Spesial', '00:30:00', 25, 30000.00, 'Makanan', 'P0025'),
('M0301', 'Bebek Goreng Kremes', '00:35:00', 20, 35000.00, 'Makanan', 'P0025'),
('M0302', 'Bebek Goreng Madura', '00:30:00', 25, 28000.00, 'Makanan', 'P0025'),
('M0303', 'Bebek Goreng Renyah', '00:35:00', 20, 32000.00, 'Makanan', 'P0025'),
('M0304', 'Bebek Goreng Lezat', '00:30:00', 25, 27000.00, 'Makanan', 'P0025'),
('M0305', 'Bebek Goreng Mantap', '00:35:00', 20, 31000.00, 'Makanan', 'P0025'),
('M0306', 'Bebek Goreng Spicy', '00:30:00', 25, 29000.00, 'Makanan', 'P0025'),
('M0307', 'Bebek Goreng Pedas', '00:35:00', 20, 33000.00, 'Makanan', 'P0025'),
('M0308', 'Bebek Goreng Sambal Matah', '00:30:00', 25, 31000.00, 'Makanan', 'P0025'),
('M0309', 'Es Teh Manis', '00:05:00', 50, 5000.00, 'Minuman', 'P0025'),
('M0310', 'Es Jeruk', '00:05:00', 40, 7000.00, 'Minuman', 'P0025'),
('M0311', 'Es Cincau', '00:05:00', 25, 8000.00, 'Minuman', 'P0025'),
('M0312', 'Es Teler', '00:07:00', 25, 15000.00, 'Minuman', 'P0025'),
('M0313', 'Sushi Salmon Roll', '00:20:00', 25, 35000.00, 'Makanan', 'P0026'),
('M0314', 'Sushi Tuna Roll', '00:22:00', 20, 33000.00, 'Makanan', 'P0026'),
('M0315', 'Sushi California Roll', '00:18:00', 30, 30000.00, 'Makanan', 'P0026'),
('M0316', 'Sushi Tempura Roll', '00:25:00', 15, 38000.00, 'Makanan', 'P0026'),
('M0317', 'Sushi Dragon Roll', '00:30:00', 10, 40000.00, 'Makanan', 'P0026'),
('M0318', 'Sushi Rainbow Roll', '00:28:00', 12, 42000.00, 'Makanan', 'P0026'),
('M0319', 'Sushi Spicy Tuna Roll', '00:22:00', 20, 36000.00, 'Makanan', 'P0026'),
('M0320', 'Sushi Volcano Roll', '00:25:00', 18, 39000.00, 'Makanan', 'P0026'),
('M0321', 'Sushi Eel Roll', '00:27:00', 15, 37000.00, 'Makanan', 'P0026'),
('M0322', 'Sushi Avocado Roll', '00:20:00', 25, 32000.00, 'Makanan', 'P0026'),
('M0323', 'Es Teh Manis', '00:05:00', 50, 5000.00, 'Minuman', 'P0026'),
('M0324', 'Es Jeruk', '00:05:00', 40, 7000.00, 'Minuman', 'P0026'),
('M0325', 'Lemon Tea', '00:05:00', 25, 8000.00, 'Minuman', 'P0026'),
('M0326', 'Air Putih', '00:07:00', 25, 3000.00, 'Minuman', 'P0026'),
('M0327', 'Pecel Lele', NULL, 30, 15000.00, 'Makanan', 'P0027'),
('M0328', 'Pecel Lele Spesial', NULL, 25, 20000.00, 'Makanan', 'P0027'),
('M0329', 'Pecel Lele Super', NULL, 20, 25000.00, 'Makanan', 'P0027'),
('M0330', 'Es Teh Manis', '00:05:00', 40, 5000.00, 'Minuman', 'P0027'),
('M0331', 'Es Jeruk', '00:05:00', 35, 6000.00, 'Minuman', 'P0027'),
('M0332', 'Es Kelapa Muda', '00:03:00', 30, 8000.00, 'Minuman', 'P0027'),
('M0333', 'Es Cincau', '00:03:00', 25, 10000.00, 'Minuman', 'P0027'),
('M0334', 'Es Campur', '00:05:00', 20, 12000.00, 'Minuman', 'P0027'),
('M0335', 'Kebab Ayam', '00:10:00', 30, 20000.00, 'Makanan', 'P0028'),
('M0336', 'Kebab Daging', '00:12:00', 25, 25000.00, 'Makanan', 'P0028'),
('M0337', 'Kebab Sapi', '00:15:00', 20, 30000.00, 'Makanan', 'P0028'),
('M0338', 'Kebab Vegetarian', '00:12:00', 20, 18000.00, 'Makanan', 'P0028'),
('M0339', 'Pizza Margherita', '00:20:00', 30, 35000.00, 'Makanan', 'P0029'),
('M0340', 'Pizza Pepperoni', '00:22:00', 25, 38000.00, 'Makanan', 'P0029'),
('M0341', 'Pizza Hawaiian', '00:25:00', 20, 40000.00, 'Makanan', 'P0029'),
('M0342', 'Pizza Vegetariana', '00:22:00', 20, 36000.00, 'Makanan', 'P0029'),
('M0343', 'Pizza Quattro Stagioni', '00:28:00', 15, 42000.00, 'Makanan', 'P0029'),
('M0344', 'Pizza Capricciosa', '00:30:00', 10, 45000.00, 'Makanan', 'P0029'),
('M0345', 'Pizza Diavola', '00:25:00', 10, 38000.00, 'Makanan', 'P0029'),
('M0346', 'Pizza Marinara', '00:20:00', 15, 32000.00, 'Makanan', 'P0029'),
('M0347', 'Pizza Napoletana', '00:22:00', 20, 34000.00, 'Makanan', 'P0029'),
('M0348', 'Pizza Siciliana', '00:28:00', 15, 40000.00, 'Makanan', 'P0029'),
('M0349', 'Siomay Ayam', '00:15:00', 30, 18000.00, 'Makanan', 'P0030'),
('M0350', 'Bakpao Daging', '00:10:00', 25, 15000.00, 'Makanan', 'P0030'),
('M0351', 'Lumpia Udang', '00:12:00', 20, 20000.00, 'Makanan', 'P0030'),
('M0352', 'Pangsit Goreng', '00:08:00', 20, 16000.00, 'Makanan', 'P0030'),
('M0353', 'Bola-Bola Ayam', '00:10:00', 15, 17000.00, 'Makanan', 'P0030'),
('M0354', 'Siu Mai', '00:12:00', 15, 19000.00, 'Makanan', 'P0030'),
('M0355', 'Rolade Ayam', '00:15:00', 10, 22000.00, 'Makanan', 'P0030'),
('M0356', 'Kue Tim Ayam', '00:20:00', 10, 25000.00, 'Makanan', 'P0030'),
('M0357', 'Tahu Isi Udang', '00:10:00', 15, 18000.00, 'Makanan', 'P0030'),
('M0358', 'Sayap Ayam Panggang', '00:25:00', 10, 28000.00, 'Makanan', 'P0030'),
('M0359', 'Bubur Kacang Ijo Spesial', '00:30:00', 20, 15000.00, 'Minuman', 'P0031'),
('M0360', 'Bubur Kacang Ijo', '00:30:00', 20, 10000.00, 'Minuman', 'P0031'),
('M0361', 'Es Teler Segar', '00:07:00', 30, 15000.00, 'Minuman', 'P0032'),
('M0362', 'Es Campur', '00:05:00', 25, 12000.00, 'Minuman', 'P0032'),
('M0363', 'Es Kelapa Muda', '00:03:00', 20, 10000.00, 'Minuman', 'P0032'),
('M0364', 'Es Kopyor', '00:05:00', 20, 13000.00, 'Minuman', 'P0032'),
('M0365', 'Es Cincau', '00:03:00', 20, 8000.00, 'Minuman', 'P0032'),
('M0366', 'Es Teh Manis', '00:03:00', 30, 5000.00, 'Minuman', 'P0032'),
('M0367', 'Es Jeruk', '00:03:00', 25, 6000.00, 'Minuman', 'P0032'),
('M0368', 'Es Campur', '00:05:00', 20, 12000.00, 'Minuman', 'P0032'),
('M0369', 'Es Kelapa Muda', '00:03:00', 20, 8000.00, 'Minuman', 'P0032'),
('M0370', 'Es Cincau', '00:03:00', 20, 10000.00, 'Minuman', 'P0032'),
('M0371', 'Martabak Manis Original', '00:15:00', 30, 20000.00, 'Makanan', 'P0033'),
('M0372', 'Martabak Manis Cokelat', '00:18:00', 25, 25000.00, 'Makanan', 'P0033'),
('M0373', 'Martabak Manis Keju', '00:18:00', 25, 25000.00, 'Makanan', 'P0033'),
('M0374', 'Martabak Manis Pisang', '00:20:00', 20, 22000.00, 'Makanan', 'P0033'),
('M0375', 'Martabak Manis Kacang', '00:20:00', 20, 22000.00, 'Makanan', 'P0033'),
('M0376', 'Pisang Goreng Madu', '00:10:00', 30, 10000.00, 'Makanan', 'P0034'),
('M0377', 'Pisang Goreng Cheese', '00:12:00', 25, 12000.00, 'Makanan', 'P0034'),
('M0378', 'Pisang Goreng Cokelat', '00:12:00', 25, 12000.00, 'Makanan', 'P0034'),
('M0379', 'Pisang Goreng Keju', '00:15:00', 20, 15000.00, 'Makanan', 'P0034'),
('M0380', 'Rujak Buah Segar', '00:05:00', 25, 15000.00, 'Makanan', 'P0035'),
('M0381', 'Rujak Buah Pedas', '00:05:00', 20, 17000.00, 'Makanan', 'P0035'),
('M0382', 'Rujak Buah Manis', '00:05:00', 20, 17000.00, 'Makanan', 'P0035'),
('M0383', 'Soto Betawi', '00:30:00', 30, 25000.00, 'Makanan', 'P0036'),
('M0384', 'Soto Betawi Spesial', '00:35:00', 25, 30000.00, 'Makanan', 'P0036'),
('M0385', 'Soto Betawi Komplit', '00:40:00', 20, 35000.00, 'Makanan', 'P0036'),
('M0386', 'Soto Betawi Daging', '00:35:00', 25, 28000.00, 'Makanan', 'P0036'),
('M0387', 'Soto Betawi Iga', '00:40:00', 20, 32000.00, 'Makanan', 'P0036'),
('M0388', 'Es Teh Manis', '00:05:00', 40, 5000.00, 'Minuman', 'P0036'),
('M0389', 'Es Jeruk', '00:05:00', 35, 6000.00, 'Minuman', 'P0036'),
('M0390', 'Es Kelapa Muda', '00:03:00', 30, 8000.00, 'Minuman', 'P0036'),
('M0391', 'Es Cincau', '00:03:00', 25, 10000.00, 'Minuman', 'P0036'),
('M0392', 'Es Campur', '00:05:00', 20, 12000.00, 'Minuman', 'P0036'),
('M0393', 'Sate Ayam', '00:20:00', 30, 30000.00, 'Makanan', 'P0037'),
('M0394', 'Sate Sapi', '00:25:00', 25, 35000.00, 'Makanan', 'P0037'),
('M0395', 'Sate Kelapa', '00:30:00', 20, 38000.00, 'Makanan', 'P0037'),
('M0396', 'Sate Kambing', '00:25:00', 25, 32000.00, 'Makanan', 'P0037'),
('M0397', 'Lontong', '00:05:00', 20, 5000.00, 'Makanan', 'P0037'),
('M0398', 'Es Teh Manis', '00:05:00', 40, 5000.00, 'Minuman', 'P0037'),
('M0399', 'Es Jeruk', '00:05:00', 35, 6000.00, 'Minuman', 'P0037'),
('M0400', 'Es Kelapa Muda', '00:03:00', 30, 8000.00, 'Minuman', 'P0037'),
('M0401', 'Es Cincau', '00:03:00', 25, 10000.00, 'Minuman', 'P0037'),
('M0402', 'Es Campur', '00:05:00', 20, 12000.00, 'Minuman', 'P0037'),
('M0403', 'Tahu Gejrot Original', '00:10:00', 30, 12000.00, 'Makanan', 'P0038'),
('M0404', 'Tahu Gejrot Pedas', '00:12:00', 25, 13000.00, 'Makanan', 'P0038'),
('M0405', 'Tahu Gejrot Manis', '00:12:00', 25, 13000.00, 'Makanan', 'P0038'),
('M0406', 'Tahu Gejrot Asli', '00:15:00', 20, 15000.00, 'Makanan', 'P0038'),
('M0407', 'Tahu Gejrot Khas', '00:15:00', 20, 15000.00, 'Makanan', 'P0038'),
('M0408', 'Es Teh Manis', '00:05:00', 40, 5000.00, 'Minuman', 'P0038'),
('M0409', 'Es Jeruk', '00:05:00', 35, 6000.00, 'Minuman', 'P0038'),
('M0410', 'Es Kelapa Muda', '00:03:00', 30, 8000.00, 'Minuman', 'P0038'),
('M0411', 'Es Cincau', '00:03:00', 25, 10000.00, 'Minuman', 'P0038'),
('M0412', 'Es Campur', '00:05:00', 20, 12000.00, 'Minuman', 'P0038'),
('M0413', 'Gulai Kambing Biasa', '01:00:00', 20, 35000.00, 'Makanan', 'P0039'),
('M0414', 'Gulai Kambing Spesial', '01:15:00', 15, 40000.00, 'Makanan', 'P0039'),
('M0415', 'Gulai Kambing Khas', '01:30:00', 10, 45000.00, 'Makanan', 'P0039'),
('M0416', 'Gulai Kambing Maknyos', '01:45:00', 10, 50000.00, 'Makanan', 'P0039'),
('M0417', 'Gulai Kambing Nusantara', '02:00:00', 5, 55000.00, 'Makanan', 'P0039'),
('M0418', 'Es Teh Manis', '00:05:00', 40, 5000.00, 'Minuman', 'P0039'),
('M0419', 'Es Jeruk', '00:05:00', 35, 6000.00, 'Minuman', 'P0039'),
('M0420', 'Es Kelapa Muda', '00:03:00', 30, 8000.00, 'Minuman', 'P0039'),
('M0421', 'Es Cincau', '00:03:00', 25, 10000.00, 'Minuman', 'P0039'),
('M0422', 'Es Campur', '00:05:00', 20, 12000.00, 'Minuman', 'P0039'),
('M0423', 'Gulai Kambing Sederhana', '01:00:00', 20, 30000.00, 'Makanan', 'P0039'),
('M0424', 'Gulai Kambing Lezat', '01:15:00', 15, 38000.00, 'Makanan', 'P0039'),
('M0425', 'Gulai Kambing Gurih', '01:30:00', 10, 42000.00, 'Makanan', 'P0039'),
('M0426', 'Gulai Kambing Pedas', '01:45:00', 10, 45000.00, 'Makanan', 'P0039'),
('M0427', 'Gulai Kambing Mantap', '02:00:00', 5, 48000.00, 'Makanan', 'P0039'),
('M0428', 'Es Teh Manis Hangat', '00:05:00', 30, 6000.00, 'Minuman', 'P0039'),
('M0429', 'Es Jeruk Hangat', '00:05:00', 25, 7000.00, 'Minuman', 'P0039'),
('M0430', 'Teh Tarik', '00:05:00', 20, 10000.00, 'Minuman', 'P0039'),
('M0431', 'Kopi Tubruk', '00:05:00', 20, 12000.00, 'Minuman', 'P0039'),
('M0432', 'Bandrek', '00:07:00', 15, 15000.00, 'Minuman', 'P0039'),
('M0433', 'Bakmi Jawa Goreng', '00:15:00', 30, 18000.00, 'Makanan', 'P0040'),
('M0434', 'Bakmi Jawa Rebus', '00:12:00', 25, 15000.00, 'Makanan', 'P0040'),
('M0435', 'Bakmi Jawa Ayam', '00:20:00', 20, 22000.00, 'Makanan', 'P0040'),
('M0436', 'Bakmi Jawa Special', '00:25:00', 15, 25000.00, 'Makanan', 'P0040'),
('M0437', 'Bakmi Jawa Komplit', '00:30:00', 10, 28000.00, 'Makanan', 'P0040'),
('M0438', 'Es Teh Manis', '00:05:00', 40, 5000.00, 'Minuman', 'P0040'),
('M0439', 'Es Jeruk', '00:05:00', 35, 6000.00, 'Minuman', 'P0040'),
('M0440', 'Es Kelapa Muda', '00:03:00', 30, 8000.00, 'Minuman', 'P0040'),
('M0441', 'Es Cincau', '00:03:00', 25, 10000.00, 'Minuman', 'P0040'),
('M0442', 'Es Campur', '00:05:00', 20, 12000.00, 'Minuman', 'P0040'),
('M0443', 'Kerak Telor Spesial', '00:20:00', 25, 25000.00, 'Makanan', 'P0041'),
('M0444', 'Kerak Telor Komplit', '00:25:00', 20, 28000.00, 'Makanan', 'P0041'),
('M0445', 'Kerak Telor Khas Betawi', '00:30:00', 15, 30000.00, 'Makanan', 'P0041'),
('M0446', 'Kerak Telor Mantap', '00:35:00', 10, 35000.00, 'Makanan', 'P0041'),
('M0447', 'Kerak Telor Pedas', '00:30:00', 15, 32000.00, 'Makanan', 'P0041'),
('M0448', 'Es Teh Manis', '00:05:00', 40, 5000.00, 'Minuman', 'P0041'),
('M0449', 'Es Jeruk', '00:05:00', 35, 6000.00, 'Minuman', 'P0041'),
('M0450', 'Es Kelapa Muda', '00:03:00', 30, 8000.00, 'Minuman', 'P0041'),
('M0451', 'Es Cincau', '00:03:00', 25, 10000.00, 'Minuman', 'P0041'),
('M0452', 'Es Campur', '00:05:00', 20, 12000.00, 'Minuman', 'P0041'),
('M0453', 'Siomay Bandung Original', '00:25:00', 30, 20000.00, 'Makanan', 'P0042'),
('M0454', 'Siomay Bandung Spesial', '00:30:00', 25, 25000.00, 'Makanan', 'P0042'),
('M0455', 'Siomay Bandung Ayam', '00:35:00', 20, 22000.00, 'Makanan', 'P0042'),
('M0456', 'Siomay Bandung Seafood', '00:40:00', 15, 28000.00, 'Makanan', 'P0042'),
('M0457', 'Siomay Bandung Komplit', '00:45:00', 10, 30000.00, 'Makanan', 'P0042'),
('M0458', 'Es Teh Manis', '00:05:00', 40, 5000.00, 'Minuman', 'P0042'),
('M0459', 'Es Jeruk', '00:05:00', 35, 6000.00, 'Minuman', 'P0042'),
('M0460', 'Es Kelapa Muda', '00:03:00', 30, 8000.00, 'Minuman', 'P0042'),
('M0461', 'Es Cincau', '00:03:00', 25, 10000.00, 'Minuman', 'P0042'),
('M0462', 'Es Campur', '00:05:00', 20, 12000.00, 'Minuman', 'P0042'),
('M0463', 'Kwetiau Goreng Biasa', '00:15:00', 30, 18000.00, 'Makanan', 'P0043'),
('M0464', 'Kwetiau Goreng Seafood', '00:20:00', 25, 23000.00, 'Makanan', 'P0043'),
('M0465', 'Kwetiau Goreng Ayam', '00:20:00', 25, 20000.00, 'Makanan', 'P0043'),
('M0466', 'Kwetiau Goreng Spesial', '00:25:00', 20, 25000.00, 'Makanan', 'P0043'),
('M0467', 'Kwetiau Goreng Komplit', '00:30:00', 15, 28000.00, 'Makanan', 'P0043'),
('M0468', 'Es Teh Manis', '00:05:00', 40, 5000.00, 'Minuman', 'P0043'),
('M0469', 'Es Jeruk', '00:05:00', 35, 6000.00, 'Minuman', 'P0043'),
('M0470', 'Es Kelapa Muda', '00:03:00', 30, 8000.00, 'Minuman', 'P0043'),
('M0471', 'Es Cincau', '00:03:00', 25, 10000.00, 'Minuman', 'P0043'),
('M0472', 'Es Campur', '00:05:00', 20, 12000.00, 'Minuman', 'P0043'),
('M0473', 'Ayam Geprek Pedas Level 1', '00:10:00', 30, 15000.00, 'Makanan', 'P0044'),
('M0474', 'Ayam Geprek Pedas Level 2', '00:12:00', 25, 16000.00, 'Makanan', 'P0044'),
('M0475', 'Ayam Geprek Pedas Level 3', '00:12:00', 25, 17000.00, 'Makanan', 'P0044'),
('M0476', 'Ayam Geprek Pedas Level 4', '00:15:00', 20, 18000.00, 'Makanan', 'P0044'),
('M0477', 'Ayam Geprek Pedas Level 5', '00:15:00', 20, 19000.00, 'Makanan', 'P0044'),
('M0478', 'Es Teh Manis', '00:05:00', 40, 5000.00, 'Minuman', 'P0044'),
('M0479', 'Es Jeruk', '00:05:00', 35, 6000.00, 'Minuman', 'P0044'),
('M0480', 'Es Kelapa Muda', '00:03:00', 30, 8000.00, 'Minuman', 'P0044'),
('M0481', 'Es Cincau', '00:03:00', 25, 10000.00, 'Minuman', 'P0044'),
('M0482', 'Es Campur', '00:05:00', 20, 12000.00, 'Minuman', 'P0044'),
('M0483', 'Lontong Sayur Biasa', '00:20:00', 30, 18000.00, 'Makanan', 'P0045'),
('M0484', 'Lontong Sayur Spesial', '00:25:00', 25, 22000.00, 'Makanan', 'P0045'),
('M0485', 'Lontong Sayur Ayam', '00:30:00', 20, 25000.00, 'Makanan', 'P0045'),
('M0486', 'Lontong Sayur Komplit', '00:35:00', 15, 28000.00, 'Makanan', 'P0045'),
('M0487', 'Lontong Sayur Padang', '00:40:00', 10, 30000.00, 'Makanan', 'P0045'),
('M0488', 'Es Teh Manis', '00:05:00', 40, 5000.00, 'Minuman', 'P0045'),
('M0489', 'Es Jeruk', '00:05:00', 35, 6000.00, 'Minuman', 'P0045'),
('M0490', 'Es Kelapa Muda', '00:03:00', 30, 8000.00, 'Minuman', 'P0045'),
('M0491', 'Es Cincau', '00:03:00', 25, 10000.00, 'Minuman', 'P0045'),
('M0492', 'Es Campur', '00:05:00', 20, 12000.00, 'Minuman', 'P0045'),
('M0493', 'Nasi Campur Bali Biasa', '00:20:00', 30, 20000.00, 'Makanan', 'P0046'),
('M0494', 'Nasi Campur Bali Spesial', '00:25:00', 25, 25000.00, 'Makanan', 'P0046'),
('M0495', 'Nasi Campur Bali Ayam', '00:30:00', 20, 28000.00, 'Makanan', 'P0046'),
('M0496', 'Nasi Campur Bali Komplit', '00:35:00', 15, 32000.00, 'Makanan', 'P0046'),
('M0497', 'Nasi Campur Bali Istimewa', '00:40:00', 10, 35000.00, 'Makanan', 'P0046'),
('M0498', 'Es Teh Manis', '00:05:00', 40, 5000.00, 'Minuman', 'P0046'),
('M0499', 'Es Jeruk', '00:05:00', 35, 6000.00, 'Minuman', 'P0046'),
('M0500', 'Es Kelapa Muda', '00:03:00', 30, 8000.00, 'Minuman', 'P0046'),
('M0501', 'Es Cincau', '00:03:00', 25, 10000.00, 'Minuman', 'P0046'),
('M0502', 'Es Campur', '00:05:00', 20, 12000.00, 'Minuman', 'P0046'),
('M0503', 'Ayam Penyet Sambal Biasa', '00:20:00', 30, 20000.00, 'Makanan', 'P0047'),
('M0504', 'Ayam Penyet Sambal Spesial', '00:25:00', 25, 25000.00, 'Makanan', 'P0047'),
('M0505', 'Ayam Penyet Sambal Pedas', '00:30:00', 20, 28000.00, 'Makanan', 'P0047'),
('M0506', 'Ayam Penyet Sambal Komplit', '00:35:00', 15, 32000.00, 'Makanan', 'P0047'),
('M0507', 'Ayam Penyet Sambal Istimewa', '00:40:00', 10, 35000.00, 'Makanan', 'P0047'),
('M0508', 'Es Teh Manis', '00:05:00', 40, 5000.00, 'Minuman', 'P0047'),
('M0509', 'Es Jeruk', '00:05:00', 35, 6000.00, 'Minuman', 'P0047'),
('M0510', 'Es Kelapa Muda', '00:03:00', 30, 8000.00, 'Minuman', 'P0047'),
('M0511', 'Es Cincau', '00:03:00', 25, 10000.00, 'Minuman', 'P0047'),
('M0512', 'Es Campur', '00:05:00', 20, 12000.00, 'Minuman', 'P0047'),
('M0513', 'Burger Enak Original', '00:10:00', 30, 25000.00, 'Makanan', 'P0048'),
('M0514', 'Burger Enak Cheese', '00:12:00', 25, 28000.00, 'Makanan', 'P0048'),
('M0515', 'Burger Enak Double', '00:15:00', 20, 30000.00, 'Makanan', 'P0048'),
('M0516', 'Burger Enak Spesial', '00:20:00', 15, 35000.00, 'Makanan', 'P0048'),
('M0517', 'Burger Enak King Size', '00:25:00', 10, 40000.00, 'Makanan', 'P0048'),
('M0518', 'Es Teh Manis', '00:05:00', 40, 5000.00, 'Minuman', 'P0048'),
('M0519', 'Es Jeruk', '00:05:00', 35, 6000.00, 'Minuman', 'P0048'),
('M0520', 'Mie Rebus Pedas Biasa', '00:10:00', 30, 15000.00, 'Makanan', 'P0049'),
('M0521', 'Mie Rebus Pedas Seafood', '00:12:00', 25, 18000.00, 'Makanan', 'P0049'),
('M0522', 'Mie Rebus Pedas Ayam', '00:15:00', 20, 17000.00, 'Makanan', 'P0049'),
('M0523', 'Mie Rebus Pedas Spesial', '00:20:00', 15, 20000.00, 'Makanan', 'P0049'),
('M0524', 'Mie Rebus Pedas Komplit', '00:25:00', 10, 23000.00, 'Makanan', 'P0049'),
('M0525', 'Es Teh Manis', '00:05:00', 40, 5000.00, 'Minuman', 'P0049'),
('M0526', 'Es Jeruk', '00:05:00', 35, 6000.00, 'Minuman', 'P0049'),
('M0527', 'Es Kelapa Muda', '00:03:00', 30, 8000.00, 'Minuman', 'P0049'),
('M0528', 'Es Cincau', '00:03:00', 25, 10000.00, 'Minuman', 'P0049'),
('M0529', 'Es Campur', '00:05:00', 20, 12000.00, 'Minuman', 'P0049'),
('M0530', 'Tahu Bulat Original', '00:05:00', 30, 5000.00, 'Makanan', 'P0050'),
('M0531', 'Tahu Bulat Cheese', '00:07:00', 25, 6000.00, 'Makanan', 'P0050'),
('M0532', 'Tahu Bulat Spesial', '00:10:00', 20, 8000.00, 'Makanan', 'P0050'),
('M0533', 'Tahu Bulat Pedas', '00:10:00', 20, 7000.00, 'Makanan', 'P0050'),
('M0534', 'Tahu Bulat Keju Pedas', '00:12:00', 15, 9000.00, 'Makanan', 'P0050');

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
DROP PROCEDURE IF EXISTS FullOrder;
DROP FUNCTION IF EXISTS CalculateTotalPrice;
DROP TRIGGER IF EXISTS AfterInsertPesananMenu;
DROP TRIGGER IF EXISTS BeforeInsertDetailPesanan;

-- Procedure, Function, Trigger

DELIMITER //

CREATE FUNCTION SplitString(str VARCHAR(255), delim VARCHAR(12), pos INT) RETURNS VARCHAR(255)
BEGIN
    RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(str, delim, pos),
           LENGTH(SUBSTRING_INDEX(str, delim, pos - 1)) + 1),
           delim, '');
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE FullOrder(
    OUT p_id_pesanan CHAR(5),
    IN p_waktu_pesanan TIMESTAMP,
    IN p_id_pembeli CHAR(5),
    IN p_id_penjual CHAR(5),
    IN p_jumlah_menu_list VARCHAR(255),
    IN p_catatan_khusus VARCHAR(255),
    IN p_menu_id_list VARCHAR(255),
    IN p_item_count INT
)
BEGIN
    DECLARE v_harga_menu DECIMAL(7,2);
    DECLARE v_total_harga DECIMAL(10,2) DEFAULT 0;
    DECLARE v_menu_id CHAR(5);
    DECLARE v_jumlah_menu INT;
    DECLARE v_index INT DEFAULT 1;
    DECLARE v_detail_id CHAR(5);
    DECLARE v_total_quantity INT DEFAULT 0;
    DECLARE v_sub_index INT;

    SELECT CONCAT('PS', LPAD(IFNULL(MAX(CAST(SUBSTRING(id_pesanan, 3) AS UNSIGNED)), 0) + 1, 3, '0'))
    INTO p_id_pesanan
    FROM Pesanan;

    SELECT CONCAT('DP', LPAD(IFNULL(MAX(CAST(SUBSTRING(id_detail_pesanan, 3) AS UNSIGNED)), 0) + 1, 3, '0'))
    INTO v_detail_id
    FROM Detail_Pesanan;

    INSERT INTO Pesanan (id_pesanan, waktu_pesanan, pembeli_ps_id_pembeli, penjual_ps_id_penjual)
    VALUES (p_id_pesanan, p_waktu_pesanan, p_id_pembeli, p_id_penjual);

    
    INSERT INTO Detail_Pesanan (id_detail_pesanan, jumlah_menu, total_harga, catatan_khusus, status_pesanan, pesanan_dp_id_pesanan)
    VALUES (v_detail_id, v_total_quantity, v_total_harga, p_catatan_khusus, 'Baru', p_id_pesanan);


    WHILE v_index <= p_item_count DO
        SET v_menu_id = SplitString(p_menu_id_list, ',', v_index);
        SET v_jumlah_menu = CAST(SplitString(p_jumlah_menu_list, ',', v_index) AS INT);

        SELECT harga_menu INTO v_harga_menu
        FROM Menu
        WHERE id_menu = v_menu_id
        LIMIT 1;

        SET v_total_harga = v_total_harga + CalculateTotalPrice(v_jumlah_menu, v_harga_menu);
        SET v_total_quantity = v_total_quantity + v_jumlah_menu;

        SET v_sub_index = 1;
        WHILE v_sub_index <= v_jumlah_menu DO
            INSERT INTO Pesanan_Menu (pesanan_pm_id_pesanan, menu_id_menu)
            VALUES (p_id_pesanan, v_menu_id);
            SET v_sub_index = v_sub_index + 1;
        END WHILE;

        SET v_index = v_index + 1;

    END WHILE;


END //
DELIMITER ;


CALL FullOrder(
    @id_pesanan_out,
    '2024-06-16 20:00:00', 
    'C0022', 
    'P0002', 
    '2,1,3', 
    'ga enak',
    'M0012,M0002,M0003', 
    3 
);



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
    DECLARE jumlah_pesanan INT;
    SELECT jumlah_menu INTO jumlah_pesanan
    FROM Detail_Pesanan
    WHERE pesanan_dp_id_pesanan = NEW.pesanan_pm_id_pesanan;

    CALL UpdateStokMenu(NEW.menu_id_menu, jumlah_pesanan);
END;

CREATE TRIGGER BeforeInsertDetailPesanan
BEFORE INSERT ON Detail_Pesanan
FOR EACH ROW
BEGIN
    DECLARE harga DECIMAL(7,2);
    SELECT harga_menu INTO harga FROM Menu WHERE id_menu = (SELECT menu_id_menu FROM Pesanan_Menu WHERE pesanan_pm_id_pesanan = NEW.pesanan_dp_id_pesanan);
    SET NEW.total_harga = CalculateTotalPrice(NEW.jumlah_menu, harga);
END


-- Check index
SHOW INDEXES FROM Penjual;
SHOW INDEXES FROM Pembeli;
SHOW INDEXES FROM Pegawai;
SHOW INDEXES FROM Menu;
SHOW INDEXES FROM Pesanan;
SHOW INDEXES FROM Pesanan_Menu;
SHOW INDEXES FROM Detail_Pesanan;

-- Implementasi index
CREATE INDEX idx_menu_nama ON Menu (nama_menu);
CREATE INDEX idx_detail_pesanan_status ON Detail_Pesanan (status_pesanan);
CREATE INDEX idx_pesanan_waktu ON Pesanan (waktu_pesanan);
CREATE INDEX idx_penjual_status ON Penjual (status_penjual);
-- Lihat hasil eksekusi query (trial index)
EXPLAIN SELECT * FROM Menu WHERE nama_menu LIKE '%Rendang%';
EXPLAIN SELECT * FROM Detail_Pesanan WHERE status_pesanan = 'Siap';
EXPLAIN SELECT * FROM Pesanan WHERE waktu_pesanan >= '2023-12-13' AND waktu_pesanan < '2023-12-14';
EXPLAIN SELECT * FROM Penjual WHERE status_penjual = '1';

-- Nonaktifkan query chache
SET GLOBAL query_cache_size = 0;

-- Ukur waktu eksekusi query
SET profiling = 1;  
SELECT * FROM Menu WHERE nama_menu LIKE '%Rendang%';
SELECT * FROM Detail_Pesanan WHERE status_pesanan = 'Siap';
SELECT * FROM Pesanan WHERE waktu_pesanan >= '2023-12-13' AND waktu_pesanan < '2023-12-14';
SELECT * FROM Penjual WHERE status_penjual = '1';
SHOW PROFILES;  
SET profiling = 0;

-- Trial 1
DROP INDEX idx_pesanan_waktu ON Pesanan;
SELECT * FROM Pesanan WHERE waktu_pesanan <= '2023-12-15';
CREATE INDEX idx_pesanan_waktu ON Pesanan (waktu_pesanan);
SHOW INDEXES FROM Pesanan;
EXPLAIN SELECT * FROM Pesanan WHERE waktu_pesanan >= '2023-12-13' AND waktu_pesanan < '2023-12-14';