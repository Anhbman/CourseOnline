-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 02, 2021 lúc 04:53 PM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `onlinecourse`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `Category_ID` int(11) NOT NULL,
  `Category_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`Category_ID`, `Category_name`) VALUES
(1, 'Data Science'),
(2, 'Business'),
(3, 'Information Technology'),
(4, 'Language Learning'),
(5, 'Health'),
(6, 'Personal Development'),
(7, 'Social Sciences'),
(8, 'Arts and Humanities'),
(9, 'Math and Logic'),
(10, 'Basic Sciences');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `course`
--

CREATE TABLE `course` (
  `Course_ID` int(11) NOT NULL,
  `Course_header` varchar(250) NOT NULL,
  `Course_description` text NOT NULL,
  `Course_price` int(11) NOT NULL,
  `Author_ID` int(11) NOT NULL,
  `Course_image` text NOT NULL,
  `Course_approve` tinyint(1) NOT NULL,
  `Course_created` date NOT NULL,
  `Course_updated` date NOT NULL,
  `Course_tag` int(11) NOT NULL,
  `Course_rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `course`
--

INSERT INTO `course` (`Course_ID`, `Course_header`, `Course_description`, `Course_price`, `Author_ID`, `Course_image`, `Course_approve`, `Course_created`, `Course_updated`, `Course_tag`, `Course_rate`) VALUES
(1, 'Course 1', 'Super Pro Course', 100000, 5, 'https://i.ytimg.com/vi/X8D8ujcY1NM/maxresdefault.jpg', 0, '2021-12-02', '2021-12-02', 1, 0),
(2, 'Course 2', 'Khoa hoc cua gai ', 100000, 6, 'https://kenh14cdn.com/thumb_w/660/203336854389633024/2021/7/20/photo-1-16267729270061905629195.jpg', 1, '2021-12-02', '2021-12-02', 8, 5),
(3, 'Course 3', 'Khoa hoc tia nen', 500000, 6, 'https://st.quantrimang.com/photos/image/2021/07/17/thoi-nen-2.jpg', 1, '2021-12-02', '2021-12-02', 9, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `courseEnrollment`
--

CREATE TABLE `courseenrollment` (
  `User_ID` int(11) NOT NULL,
  `Course_ID` int(11) NOT NULL,
  `Payment_ID` int(11) NOT NULL,
  `Payment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `courseEnrollment`
--

INSERT INTO `courseenrollment` (`User_ID`, `Course_ID`, `Payment_ID`, `Payment_date`) VALUES
(2, 1, 1, '2021-12-02'),
(8, 3, 2, '2021-12-02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discuss`
--

CREATE TABLE `discuss` (
  `Discuss_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Discuss_content` text NOT NULL,
  `Course_ID` int(11) NOT NULL,
  `Discuss_created` date NOT NULL,
  `Parent_discuss_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lesson`
--

CREATE TABLE `lesson` (
  `Lesson_ID` int(11) NOT NULL,
  `Lesson_header` varchar(250) NOT NULL,
  `Lesson_description` text NOT NULL,
  `Lesson_video` text NOT NULL,
  `Course_ID` int(11) NOT NULL,
  `Lesson_time` date NOT NULL,
  `Lesson_view` int(11) NOT NULL,
  `List_id` int(11) NOT NULL,
  `List_name` varchar(250) NOT NULL,
  `Lesson_created` date NOT NULL,
  `Lesson_updated` date NOT NULL,
  `Trial` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `lesson`
--

INSERT INTO `lesson` (`Lesson_ID`, `Lesson_header`, `Lesson_description`, `Lesson_video`, `Course_ID`, `Lesson_time`, `Lesson_view`, `List_id`, `List_name`, `Lesson_created`, `Lesson_updated`, `Trial`) VALUES
(1, 'Lesson1_Course1', 'Super 1', 'https://www.youtube.com/watch?v=5JOgsWOS-CM', 1, '0000-00-00', 0, 0, '', '2021-12-02', '2021-12-02', 1),
(2, 'Lesson2_Course1', 'Super 2', 'https://www.youtube.com/watch?v=5JOgsWOS-CM', 1, '0000-00-00', 0, 0, '', '2021-12-02', '2021-12-02', 1),
(3, 'Lesson3_Course1', 'Super 3', 'https://www.youtube.com/watch?v=5JOgsWOS-CM', 1, '0000-00-00', 0, 0, '', '2021-12-02', '2021-12-02', 0),
(4, 'Lesson1_Course2', 'cua gai 1', 'https://www.youtube.com/watch?v=5hMorzOgWBQ', 2, '0000-00-00', 0, 0, '', '2021-12-02', '2021-12-02', 0),
(5, 'Lesson1_Course3', 'Tia nen 1', 'https://www.youtube.com/watch?v=QjUJCvsZ4x4', 3, '0000-00-00', 0, 0, '', '2021-12-02', '2021-12-02', 1),
(6, 'Lesson2_Course3', 'Tia nen 2', 'https://www.youtube.com/watch?v=Skp1uAFHang', 3, '0000-00-00', 0, 0, '', '2021-12-02', '2021-12-02', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `paymenthistory`
--

CREATE TABLE `paymenthistory` (
  `Payment_ID` int(11) NOT NULL,
  `Payment_price` int(11) NOT NULL,
  `Payment_note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `paymenthistory`
--

INSERT INTO `paymenthistory` (`Payment_ID`, `Payment_price`, `Payment_note`) VALUES
(1, 100000, 'Lan dau thanh toan'),
(2, 500000, 'Thanh toan thu 2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tag`
--

CREATE TABLE `tag` (
  `Tag_ID` int(11) NOT NULL,
  `Tag_name` varchar(30) NOT NULL,
  `Category_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tag`
--

INSERT INTO `tag` (`Tag_ID`, `Tag_name`, `Category_ID`) VALUES
(1, 'Project Management', 2),
(2, 'Python', 1),
(3, 'Laravel', 3),
(5, 'English', 4),
(6, 'Psycology', 5),
(7, 'Critical Thinking', 6),
(8, 'Communication and Writing', 7),
(9, 'Design', 8),
(10, 'Calculus', 9),
(11, 'Physics', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `User_ID` int(11) NOT NULL,
  `User_account` varchar(250) NOT NULL,
  `User_password` varchar(100) NOT NULL,
  `User_name` varchar(50) NOT NULL,
  `User_gender` varchar(20) NOT NULL,
  `User_created` date NOT NULL,
  `User_updated` date NOT NULL,
  `User_DoB` date NOT NULL,
  `User_phonenumber` varchar(12) NOT NULL,
  `User_role` int(11) NOT NULL,
  `User_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`User_ID`, `User_account`, `User_password`, `User_name`, `User_gender`, `User_created`, `User_updated`, `User_DoB`, `User_phonenumber`, `User_role`, `User_image`) VALUES
(1, 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'admin', 'Male', '2021-12-02', '2021-12-02', '2000-12-10', '00000000001', 0, 'https://upload.wikimedia.org/wikipedia/commons/2/23/20190106_%28NEWSEN%29_%EB%B8%94%EB%9E%99%ED%95%91%ED%81%AC%28BLACKPINK%29%2C_%EC%88%98%EC%A4%8D%EC%9D%80_%EB%A7%8E%EC%9D%80_%EC%86%8C%EB%85%80%EC%A7%80%EB%A7%8C_%EB%8F%8B%EB%B3%B4%EC%9D%B4%EB%8A%94_%EC%95%84%EB%A6%84%EB%8B%A4%EC%9A%B4_%EB%AF%B8%EB%AA%A8_%28Golden_Disc_Awards_2019%29_%284%29.jpg'),
(2, 'haidz1@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Hai nguyen dz 1', 'Male', '2021-12-02', '2021-12-02', '2000-12-10', '0963175919', 1, 'https://upload.wikimedia.org/wikipedia/commons/2/23/20190106_%28NEWSEN%29_%EB%B8%94%EB%9E%99%ED%95%91%ED%81%AC%28BLACKPINK%29%2C_%EC%88%98%EC%A4%8D%EC%9D%80_%EB%A7%8E%EC%9D%80_%EC%86%8C%EB%85%80%EC%A7%80%EB%A7%8C_%EB%8F%8B%EB%B3%B4%EC%9D%B4%EB%8A%94_%EC%95%84%EB%A6%84%EB%8B%A4%EC%9A%B4_%EB%AF%B8%EB%AA%A8_%28Golden_Disc_Awards_2019%29_%284%29.jpg'),
(4, 'haidz2@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Hai nguyen dz 2', 'Male', '2021-12-02', '2021-12-02', '2000-12-11', '00000000002', 1, 'https://upload.wikimedia.org/wikipedia/commons/4/4d/Oh_Se-hun_at_Seoul_Fashion_Week_on_March_24%2C_2019_%281%29.png'),
(5, 'phongdz1@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Thay phong 1', 'Male', '2021-12-02', '2021-12-02', '2000-12-12', '00000000003', 2, 'https://static.wikia.nocookie.net/producerviet/images/0/0a/Kris_Wu.jpeg/revision/latest?cb=20210720020537&path-prefix=vi'),
(6, 'hoanganhdz1@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Thay hoang anh 1', 'Male', '2021-12-02', '2021-12-02', '2000-12-13', '00000000004', 2, 'https://image.thanhnien.vn/w660/Uploaded/2021/znetns/2021_03_26/725a8593_kmyk.jpg'),
(7, 'haidz3@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Hai nguyen dz 3', 'Male', '2021-12-02', '2021-12-02', '2000-12-14', '00000000005', 1, 'https://i.pinimg.com/474x/61/9d/2b/619d2b0917d40356672f24394df7fa47--zayan-malik-zayn-malik-hot.jpg'),
(8, 'haidz4@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Hai nguyen dz 4', 'Male', '2021-12-02', '2021-12-02', '2000-12-15', '00000000006', 1, 'https://media-cdn.laodong.vn/storage/newsportal/2021/5/7/906467/Justin-Bieber-World-.jpg'),
(9, 'haidz5@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Hai nguyen dz 5', 'Male', '2021-12-02', '2021-12-02', '2000-12-16', '00000000007', 1, 'https://kenh14cdn.com/thumb_w/660/2018/10/23/chris-hemsworth-shirtless-elsa-pataky-02-15402571547042083181785.jpg');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Category_ID`);

--
-- Chỉ mục cho bảng `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`Course_ID`),
  ADD KEY `Author_ID` (`Author_ID`),
  ADD KEY `Course_tag` (`Course_tag`);

--
-- Chỉ mục cho bảng `courseEnrollment`
--
ALTER TABLE `courseenrollment`
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `Course_ID` (`Course_ID`),
  ADD KEY `Payment_ID` (`Payment_ID`);

--
-- Chỉ mục cho bảng `discuss`
--
ALTER TABLE `discuss`
  ADD PRIMARY KEY (`Discuss_ID`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `Course_ID` (`Course_ID`);

--
-- Chỉ mục cho bảng `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`Lesson_ID`),
  ADD KEY `Course_ID` (`Course_ID`);

--
-- Chỉ mục cho bảng `paymenthistory`
--
ALTER TABLE `paymenthistory`
  ADD PRIMARY KEY (`Payment_ID`);

--
-- Chỉ mục cho bảng `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`Tag_ID`),
  ADD KEY `Category_ID` (`Category_ID`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `Category_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `course`
--
ALTER TABLE `course`
  MODIFY `Course_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `discuss`
--
ALTER TABLE `discuss`
  MODIFY `Discuss_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `lesson`
--
ALTER TABLE `lesson`
  MODIFY `Lesson_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `paymenthistory`
--
ALTER TABLE `paymenthistory`
  MODIFY `Payment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tag`
--
ALTER TABLE `tag`
  MODIFY `Tag_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `Course_ibfk_1` FOREIGN KEY (`Author_ID`) REFERENCES `user` (`User_ID`),
  ADD CONSTRAINT `Course_ibfk_2` FOREIGN KEY (`Course_tag`) REFERENCES `tag` (`Tag_ID`);

--
-- Các ràng buộc cho bảng `courseEnrollment`
--
ALTER TABLE `courseenrollment`
  ADD CONSTRAINT `CourseEnrollment_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`),
  ADD CONSTRAINT `CourseEnrollment_ibfk_2` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`),
  ADD CONSTRAINT `CourseEnrollment_ibfk_3` FOREIGN KEY (`Payment_ID`) REFERENCES `paymenthistory` (`Payment_ID`);

--
-- Các ràng buộc cho bảng `discuss`
--
ALTER TABLE `discuss`
  ADD CONSTRAINT `Discuss_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`),
  ADD CONSTRAINT `Discuss_ibfk_2` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`);

--
-- Các ràng buộc cho bảng `lesson`
--
ALTER TABLE `lesson`
  ADD CONSTRAINT `Lesson_ibfk_1` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`);

--
-- Các ràng buộc cho bảng `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `Tag_ibfk_1` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
