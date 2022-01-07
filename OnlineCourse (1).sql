CREATE TABLE `User` (
  `User_ID` integer PRIMARY KEY AUTO_INCREMENT,
  `User_account` varchar(256) UNIQUE NOT NULL,
  `User_password` varchar(256) NOT NULL,
  `User_DoB` Date NOT NULL,
  `User_phone` varchar(12) UNIQUE NOT NULL,
  `User_lastSeen` datetime,
  `User_role` integer,
  `User_image` varchar(21844),
  `User_createdAt` datetime,
  `User_updatedAt` datetime
);

CREATE TABLE `Tag` (
  `Tag_ID` integer PRIMARY KEY AUTO_INCREMENT,
  `Tag_name` varchar(20) UNIQUE NOT NULL,
  `Category_ID` integer
);

CREATE TABLE `Category` (
  `Category_ID` integer PRIMARY KEY AUTO_INCREMENT,
  `Category_name` varchar(256) UNIQUE NOT NULL
);

CREATE TABLE `Course` (
  `Course_ID` integer PRIMARY KEY AUTO_INCREMENT,
  `Author_ID` integer NOT NULL,
  `Course_header` varchar(21844),
  `Course_description` varchar(21844) NOT NULL,
  `Course_price` numeric NOT NULL,
  `Course_createdAt` datetime,
  `Course_updatedAt` datetime,
  `Course_image` varchar(21844) NOT NULL,
  `Course_approve` boolean DEFAULT false,
  `Course_tag` integer NOT NULL,
  `Course_rate` float
);

CREATE TABLE `Lesson` (
  `Lesson_ID` integer PRIMARY KEY AUTO_INCREMENT,
  `Course_ID` integer NOT NULL,
  `Lesson_header` varchar(21844) NOT NULL,
  `Lesson_description` varchar(21844) NOT NULL,
  `Lesson_uploadedAt` datetime,
  `Lesson_video` varchar(21844),
  `Lesson_view` integer DEFAULT 0
);

CREATE TABLE `CourseEnrollment` (
  `User_ID` integer,
  `Course_ID` integer,
  `Payment_ID` integer,
  `Payment_date` datetime,
  `Learning_history` integer
);

CREATE TABLE `Discuss` (
  `Discuss_ID` integer PRIMARY KEY AUTO_INCREMENT,
  `Discuss_by` integer,
  `Disscuss_content` varchar(256),
  `Course_ID` integer,
  `Discuss_createdAt` datetime,
  `Parent_Discuss_ID` integer
);

CREATE TABLE `PaymentHistory` (
  `Payment_ID` integer PRIMARY KEY AUTO_INCREMENT,
  `Payment_price` numeric,
  `Payment_Note` varchar(21844)
);

CREATE TABLE `Comment` (
  `Comment_ID` integer PRIMARY KEY AUTO_INCREMENT,
  `Comment_content` varchar(21844),
  `Comment_by` integer,
  `Comment_in` integer,
  `User_rate` numeric,
  `Comment_at` datetime
);

CREATE TABLE `TeacherInformation` (
  `Teacher_ID` integer PRIMARY KEY,
  `Teacher_header` varchar(21844),
  `Teacher_description` varchar(21844)
);

ALTER TABLE `CourseEnrollment` ADD FOREIGN KEY (`Payment_ID`) REFERENCES `PaymentHistory` (`Payment_ID`);

ALTER TABLE `Tag` ADD FOREIGN KEY (`Category_ID`) REFERENCES `Category` (`Category_ID`);

ALTER TABLE `Course` ADD FOREIGN KEY (`Course_tag`) REFERENCES `Tag` (`Tag_ID`);

ALTER TABLE `Lesson` ADD FOREIGN KEY (`Course_ID`) REFERENCES `Course` (`Course_ID`);

ALTER TABLE `Course` ADD FOREIGN KEY (`Author_ID`) REFERENCES `User` (`User_ID`);

ALTER TABLE `CourseEnrollment` ADD FOREIGN KEY (`User_ID`) REFERENCES `User` (`User_ID`);

ALTER TABLE `CourseEnrollment` ADD FOREIGN KEY (`Course_ID`) REFERENCES `Course` (`Course_ID`);

ALTER TABLE `Discuss` ADD FOREIGN KEY (`Discuss_by`) REFERENCES `User` (`User_ID`);

ALTER TABLE `Discuss` ADD FOREIGN KEY (`Course_ID`) REFERENCES `Course` (`Course_ID`);

ALTER TABLE `CourseEnrollment` ADD FOREIGN KEY (`Learning_history`) REFERENCES `Lesson` (`Lesson_ID`);

ALTER TABLE `Comment` ADD FOREIGN KEY (`Comment_by`) REFERENCES `User` (`User_ID`);

ALTER TABLE `User` ADD FOREIGN KEY (`User_ID`) REFERENCES `TeacherInformation` (`Teacher_ID`);

ALTER TABLE `Comment` ADD FOREIGN KEY (`Comment_in`) REFERENCES `Course` (`Course_ID`);

ALTER TABLE `Discuss` ADD FOREIGN KEY (`Discuss_ID`) REFERENCES `Discuss` (`Parent_Discuss_ID`);

CREATE UNIQUE INDEX `CourseEnrollment_index_0` ON `CourseEnrollment` (`User_ID`, `Course_ID`);
