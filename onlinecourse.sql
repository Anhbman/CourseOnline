-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th10 28, 2021 lúc 05:47 AM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `courseonline`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `Category_ID` int(10) NOT NULL,
  `Category_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `course`
--

CREATE TABLE `course` (
  `Course_ID` int(10) NOT NULL,
  `Course_header` varchar(30) NOT NULL,
  `Course_description` text NOT NULL,
  `Course_price` int(10) UNSIGNED NOT NULL,
  `Author_ID` int(10) NOT NULL,
  `Course_image` text NOT NULL,
  `Course_approve` tinyint(1) NOT NULL,
  `Course_created` date NOT NULL,
  `Course_updated` date NOT NULL,
  `Course_tag` int(11) NOT NULL,
  `Course_rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `courseEnrollment`
--

CREATE TABLE `courseEnrollment` (
  `User_ID` int(11) NOT NULL,
  `Course_ID` int(11) NOT NULL,
  `Payment_ID` int(11) NOT NULL,
  `Payment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `Lesson_ID` int(10) NOT NULL,
  `Lesson_header` varchar(30) NOT NULL,
  `Lesson_description` text NOT NULL,
  `Lesson_video` text NOT NULL,
  `Course_ID` int(11) NOT NULL,
  `Lesson_time` date NOT NULL,
  `Lesson_view` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `paymenthistory`
--

CREATE TABLE `paymenthistory` (
  `Payment_ID` int(11) NOT NULL,
  `Payment_price` int(11) NOT NULL,
  `Payment_note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tag`
--

CREATE TABLE `tag` (
  `Tag_ID` int(11) NOT NULL,
  `Tag_name` varchar(30) NOT NULL,
  `Category_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `User_ID` int(11) NOT NULL,
  `User_cccount` varchar(40) NOT NULL,
  `User_password` varchar(30) NOT NULL,
  `User_DoB` date NOT NULL,
  `User_identify` varchar(12) NOT NULL,
  `User_phonenumber` varchar(15) NOT NULL,
  `User_lastseen` date NOT NULL,
  `User_role` int(11) NOT NULL,
  `User_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  ADD KEY `TeacherID` (`Author_ID`);

--
-- Chỉ mục cho bảng `courseEnrollment`
--
ALTER TABLE `courseEnrollment`
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
-- AUTO_INCREMENT cho bảng `course`
--
ALTER TABLE `course`
  MODIFY `Course_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `discuss`
--
ALTER TABLE `discuss`
  MODIFY `Discuss_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `lesson`
--
ALTER TABLE `lesson`
  MODIFY `Lesson_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `paymenthistory`
--
ALTER TABLE `paymenthistory`
  MODIFY `Payment_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tag`
--
ALTER TABLE `tag`
  MODIFY `Tag_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`Author_ID`) REFERENCES `user` (`User_ID`);

--
-- Các ràng buộc cho bảng `courseEnrollment`
--
ALTER TABLE `courseEnrollment`
  ADD CONSTRAINT `courseEnrollment_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`),
  ADD CONSTRAINT `courseEnrollment_ibfk_2` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`),
  ADD CONSTRAINT `courseEnrollment_ibfk_3` FOREIGN KEY (`Payment_ID`) REFERENCES `paymenthistory` (`Payment_ID`);

--
-- Các ràng buộc cho bảng `discuss`
--
ALTER TABLE `discuss`
  ADD CONSTRAINT `discuss_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`),
  ADD CONSTRAINT `discuss_ibfk_2` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`);

--
-- Các ràng buộc cho bảng `lesson`
--
ALTER TABLE `lesson`
  ADD CONSTRAINT `lesson_ibfk_1` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`);

--
-- Các ràng buộc cho bảng `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
