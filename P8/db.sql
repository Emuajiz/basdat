CREATE TABLE calonsiswa(
    ID serial,
    nama VARCHAR(64) NOT NULL,
    alamat VARCHAR(20) NOT NULL,
    jenis_kelamin VARCHAR(16) NOT NULL,
    sekolah_asal VARCHAR(64) NOT NULL,
    CONSTRAINT calonsiswa_id_pk PRIMARY KEY(id)
);