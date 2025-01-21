#!/bin/bash

# A function to download a file using megatools
download_file() {
    local url="$1"
    local output_dir="$2"
    echo "Starting download for: $url"
    megadl --path="$output_dir" "$url"
    if [[ $? -eq 0 ]]; then
        echo "Download completed for: $url"
    else
        echo "Error downloading: $url"
    fi
}

# Default output directory and number of threads
output_dir="downloads"
threads=2

# MEGA links array (paste your links here)
urls=(
    https://mega.nz/folder/JiVgAYxQ#U7Q8FMunYKFIA3q_QZEVYw/folder/Z3sH0DIT/aff=xLNT78C-lBQ/aff=xLNT78C-lBQ
https://mega.nz/folder/wyk1SB6b#RZVgaKMhgtmdUKV9oZ5rrA/folder/9v8TFYIC/aff=xLNT78C-lBQ/aff=xLNT78C-lBQ
https://mega.nz/folder/DUMhnIAB#zk5jy-e0_dxfjiVjbWjM-A/folder/vU0ykJ6C/aff=xLNT78C-lBQ/aff=xLNT78C-lBQ
https://mega.nz/folder/pREkiKoY#cymIoLGw7dgVC26M2B1Zlg/folder/QQlBnBIS/aff=xLNT78C-lBQ
https://mega.nz/folder/ICY2jLpb#fhf_rXdMxWOCKhvs113E-Q/folder/MDQi0TYC/aff=xLNT78C-lBQ
https://mega.nz/folder/dPIwCKjK#hFMq1j3fZlKpCSz4K-mPOQ/aff=xLNT78C-lBQ
https://mega.nz/folder/JDEyWYgC#fPdTwCZ83--XWjsEV_ElLw/folder/QbsViaJS/aff=xLNT78C-lBQ
https://mega.nz/folder/RCBwiISa#Dt6U21R0EIPuOxr9-j7d2A/folder/pW5EUT5I/aff=xLNT78C-lBQ
https://mega.nz/folder/l38GUDiC#JAs2sqiIHhWheBPlokGoVQ/folder/Zz9yEaBa/aff=xLNT78C-lBQ
https://mega.nz/folder/IH010QSZ#sUNgum3IMmc3rn-SG-Uv6g/folder/IKljRCqZ/aff=xLNT78C-lBQ
https://mega.nz/folder/IqEyhBhS#roYuX_UoSPuNOCr_YFRT7Q/folder/4z9jgD5Q/aff=xLNT78C-lBQ
https://mega.nz/folder/tudnEAQT#2NEZwh0OJm0NGbRHrWhTEw/folder/MrtT3TiA/aff=xLNT78C-lBQ
https://mega.nz/folder/RTknkY6L#iQVJnmSYaBp89cnaKVaKDQ/folder/MG8n1QQA/aff=xLNT78C-lBQ
https://mega.nz/folder/kSFlgYba#HD44nZPw-JxHOAA7jC8gpg/folder/la1gCIyb/aff=xLNT78C-lBQ
https://mega.nz/folder/8MU1GALT#dsr9jWqiXiEsxzH5u7xdSQ/folder/NdMCmLrD/aff=xLNT78C-lBQ
https://mega.nz/folder/cElxyYYI#dsmIzR-RN_GUQYfmY-KQ_g/folder/5ZtymaxA/aff=xLNT78C-lBQ
https://mega.nz/folder/pLlQhApR#eRZcZoUw_whZID3zosBwBA/folder/UG1QGJ7Q/aff=xLNT78C-lBQ
https://mega.nz/folder/97ETkYZC#TULy2LTNuob-BwZNbtkg2Q/aff=xLNT78C-lBQ
https://mega.nz/folder/AbNCDYob#D71PQJe9oMJgEFpW7yQfZg/folder/tOklTYxY/aff=xLNT78C-lBQ
https://mega.nz/folder/IGFxFLjY#JfruOTt4eghaLwtjj7e3-w/aff=xLNT78C-lBQ
https://mega.nz/folder/8nkywSaI#tPreeBFbjW8UYNA4NCO4Vw/aff=xLNT78C-lBQ
https://mega.nz/folder/UaAGXRgS#tbRSghYyVz_gKO0K471GMw/aff=xLNT78C-lBQ
https://mega.nz/folder/46FRHZKT#UrTRJpyW6CtkFL8gsrkA3Q/aff=xLNT78C-lBQ
https://mega.nz/folder/cT4jFAjJ#JC3nPL95_9ITgA4kWyHQQA/aff=xLNT78C-lBQ
https://mega.nz/folder/Nj0yWAhR#Ys-pS8Udfg1-LcNh-QwkVg/aff=xLNT78C-lBQ
https://mega.nz/folder/AL5XXIpD#qHU_5MP4OgR1EYwnvTmeYw/aff=xLNT78C-lBQ
https://mega.nz/folder/BfdnmAqT#QI9VrP6YO8DmQkmPgwo3Kg/aff=xLNT78C-lBQ
https://mega.nz/folder/wDkmlQCL#3XVtcZMAdD78efOhykE1OA/aff=xLNT78C-lBQ
https://mega.nz/folder/QydSxQIC#YtQ5VxE0uSzGafF3MXzE_Q/aff=xLNT78C-lBQ
https://mega.nz/folder/pQtmlRqB#kpF20z3Ps8ZrKZKUCpuK1A/aff=xLNT78C-lBQ
https://mega.nz/folder/9OlySSqA#hzxwRL0kd8EF3-5sUYZmSA/aff=xLNT78C-lBQ
https://mega.nz/folder/k7k3lDSK#W8sLacbkguvlK321ITnmNw/aff=xLNT78C-lBQ
https://mega.nz/folder/o2ECxSTZ#2_3ry0zj1ehPbvvHNRWAnQ/folder/t3cwTBiQ/aff=xLNT78C-lBQ
https://mega.nz/folder/Bm0AHLLC#X8qFsMt7mGIQBFu2G-rJmA/aff=xLNT78C-lBQ
https://mega.nz/folder/U3ki3SSD#92ygnuTdTZ7LbFWvmFPHlQ/folder/xyU0lBia/aff=xLNT78C-lBQ
https://mega.nz/folder/xWUTCLRa#XipZTqqvnXJgm2O0E15WDA/aff=xLNT78C-lBQ
https://mega.nz/folder/NWUhVDSa#nR_a7mjGAU6s98J4Gtefgg/aff=xLNT78C-lBQ
https://mega.nz/folder/VAUD2bYR#OZAon5DjsInQzTK4eRB5Ng/aff=xLNT78C-lBQ
https://mega.nz/folder/oCMBXYgY#pp-IuihK06SDV9a8nl9o3A/aff=xLNT78C-lBQ
https://mega.nz/folder/dv81WDbY#9WPxp8_Le4pj46z5StFjUg/aff=xLNT78C-lBQ
https://mega.nz/folder/RKdmGDyL#gAebNQeSO67bDuU7HIoEnQ/aff=xLNT78C-lBQ
https://mega.nz/folder/EPUB2JgL#Fwuq0yHh3pVPDqM1T8imCQ/aff=xLNT78C-lBQ
https://mega.nz/folder/NrFzRajC#zPG3OFT7Z6_hCj0Iwk4mLw/aff=xLNT78C-lBQ
https://mega.nz/folder/BnV03RBa#xIcZxLVzW1PfPARTWKsv_g/aff=xLNT78C-lBQ
https://mega.nz/folder/QBdj1JhS#2m9ayOCqe9Ou0bMBGsWr1A/aff=xLNT78C-lBQ
https://mega.nz/folder/QBdj1JhS#2m9ayOCqe9Ou0bMBGsWr1A/aff=xLNT78C-lBQ
https://mega.nz/folder/oSkW2LJb#rFwV3tOImWnrewOS59KEkQ/aff=xLNT78C-lBQ
https://mega.nz/folder/NDN3EI4b#JWnlcab0KBY7rQ_0LFfLIA/aff=xLNT78C-lBQ
https://mega.nz/folder/wRF1lQpa#G03DpXtXx_1iqZJbusqBJQ/aff=xLNT78C-lBQ
https://mega.nz/folder/1P9UTY6K#7isAyjUQconCfCBZSEBErw/aff=xLNT78C-lBQ
https://mega.nz/folder/hr9ygCLZ#4VrnZ2CfO8SIdudYw8knnQ/aff=xLNT78C-lBQ
https://mega.nz/folder/wOMzAIBL#kPPR5MhpgnaarnSxtYRblg/aff=xLNT78C-lBQ
https://mega.nz/folder/hLlwCCbC#_ti7dlAQFDrNL6khYkKNig/aff=xLNT78C-lBQ
https://mega.nz/folder/QvdmnAjS#UD-Y47p_xj9_eLfIQ3v6yw/aff=xLNT78C-lBQ
https://mega.nz/folder/8eEwHRpI#H9YKiM4MtvddcRa8Lit1NA/aff=xLNT78C-lBQ
https://mega.nz/folder/Vn1GVAoY#2cOS63QxvIm1OEXwX1tNew/aff=xLNT78C-lBQ
https://mega.nz/folder/g2dkmKYI#knmUJtlnzbdNMnNzwo-sYQ/aff=xLNT78C-lBQ
https://mega.nz/folder/VGUUlYaD#JhZBbn6cUcRjvuPEdw2u5A/aff=xLNT78C-lBQ
https://mega.nz/folder/MjtFhART#44C9fwkZivxNVjYlKhEieg/aff=xLNT78C-lBQ
https://mega.nz/folder/BblTEK6Q#wbNFbQ_i8NLLuHrbpZ8G_Q/aff=xLNT78C-lBQ
https://mega.nz/folder/dZsxlKQb#cE9Gngvhq91v2EIDV9O3Ew/aff=xLNT78C-lBQ
https://mega.nz/folder/QOlQDCbB#v8U2AHhPbCbM03lVY0tBpg/aff=xLNT78C-lBQ
https://mega.nz/folder/xB9hEQJC#2DMkKIwN_doE4cEg9IEy4w/aff=xLNT78C-lBQ
https://mega.nz/folder/hd8UDQIb#OrGGLoj7xqRDgGizFoZrNw/aff=xLNT78C-lBQ
https://mega.nz/folder/JiVgAYxQ#U7Q8FMunYKFIA3q_QZEVYw/folder/k3tR2bBA

)

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

# Check if there are URLs to process
if [[ ${#urls[@]} -eq 0 ]]; then
    echo "Error: No URLs provided."
    exit 1
fi

# Download files using multiple threads
echo "Starting downloads with $threads threads..."
for url in "${urls[@]}"; do
    ((i=i%threads)); ((i++==0)) && wait
    download_file "$url" "$output_dir" &
done

wait
echo "All downloads completed."
