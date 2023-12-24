#!/bin/bash

# Build image item-app dengan tag v1
echo "Building image .."
docker build -t item-app:v1 .

# Menampilkan semua daftar images yang ada untuk memastikan proses build diatas berhasil
echo "Available images .."
docker images

# Mempersiapkan versi build yang akan di-push ke GitHub Container Registry
docker tag item-app:v1 ghcr.io/dadanabdullah/item-app:v1

# Menyimpan GitHub Personal Access Token (PAT) ke variable CR_PAT 
echo "Please input your GitHub PAT: "
read -s CR_PAT

# Melakukan login ke GitHub Container Registry
echo "Loging in to GitHub Container Registry .."
echo $CR_PAT | docker login ghcr.io -u dadanabdullah --password-stdin

# Mengunggah image dengan tag ghcr.io/dadanabdullah/item-app:v1 ke GitHub Container Registry
echo "Pushing image to GitHub Container Registry .."
docker push ghcr.io/dadanabdullah/item-app:v1

echo "Image pushed"