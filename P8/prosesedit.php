<?php
include("config.php");
// cek apakah tombol daftar sudah diklik atau blum?
if(isset($_POST['edit'])){

	// ambil data dari formulir
	$id = $_POST['id'];
	$nama = $_POST['nama'];
	$alamat = $_POST['alamat'];
	$jk = $_POST['jenis_kelamin'];
	$sekolah = $_POST['sekolah_asal'];

	// var_dump($_POST);
	// die();

	// buat query
	$sql = "UPDATE calonsiswa SET nama = '".$nama."', alamat = '".$alamat."', jenis_kelamin = '".$jk."', sekolah_asal = '".$sekolah."' WHERE id = '".$id."'";
	// echo $sql;
	// die();
	$query = pg_query($sql);

	// apakah query simpan berhasil?
	if( $query==TRUE ) {
		// kalau berhasil alihkan ke halaman index.php dengan status=sukses
		header('Location: daftarsiswa.php?status=sukses');
	} else {
		// kalau gagal alihkan ke halaman indek.ph dengan status=gagal
		header('Location: daftarsiswa.php?status=gagal');
	}


} else {
	die("Akses dilarang...");
}
?>
