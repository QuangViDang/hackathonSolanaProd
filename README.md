# auto_tickets_solana

![image](https://github.com/coronatusvi/AnalosTekcit_HackthonSolana/assets/89189270/f1803939-d4f1-4434-9eb6-3dca11792b7a)

# Ứng dụng DApp AnalosTekcit trên nền tảng Solana:

## Project Description

### Giới thiệu:
Dự án này nhằm phát triển một ứng dụng phi tập trung (DApp) trên nền tảng Solana bằng framework Flutter của Google để giải quyết vấn đề đầu cơ và bán phá giá vé xem show âm nhạc. Ứng dụng sẽ cung cấp một nền tảng an toàn, minh bạch và phi tập trung cho các nhà tổ chức sự kiện âm nhạc để tạo, phân phối và quản lý vé. Đồng thời, nó cũng cho phép người hâm mộ mua vé một cách công bằng và dễ dàng.


### Vấn đề cần giải quyết:
Hiện nay, việc đầu cơ vé xem show âm nhạc đã trở thành một vấn nạn lớn trong ngành giải trí. Các đầu cơ thường sử dụng nhiều tài khoản khác nhau để mua số lượng lớn vé với mục đích bán lại với giá cao hơn. Điều này không chỉ gây ra thiệt hại tài chính cho người hâm mộ mà còn làm tăng nguy cơ gian lận và bất ổn cho các sự kiện.


### Giải pháp đề xuất:

Ứng dụng DApp Ticketing trên nền tảng Solana được xây dựng bằng Flutter của Google sẽ giải quyết vấn đề này bằng cách sử dụng công nghệ blockchain, NFT (Non-Fungible Token) và một cơ chế chống spam hiệu quả. Mỗi vé xem show sẽ được đính kèm với một NFT duy nhất, đảm bảo tính xác thực và ngăn chặn việc sao chép trái phép.
Quy trình hoạt động:
1. Nhà tổ chức sự kiện sẽ đăng ký trên ứng dụng và tạo ra một sự kiện mới, bao gồm thông tin như ngày giờ, địa điểm, giá vé, số lượng vé, v.v.
2. Khi tạo sự kiện, ứng dụng sẽ tự động tạo ra một số lượng NFT tương ứng với số lượng vé, sử dụng API **/sol/v1/nft/compressed/mint** của ShiftSDK. Mỗi NFT sẽ đại diện cho một vé duy nhất và không thể sao chép.
3. Người hâm mộ có thể truy cập ứng dụng, xem danh sách các sự kiện sắp tới, và mua vé bằng cách thanh toán một số tiền nhất định để nhận quyền sở hữu NFT tương ứng với vé đó. Việc chuyển nhượng NFT sẽ được thực hiện thông qua các API khác của ShiftSDK.

### Cơ chế chống spam:
Để ngăn chặn việc đầu cơ vé bằng cách sử dụng nhiều tài khoản khác nhau, ứng dụng sẽ áp dụng các biện pháp chống spam hiệu quả:

1. Sử dụng các công nghệ của Cloudflare để phát hiện và chặn các hoạt động đầu cơ thông qua việc giám sát và phân tích lưu lượng truy cập, địa chỉ IP, cookie, và các dấu hiệu khác.

2. Áp dụng các giải pháp chống proxy và VPN để ngăn chặn việc sử dụng các địa chỉ IP ẩn danh để đăng ký và mua vé từ nhiều tài khoản khác nhau.

3. Yêu cầu xác minh danh tính của người dùng (như số điện thoại, giấy tờ tùy thân, v.v.) cho các giao dịch mua vé lớn hoặc nghi ngờ có dấu hiệu đầu cơ.

4. Hạn chế số lượng vé mỗi người dùng có thể mua cho một sự kiện cụ thể, dựa trên các chính sách của nhà tổ chức sự kiện.

5. Sử dụng các thuật toán phân tích hành vi người dùng để phát hiện và chặn các hoạt động đầu cơ tinh vi hơn.

Để sử dụng các tính năng chống spam nâng cao này, nhà tổ chức sự kiện có thể chọn mua gói "Premium" với một khoản phí cao hơn, giúp bảo vệ quyền lợi của người hâm mộ và xây dựng một môi trường lành mạnh cho các show âm nhạc.



### Mô hình kinh doanh:
Ứng dụng sẽ có hai mô hình kinh doanh chính:
1. Đối với các sự kiện thường, nhà tổ chức sẽ phải trả một khoản phí nhỏ cho mỗi vé được tạo ra trên ứng dụng.
2. Đối với các sự kiện lớn, nhà tổ chức có thể chọn mua gói "Premium" với một khoản phí cao hơn để được sử dụng các tính năng chống spam nâng cao, giúp bảo vệ quyền lợi của người hâm mộ.

#### Lợi ích và đặc điểm nổi bật:
Minh bạch và công bằng: Việc sử dụng NFT và blockchain đảm bảo tính xác thực và trách nhiệm giải trình cho mỗi vé.
Chống đầu cơ và bán phá giá: Các biện pháp chống spam hiệu quả, bao gồm sử dụng công nghệ của Cloudflare, chống proxy/VPN, xác minh danh tính, hạn chế số lượng vé và phân tích hành vi người dùng, giúp bảo vệ quyền lợi của người hâm mộ và ngăn chặn hoạt động đầu cơ vé.
Phi tập trung: Ứng dụng hoạt động trên nền tảng Solana, loại bỏ sự phụ thuộc vào một bên thứ ba đáng tin cậy.
Tiện lợi và dễ sử dụng: Giao diện người dùng thân thiện trên nền tảng Flutter, cho phép mua và quản lý vé một cách dễ dàng.
Bảo mật: Sử dụng các giao thức bảo mật tiên tiến để bảo vệ thông tin người dùng và giao dịch.

### Kết luận
Ứng dụng DApp Ticketing trên nền tảng Solana được xây dựng bằng Flutter của Google sẽ cung cấp một giải pháp đột phá để giải quyết vấn nạn đầu cơ và bán phá giá vé xem show âm nhạc. Bằng cách kết hợp công nghệ blockchain, NFT và các biện pháp chống spam hiệu quả như sử dụng công nghệ của Cloudflare, chống proxy/VPN, xác minh danh tính, hạn chế số lượng vé và phân tích hành vi người dùng, ứng dụng sẽ tạo ra một môi trường công bằng, minh bạch và an toàn cho cả nhà tổ chức sự kiện và người hâm mộ. Đồng thời, mô hình kinh doanh dựa trên phí dịch vụ và gói Premium sẽ đảm bảo tính bền vững và lợi nhuận cho dự án.

