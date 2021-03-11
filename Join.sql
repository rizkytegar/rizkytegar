SELECT pembayaran.id_pembayaran, petugas.nama_petugas, siswa.nis, siswa.nama, kelas.nama_kelas,pembayaran.tgl_bayar,pembayaran.bulan_dibayar,pembayaran.tahun_dibayar,pembayaran.jumlah_bayar FROM pembayaran
LEFT JOIN petugas on pembayaran.id_petugas = petugas.id_petugas
LEFT JOIN siswa on pembayaran.nisn = siswa.nisn
LEFT JOIN kelas ON siswa.id_kelas = kelas.id_kelas
