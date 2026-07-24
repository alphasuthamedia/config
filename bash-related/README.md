### Dekomposisi Setiap Bagian

```
PS1='\[\e[38;2;180;190;254m\]\A \
\[\e[38;2;137;180;250m\]\u\
\[\e[38;2;205;214;244m\]@\
\[\e[38;2;137;220;235m\]\h \
\[\e[38;2;203;166;247m\]\W\
\[\e[38;2;205;214;244m\]\$ '
```

- **`\[\e[38;2;R;G;Bm\]`**  
  `\[ ... \]` adalah *bash-specific escape* untuk menandai bahwa urutan di dalamnya tidak tercetak (tidak memengaruhi lebar prompt, berguna untuk *line wrapping*).  
  `\e[` adalah *Control Sequence Introducer* (CSI).  
  `38;2;R;G;B` mengatur *foreground color* ke mode 2 (true color) dengan nilai RGB `(R,G,B)`. Angka `38` berarti *foreground*, `2` menandakan *color space* 24-bit.  
  Diakhiri dengan `m` (SGR – *Select Graphic Rendition*).  

- **`\A`**   – Waktu saat ini dalam format 24 jam (`HH:MM`).  
- **`\u`**   – Nama user saat login.  
- **`@`**    – Karakter literal `@`.  
- **`\h`**   – Nama host hingga titik pertama (*short hostname*).  
- **`\W`**   – Nama direktori kerja saat ini (hanya *basename*).  
- **`\$`**   – Menampilkan `$` untuk user biasa, `#` untuk *root*.

### Skema Warna yang Digunakan

| Bagian Prompt | RGB Color           | Tampilan Visual            |
|---------------|---------------------|----------------------------|
| `\A` (waktu)  | (180, 190, 254)     | Biru pastel terang         |
| `\u` (user)   | (137, 180, 250)     | Biru muda                  |
| `@`           | (205, 214, 244)     | Biru sangat terang (putih kebiruan) |
| `\h` (host)   | (137, 220, 235)     | Cyan pastel                |
| `\W` (direktori) | (203, 166, 247)  | Ungu lavender              |
| `\$` (prompt) | (205, 214, 244)     | Sama seperti `@`           |

### Urutan Tampilan Akhir

```
HH:MM user@host directory $
```

Setiap elemen memiliki warna berbeda sesuai tabel di atas, tanpa *reset* warna di akhir – artinya teks yang Anda ketik setelah prompt akan tetap menggunakan warna terakhir yang di-set (yaitu (205,214,244)) hingga ada perintah warna lain atau `\e[0m` untuk *reset*. Biasanya praktik yang baik menambahkan `\e[0m` di akhir prompt agar input pengguna kembali ke warna default terminal.

### Ringkasan

Ini adalah kustomisasi *prompt* yang sepenuhnya menggunakan *true color* RGB, memberikan tampilan modern dan *readable* dengan palet pastel. Setiap segmen diwarnai berbeda untuk membedakan informasi: waktu, user, host, direktori, dan simbol prompt.

Jika Anda ingin menonaktifkan warna atau mengubahnya, Anda hanya perlu mengganti nilai RGB pada masing-masing `\e[38;2;R;G;Bm`.



