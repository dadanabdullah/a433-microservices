# Mengambil image node versi 14 dari Docker Hub
FROM node:14-alpine

# Membuat dan beralih ke direktori /app
WORKDIR /app

# Menyalin seluruh file dari direktori project ke direktori /app
COPY . .

# Mengatur environment variable
ENV NODE_ENV=production DB_HOST=item-db

# Menjalankan instalasi dependensi dan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Membuka port 8080
EXPOSE 8080

# Menjalankan aplikasi
CMD ["npm", "start"]