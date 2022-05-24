
/*********************/
Sau khi tải file nén về thì giải nén ra.

Các phần mềm cần có để chạy được ỨNg dụng:

- **[AndroidStudio](https://developer.android.com/studio)**
- **[Xampp (Version 8.1.6)](https://www.apachefriends.org/download.html)**

Sau khi caif đặt 2 phần mềm trên rồi thì bắt đầu thôi nào.

[****] Phần backend Api + web:
 + Sau khi cài đặt thành công Xampp: mở trình duyệt và tạo 1 Database bằng đường dẫn ['http://localhost/phpmyadmin/index.php'].
 + Tạo Database có tên : 'tcv' và import các bảng trong thư mục db vừa giải nén ra vào.
 + Di chuyển foder [tcv] vào thư mục htdocs của Xampp
 + Mở foder [tcv] ra và mở file .env:
    - Tìm dòng 'DB_CONNECTION=mysql'
    - Sửa DB_PORT thành 3306

[****] Phàn mobile App
 + Mở foder [truyencv_app] lên bằng [Androi Studio].
 + Mở file urls/url_api lên vài nhập ip Wifi đang sử dụng vào vd : 'http://+ip wifi'
 + Mở tab Terminal lên và chạy các lệnh sau: 
    - flutter pub get
    - flutter run --no-sound-null-safety (lệnh này đêy run app dưới dang debug)
    - flutter build apk --no-sound-null-safety (lệnh này để build ra apk file)

(^_^ phải nhớ bật xampp thì app mơi chạy được nhé)