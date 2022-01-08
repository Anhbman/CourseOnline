-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 08, 2022 lúc 02:23 PM
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
  `Category_name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`Category_ID`, `Category_name`) VALUES
(1, 'Category 1'),
(2, 'Category 2'),
(3, 'Category 3'),
(4, 'Category 4'),
(5, 'Category 5');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chap`
--

CREATE TABLE `chap` (
  `Chap_ID` int(11) NOT NULL,
  `Chap_header` varchar(256) NOT NULL,
  `Chap_description` varchar(512) NOT NULL,
  `Course_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `chap`
--

INSERT INTO `chap` (`Chap_ID`, `Chap_header`, `Chap_description`, `Course_ID`) VALUES
(2, 'phan 1 khoa hoc 1', '', 2),
(3, 'phan 1 khoa hoc 2', '', 3),
(4, 'phan 2 khoa hoc 2', '', 3),
(5, 'phan 3 khoa hoc 2', '', 3),
(6, 'phan 1 khoa hoc 3', '', 4),
(7, 'phan 1 khoa hoc 5', '', 6),
(8, 'phan 1 khoa hoc 6', '', 7),
(10, 'phan 2 khoa hoc 6', '', 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `Comment_ID` int(11) NOT NULL,
  `Comment_content` mediumtext DEFAULT NULL,
  `Comment_by` int(11) DEFAULT NULL,
  `Comment_in` int(11) DEFAULT NULL,
  `User_rate` decimal(10,0) DEFAULT NULL,
  `Comment_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`Comment_ID`, `Comment_content`, `Comment_by`, `Comment_in`, `User_rate`, `Comment_at`) VALUES
