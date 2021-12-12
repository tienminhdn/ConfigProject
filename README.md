# ConfigProject
## 1. Tạo project từ Xcode
## 2. Xác định mô hình hoặc template nếu có.
- Chúng ta cần xác định được nên chọn loại architect pattern nào dựa vào một vài tiêu chí sau đây:

    Sự nhanh nhẹn (agility)  ✅
  
   Dễ dàng phát triển (easy for development) ✅
  
   Kiểm thử (testability) ✅
  
   Hiệu suất (performance) ✅
  
   Khả năng mở rộng (scalability) ✅

   Tái sử dụng mã (code reusable) ✅
   
   ==> Mô hình template ở đây chúng ta sẽ dùng mô mình **MVVM**
   - MVVM: mô hình phổ biến được áp dụng để phát triển một ứng dụng dễ kết hợp, dễ kiểm thử và dễ duy trì.
   - MVVM (Model – View – ViewModel) là mô hình hỗ trợ two-way data binding (ràng buộc dữ liệu) giữa View và ViewModel.
   *Model
        Giống như mô hình MVP và MVC, Model trong MVVM là bộ phận đại diện cho các tầng business logic, định nghĩa business rules cho dữ liệu.

   *View
        Đây là nơi cho phép người dùng tương tác, đưa ra yêu cầu.

   *View Model
        Đây là lớp trung gian giữa View và Model và xem như thành phần thay thế cho Controller trong mô hình MVC.

![](./ConfigProject/img/mvvm.png)
## 3. Setup các Package Manager(SPM, Cocoapods, Carthage)

## 4. Cấu trúc lại các folder trong project.

## 5. Cấu hình các môi trường cho dự án. (Dev, STG, PRO)

## 6. Define các key, text và color

## 7. Config swiftlint, fastlane, deploygate cho project

## 8. Thiết lập auto deploy TravisCI
