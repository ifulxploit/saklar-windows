-- Banner deskripsi tool dan author
print([[
============================================
|          Program Penjadwalan              |
|           Menyalakan/Mematikan            |
|                 Komputer                  |
|------------------------------------------|
|                 Author                   |
|              Ifulxploit                   |
|------------------------------------------|
|  Program ini berguna untuk menyalakan     |
|  atau mematikan komputer pada waktu yang  |
|  telah ditentukan. Anda dapat menentukan  |
|  waktu kapan komputer harus dinyalakan    |
|  atau dimatikan sesuai dengan kebutuhan   |
|  Anda.                                    |
============================================
]])

print("Silakan masukkan waktu untuk menyalakan dan mematikan komputer (24 jam format).")

-- Meminta waktu untuk menyalakan komputer dari pengguna
io.write("Waktu untuk menyalakan komputer (yyyy-mm-dd hh:mm): ")
local start_time_str = io.read()

-- Mengubah format string ke format waktu
local start_time = os.time{year=tonumber(start_time_str:sub(1,4)), 
                           month=tonumber(start_time_str:sub(6,7)), 
                           day=tonumber(start_time_str:sub(9,10)), 
                           hour=tonumber(start_time_str:sub(12,13)), 
                           min=tonumber(start_time_str:sub(15,16))}

-- Meminta waktu untuk mematikan komputer dari pengguna
io.write("Waktu untuk mematikan komputer (yyyy-mm-dd hh:mm): ")
local end_time_str = io.read()

-- Mengubah format string ke format waktu
local end_time = os.time{year=tonumber(end_time_str:sub(1,4)), 
                         month=tonumber(end_time_str:sub(6,7)), 
                         day=tonumber(end_time_str:sub(9,10)), 
                         hour=tonumber(end_time_str:sub(12,13)), 
                         min=tonumber(end_time_str:sub(15,16))}

-- Looping untuk menunggu sampai waktu untuk menyalakan atau mematikan komputer tercapai
while os.time() < start_time or os.time() > end_time do
  os.execute("sleep 60")
end

-- Menyalakan atau mematikan komputer sesuai dengan waktu yang ditentukan
if os.time() >= start_time and os.time() <= end_time then
  os.execute("shutdown -s -t 0")
else
  os.execute("shutdown -r -t 0")
end