(5, 'dit cot vezi gut', 7, 7, '4', '2021-12-28 15:18:36'),
(6, 'dit cot vezi nai', 6, 7, '5', '2021-12-28 15:18:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `course`
--

CREATE TABLE `course` (
  `Course_ID` int(11) NOT NULL,
  `Author_ID` int(11) NOT NULL,
  `Course_header` mediumtext DEFAULT NULL,
  `Course_description` mediumtext NOT NULL,
  `Course_price` decimal(10,0) NOT NULL,
  `Course_createdAt` datetime DEFAULT NULL,
  `Course_updatedAt` datetime DEFAULT NULL,
  `Course_image` mediumtext NOT NULL,
  `Course_approve` tinyint(1) DEFAULT 0,
  `Course_category` int(11) NOT NULL,
  `Course_rate` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `course`
--

INSERT INTO `course` (`Course_ID`, `Author_ID`, `Course_header`, `Course_description`, `Course_price`, `Course_createdAt`, `Course_updatedAt`, `Course_image`, `Course_approve`, `Course_category`, `Course_rate`) VALUES
(2, 2, 'Header 1', 'Des 1', '1000', '2021-12-27 08:40:59', '2021-12-27 08:40:59', 'Image 1', 1, 1, 0),
(3, 3, 'Header 2', 'Des 2', '1500', '2021-12-27 09:02:02', '2021-12-27 09:02:02', 'Image 2', 1, 2, 0),
(4, 5, 'Header 3', 'Des 3', '1500', '2021-12-27 09:02:24', '2021-12-27 09:02:24', 'Image 3', 1, 3, 0),
(5, 5, 'Header 4', 'Des 4', '1500', '2021-12-27 09:02:37', '2021-12-27 09:02:37', 'Image 4', 0, 4, 0),
(6, 5, 'Header 5', 'Des 5', '1500', '2021-12-27 09:02:49', '2021-12-27 09:02:49', 'Image 5', 0, 5, 0),
(7, 3, 'Header 6', 'Des 6', '1500', '2021-12-27 09:03:33', '2021-12-27 09:03:33', 'Image 6', 0, 5, 4.5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `courseenrollment`
--

CREATE TABLE `courseenrollment` (
  `User_ID` int(11) DEFAULT NULL,
  `Course_ID` int(11) DEFAULT NULL,
  `Payment_ID` int(11) DEFAULT NULL,
  `Payment_date` datetime DEFAULT NULL,
  `Learning_history` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `courseenrollment`
--

INSERT INTO `courseenrollment` (`User_ID`, `Course_ID`, `Payment_ID`, `Payment_date`, `Learning_history`) VALUES
(6, 3, 3, '2021-12-27 16:26:21', NULL),
(6, 7, 4, '2021-12-28 07:43:13', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coursetag`
--

CREATE TABLE `coursetag` (
  `Course_ID` int(11) NOT NULL,
  `Tag_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `coursetag`
--

INSERT INTO `coursetag` (`Course_ID`, `Tag_ID`) VALUES
(2, 1),
(3, 5),
(4, 8),
(5, 12),
(6, 13),
(7, 15),
(2, 2),
(3, 6),
(4, 7),
(4, 9),
(6, 14);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lesson`
--

CREATE TABLE `lesson` (
  `Lesson_ID` int(11) NOT NULL,
  `Chap_ID` int(11) NOT NULL,
  `Lesson_header` mediumtext NOT NULL,
  `Lesson_description` mediumtext NOT NULL,
  `Lesson_uploadedAt` datetime DEFAULT NULL,
  `Lesson_video` mediumtext DEFAULT NULL,
  `Lesson_view` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `lesson`
--

INSERT INTO `lesson` (`Lesson_ID`, `Chap_ID`, `Lesson_header`, `Lesson_description`, `Lesson_uploadedAt`, `Lesson_video`, `Lesson_view`) VALUES
(1, 2, 'Head 1_1', 'Des 1_1', '2021-12-27 08:52:58', 'https://www.youtube.com/watch?v=lTRiuFIWV54', 0),
(2, 2, 'Head 1_2', 'Des 1_2', '2021-12-27 08:53:30', 'https://www.youtube.com/watch?v=_tV5LEBDs7w', 0),
(3, 3, 'Head 3_1', 'Des 3_1', '2021-12-27 09:05:55', 'https://www.youtube.com/watch?v=5Q2Pc-e-8Qc', 0),
(4, 4, 'Head 3_2', 'Des 3_2', '2021-12-27 09:06:17', 'https://www.youtube.com/watch?v=C2dTGSd3ax4', 0),
(5, 5, 'Head 3_3', 'Des 3_3', '2021-12-27 09:06:38', 'https://www.youtube.com/watch?v=8FHAZQIgJIg', 0),
(6, 6, 'Head 4_1', 'Des 4_1', '2021-12-27 09:06:58', 'https://www.youtube.com/watch?v=ok7kbM38NlM', 0),
(7, 6, 'Head 4_2', 'Des 4_2', '2021-12-27 09:07:09', 'https://www.youtube.com/watch?v=MFaVlU28l2g', 0),
(8, 6, 'Head 4_3', 'Des 4_3', '2021-12-27 09:07:36', 'https://www.youtube.com/watch?v=7Lf8dZ1fj1Y', 0),
(9, 7, 'Head 5_1', 'Des 5_1', '2021-12-27 09:07:56', 'https://www.youtube.com/watch?v=hoFMs-AD_Pc', 0),
(10, 8, 'Head 6_1', 'Des 6_1', '2021-12-27 09:08:13', 'https://www.youtube.com/watch?v=BtG48vVGgGA', 0),
(11, 8, 'Head 6_2', 'Des 6_2', '2021-12-27 09:08:47', 'https://www.youtube.com/watch?v=BtG48vVGgGA', 0),
(12, 10, 'Head 6_3', 'Des 6_3', '2021-12-27 09:08:59', 'https://www.youtube.com/watch?v=lWA1YQxYdyc', 0),
(13, 10, 'Head 6_4', 'Des 6_4', '2021-12-27 09:09:09', 'https://www.youtube.com/watch?v=jzPymvGWAGg', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `paymenthistory`
--

CREATE TABLE `paymenthistory` (
  `Payment_ID` int(11) NOT NULL,
  `Payment_price` decimal(10,0) DEFAULT NULL,
  `Payment_Note` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `paymenthistory`
--

INSERT INTO `paymenthistory` (`Payment_ID`, `Payment_price`, `Payment_Note`) VALUES
(3, '1500', NULL),
(4, '1500', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tag`
--

CREATE TABLE `tag` (
  `Tag_ID` int(11) NOT NULL,
  `Tag_name` varchar(20) NOT NULL,
  `Category_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tag`
--

INSERT INTO `tag` (`Tag_ID`, `Tag_name`, `Category_ID`) VALUES
(1, 'Tag1_1', 1),
(2, 'Tag1_2', 1),
(3, 'Tag1_3', 1),
(4, 'Tag2_1', 2),
(5, 'Tag2_2', 2),
(6, 'Tag2_3', 2),
(7, 'Tag3_1', 3),
(8, 'Tag3_2', 3),
(9, 'Tag3_3', 3),
(10, 'Tag4_1', 4),
(11, 'Tag4_2', 4),
(12, 'Tag4_3', 4),
(13, 'Tag5_1', 5),
(14, 'Tag5_2', 5),
(15, 'Tag5_3', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `teacherinformation`
--

CREATE TABLE `teacherinformation` (
  `Teacher_ID` int(11) NOT NULL,
  `Teacher_header` mediumtext DEFAULT NULL,
  `Teacher_description` mediumtext DEFAULT NULL,
  `Teacher_updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `teacherinformation`
--

INSERT INTO `teacherinformation` (`Teacher_ID`, `Teacher_header`, `Teacher_description`, `Teacher_updatedAt`) VALUES
(12, 'Giao vien dinh cao', 'Da co 1 ngay kinh nghiem', '2022-01-08 07:57:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `User_ID` int(11) NOT NULL,
  `User_account` varchar(256) NOT NULL,
  `User_password` varchar(256) NOT NULL,
  `User_name` varchar(256) NOT NULL,
  `User_DoB` date NOT NULL,
  `User_phone` varchar(12) NOT NULL,
  `User_lastSeen` datetime DEFAULT NULL,
  `User_role` int(11) NOT NULL,
  `User_image` mediumtext DEFAULT NULL,
  `User_createdAt` datetime DEFAULT NULL,
  `User_updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`User_ID`, `User_account`, `User_password`, `User_name`, `User_DoB`, `User_phone`, `User_lastSeen`, `User_role`, `User_image`, `User_createdAt`, `User_updatedAt`) VALUES
(2, 'teacher1@gmail.com', '$2y$10$7bcxh7EPVNSzoUN/C47pge4ZNV5.5/rixFAVc3KEfJSdVicM54mEa', 'Teacher 1', '2000-12-10', '000000000001', NULL, 1, 'NULL', '2021-12-27 08:22:22', '2021-12-27 08:22:22'),
(3, 'teacher2@gmail.com', '$2y$10$7bcxh7EPVNSzoUN/C47pge4ZNV5.5/rixFAVc3KEfJSdVicM54mEa', 'Teacher 2', '2000-12-11', '000000000002', NULL, 1, 'NULL', '2021-12-27 08:55:05', '2021-12-27 08:55:05'),
(4, 'admin@gmail.com', '$2y$10$7bcxh7EPVNSzoUN/C47pge4ZNV5.5/rixFAVc3KEfJSdVicM54mEa', 'Admin', '2000-12-12', '000000000003', NULL, 0, 'NULL', '2021-12-27 08:55:59', '2021-12-27 08:55:59'),
(5, 'teacher3@gmail.com', '$2y$10$7bcxh7EPVNSzoUN/C47pge4ZNV5.5/rixFAVc3KEfJSdVicM54mEa', 'Teacher 3', '2000-12-13', '000000000004', NULL, 1, 'NULL', '2021-12-27 08:56:38', '2021-12-27 08:56:38'),
(6, 'user1@gmail.com', '$2y$10$7bcxh7EPVNSzoUN/C47pge4ZNV5.5/rixFAVc3KEfJSdVicM54mEa', 'user 1', '2000-12-14', '000000000005', NULL, 2, 'NULL', '2021-12-27 15:53:56', '2021-12-27 15:53:56'),
(7, 'user2@gmail.com', '$2y$10$7bcxh7EPVNSzoUN/C47pge4ZNV5.5/rixFAVc3KEfJSdVicM54mEa', 'user 2', '2000-12-15', '000000000006', NULL, 2, 'NULL', '2021-12-28 15:14:57', '2021-12-28 15:14:57'),
(9, 'user4@gmail.com', '$2y$10$7bcxh7EPVNSzoUN/C47pge4ZNV5.5/rixFAVc3KEfJSdVicM54mEa', 'user 4', '2000-12-17', '000000000008', NULL, 2, NULL, '2022-01-07 15:37:26', '2022-01-07 15:37:26'),
(12, 'teacher4@gmail.com', '$2y$10$Nez60w.dpS10Z6aCfhAlv.X2XXeX7qq0nQrdyejbZQhpknZSv8AFe', 'teacher 4', '2000-12-18', '000000000009', NULL, 1, NULL, NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Category_ID`),
  ADD UNIQUE KEY `Category_name` (`Category_name`);

--
-- Chỉ mục cho bảng `chap`
--
ALTER TABLE `chap`
  ADD PRIMARY KEY (`Chap_ID`),
  ADD KEY `fk_chap_course_id` (`Course_ID`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`Comment_ID`),
  ADD KEY `Comment_by` (`Comment_by`),
  ADD KEY `Comment_in` (`Comment_in`);

--
-- Chỉ mục cho bảng `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`Course_ID`),
  ADD KEY `Author_ID` (`Author_ID`),
  ADD KEY `fk_category_id` (`Course_category`);

--
-- Chỉ mục cho bảng `courseenrollment`
--
ALTER TABLE `courseenrollment`
  ADD KEY `Payment_ID` (`Payment_ID`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `Course_ID` (`Course_ID`),
  ADD KEY `Learning_history` (`Learning_history`);

--
-- Chỉ mục cho bảng `coursetag`
--
ALTER TABLE `coursetag`
  ADD KEY `fk_coursetag_course_id` (`Course_ID`),
  ADD KEY `fk_coursetag_tag_id` (`Tag_ID`);

--
-- Chỉ mục cho bảng `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`Lesson_ID`),
  ADD KEY `Course_ID` (`Chap_ID`);

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
  ADD UNIQUE KEY `Tag_name` (`Tag_name`),
  ADD KEY `Category_ID` (`Category_ID`);

--
-- Chỉ mục cho bảng `teacherinformation`
--
ALTER TABLE `teacherinformation`
  ADD KEY `fk_teacherinfor_teacher_id` (`Teacher_ID`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `User_account` (`User_account`),
  ADD UNIQUE KEY `User_phone` (`User_phone`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `Category_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `chap`
--
ALTER TABLE `chap`
  MODIFY `Chap_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `Comment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `course`
--
ALTER TABLE `course`
  MODIFY `Course_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `lesson`
--
ALTER TABLE `lesson`
  MODIFY `Lesson_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `paymenthistory`
--
ALTER TABLE `paymenthistory`
  MODIFY `Payment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `tag`
--
ALTER TABLE `tag`
  MODIFY `Tag_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chap`
--
ALTER TABLE `chap`
  ADD CONSTRAINT `fk_chap_course_id` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`);

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`Comment_by`) REFERENCES `user` (`User_ID`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`Comment_in`) REFERENCES `course` (`Course_ID`);

--
-- Các ràng buộc cho bảng `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_2` FOREIGN KEY (`Author_ID`) REFERENCES `user` (`User_ID`),
  ADD CONSTRAINT `fk_category_id` FOREIGN KEY (`Course_category`) REFERENCES `category` (`Category_ID`);

--
-- Các ràng buộc cho bảng `courseenrollment`
--
ALTER TABLE `courseenrollment`
  ADD CONSTRAINT `courseenrollment_ibfk_1` FOREIGN KEY (`Payment_ID`) REFERENCES `paymenthistory` (`Payment_ID`),
  ADD CONSTRAINT `courseenrollment_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`),
  ADD CONSTRAINT `courseenrollment_ibfk_3` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`),
  ADD CONSTRAINT `courseenrollment_ibfk_4` FOREIGN KEY (`Learning_history`) REFERENCES `lesson` (`Lesson_ID`);

--
-- Các ràng buộc cho bảng `coursetag`
--
ALTER TABLE `coursetag`
  ADD CONSTRAINT `fk_coursetag_course_id` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`),
  ADD CONSTRAINT `fk_coursetag_tag_id` FOREIGN KEY (`Tag_ID`) REFERENCES `tag` (`Tag_ID`);

--
-- Các ràng buộc cho bảng `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`);

--
-- Các ràng buộc cho bảng `teacherinformation`
--
ALTER TABLE `teacherinformation`
  ADD CONSTRAINT `fk_teacherinfor_teacher_id` FOREIGN KEY (`Teacher_ID`) REFERENCES `user` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
