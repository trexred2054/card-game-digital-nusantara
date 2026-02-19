# Menggunakan image Deno yang stabil
FROM denoland/deno:alpine

# Tentukan direktori kerja (Jangan typo jadi WORKDTA)
WORKDIR /app

# Salin semua file dari repo (termasuk index.html) ke dalam folder /app
COPY . .

# Berikan izin ke user deno untuk mengakses folder tersebut
RUN chown -R deno:deno /app
USER deno

# Port default, Railway akan otomatis menyesuaikan lewat env PORT
EXPOSE 8000

# Perintah jalannya (Sama dengan di railway.toml sebagai backup)
CMD ["run", "--allow-net", "--allow-read", "--allow-env", "main.ts"]
