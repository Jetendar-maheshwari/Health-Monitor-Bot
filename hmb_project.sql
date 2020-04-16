-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2020 at 01:23 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hmb_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `appointment_id` varchar(20) DEFAULT NULL,
  `patient_id` varchar(20) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `serial_no` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `problem` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `create_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `appointment_id`, `patient_id`, `department_id`, `doctor_id`, `schedule_id`, `serial_no`, `date`, `problem`, `created_by`, `create_date`, `status`) VALUES
(90, 'A1TMHAGJ', 'PASPKYIL', 9, 33, 1, 11, '2020-04-13', '', 2, '2020-04-13', 1),
(91, 'AN6VGH3S', 'PRBL9B4D', 10, 34, 6, 14, '2020-04-15', '', 2, '2020-04-13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cm_patient`
--

CREATE TABLE `cm_patient` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `case_manager_id` int(11) NOT NULL,
  `ref_doctor_id` int(11) DEFAULT NULL,
  `hospital_name` varchar(255) DEFAULT NULL,
  `hospital_address` text DEFAULT NULL,
  `doctor_name` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cm_status`
--

CREATE TABLE `cm_status` (
  `id` int(11) NOT NULL,
  `critical_status` varchar(255) NOT NULL DEFAULT '1',
  `cm_patient_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dprt_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dprt_id`, `name`, `description`, `status`) VALUES
(5, 'Cardiology', 'Deals with the disorders of the heart as well as some parts of the circulatory system', 1),
(6, 'Psychology', 'About feelings and thoughts', 1),
(7, 'Gynaecology ', 'Focus on the female reproductive system', 1),
(8, 'Dentistry', 'Departments of Dental and Oral Medicine', 1),
(9, 'Neurology', 'focusses on the development of vascular risk factors leading to stroke and functional recovery', 1),
(10, 'Dermatologist', 'Skin and venereal diseases', 1);

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `hidden_attach_file` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `upload_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`id`, `patient_id`, `doctor_id`, `description`, `hidden_attach_file`, `date`, `upload_by`) VALUES
(4, 'PASPKYIL', 34, '', './assets/attachments/yaman_yaman_details_3.txt', '2020-04-13', 0),
(5, 'PASPKYIL', 0, '', './assets/attachments/info_prescription.png', '2020-04-13', 2);

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(11) UNSIGNED NOT NULL,
  `phrase` text NOT NULL,
  `english` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `phrase`, `english`) VALUES
(19, 'email', 'Email Address'),
(20, 'password', 'Password'),
(21, 'login', 'Log In'),
(22, 'incorrect_email_password', 'Incorrect Email/Password!'),
(23, 'user_role', 'User Role'),
(24, 'please_login', 'Please Log In'),
(25, 'setting', 'Setting'),
(26, 'profile', 'Profile'),
(27, 'logout', 'Log Out'),
(28, 'please_try_again', 'Please Try Again'),
(29, 'admin', 'Admin'),
(30, 'doctor', 'Doctor'),
(32, 'dashboard', 'Dashboard'),
(33, 'department', 'Department'),
(34, 'add_department', 'Add Department'),
(35, 'department_list', 'Department List'),
(36, 'add_doctor', 'Add Doctor'),
(37, 'doctor_list', 'Doctor List'),
(38, 'add_representative', 'Add Representative'),
(39, 'representative_list', 'Representative List'),
(40, 'patient', 'Patient'),
(41, 'add_patient', 'Add Patient'),
(42, 'patient_list', 'Patient List'),
(43, 'schedule', 'Schedule'),
(44, 'add_schedule', 'Add Schedule'),
(45, 'schedule_list', 'Schedule List'),
(46, 'appointment', 'Appointment'),
(47, 'add_appointment', 'Add Appointment'),
(48, 'appointment_list', 'Appointment List'),
(49, 'enquiry', 'Enquiry'),
(50, 'language_setting', 'Language Setting'),
(51, 'appointment_report', 'Appointment Report'),
(52, 'assign_by_all', 'Assign by All'),
(53, 'assign_by_doctor', 'Assign by Doctor'),
(54, 'assign_to_doctor', 'Assign to Doctor'),
(56, 'report', 'Report'),
(57, 'assign_by_me', 'Assign by Me'),
(58, 'assign_to_me', 'Assign to Me'),
(59, 'website', 'Website'),
(60, 'slider', 'Slider'),
(61, 'section', 'Section'),
(62, 'section_item', 'Section Item'),
(63, 'comments', 'Comment'),
(65, 'total_progress', 'Total Progress'),
(66, 'last_year_status', 'Showing status from the last year'),
(67, 'department_name', 'Department Name'),
(68, 'description', 'Description'),
(69, 'status', 'Status'),
(70, 'active', 'Active'),
(71, 'inactive', 'Inactive'),
(72, 'cancel', 'Cancel'),
(73, 'save', 'Save'),
(75, 'serial', 'SL.NO'),
(76, 'action', 'Action'),
(77, 'edit', 'Edit '),
(78, 'delete', 'Delete'),
(79, 'save_successfully', 'Save Successfully!'),
(80, 'update_successfully', 'Update Successfully!'),
(81, 'department_edit', 'Department Edit'),
(82, 'delete_successfully', 'Delete successfully!'),
(83, 'are_you_sure', 'Are You Sure ? '),
(84, 'first_name', 'First Name'),
(85, 'last_name', 'Last Name'),
(86, 'phone', 'Phone No'),
(87, 'mobile', 'Mobile No'),
(88, 'blood_group', 'Blood Group'),
(89, 'sex', 'Sex'),
(90, 'date_of_birth', 'Date of Birth'),
(91, 'address', 'Address'),
(92, 'invalid_picture', 'Invalid Picture'),
(93, 'doctor_profile', 'Doctor Profile'),
(94, 'edit_profile', 'Edit Profile'),
(95, 'edit_doctor', 'Edit Doctor'),
(98, 'designation', 'Designation'),
(99, 'short_biography', 'Short Biography'),
(100, 'picture', 'Picture'),
(101, 'specialist', 'Specialist'),
(102, 'male', 'Male'),
(103, 'female', 'Female'),
(104, 'education_degree', 'Education/Degree'),
(105, 'create_date', 'Create Date'),
(106, 'view', 'View'),
(107, 'doctor_information', 'Doctor Information'),
(108, 'update_date', 'Update Date'),
(109, 'print', 'Print'),
(112, 'patient_information', 'Patient Information'),
(113, 'other', 'Other'),
(114, 'patient_id', 'Patient ID'),
(115, 'age', 'Age'),
(116, 'patient_edit', 'Patient Edit'),
(117, 'id_no', 'ID No.'),
(118, 'select_option', 'Select Option'),
(119, 'doctor_name', 'Doctor Name'),
(120, 'day', 'Day'),
(121, 'start_time', 'Start Time'),
(122, 'end_time', 'End Time'),
(123, 'per_patient_time', 'Per Patient Time'),
(124, 'serial_visibility_type', 'Serial Visibility'),
(125, 'sequential', 'Sequential'),
(126, 'timestamp', 'Timestamp'),
(127, 'available_days', 'Available Days'),
(128, 'schedule_edit', 'Schedule Edit'),
(129, 'available_time', 'Available Time'),
(130, 'serial_no', 'Serial No'),
(131, 'problem', 'Problem'),
(132, 'appointment_date', 'Appointment Date'),
(133, 'you_are_already_registered', 'You Are Already Registered'),
(134, 'invalid_patient_id', 'Invalid patient ID'),
(135, 'invalid_input', 'Invalid Input'),
(137, 'no_doctor_available', 'No Doctor Available'),
(138, 'invalid_department', 'Invalid Department!'),
(139, 'no_schedule_available', 'No Schedule Available'),
(140, 'please_fillup_all_required_fields', 'Please fillup all required filelds'),
(141, 'appointment_id', 'Appointment ID'),
(142, 'schedule_time', 'Schedule Time'),
(143, 'appointment_information', 'Appointment Information'),
(144, 'full_name', 'Full Name'),
(145, 'read_unread', 'Read / Unread'),
(146, 'date', 'Date'),
(147, 'ip_address', 'IP Address'),
(148, 'user_agent', 'User Agent'),
(149, 'checked_by', 'Checked By'),
(153, 'filter', 'Filter'),
(154, 'start_date', 'Start Date'),
(155, 'end_date', 'End Date'),
(156, 'application_title', 'Application Title'),
(157, 'favicon', 'Favicon'),
(158, 'logo', 'Logo'),
(159, 'footer_text', 'Footer Text'),
(160, 'language', 'Language'),
(161, 'appointment_assign_by_all', 'Appointment Assign by All'),
(162, 'appointment_assign_by_doctor', 'Appointment Assign by Doctor'),
(164, 'appointment_assign_to_all_doctor', 'Appointment Assign to All Doctor'),
(165, 'appointment_assign_to_me', 'Appointment Assign to Me'),
(166, 'appointment_assign_by_me', 'Appointment Assign by Me'),
(167, 'type', 'Type'),
(168, 'website_title', 'Website Title'),
(169, 'invalid_logo', 'Invalid Logo'),
(170, 'details', 'Details'),
(171, 'website_setting', 'Website Setting'),
(172, 'submit_successfully', 'Submit Successfully!'),
(173, 'application_setting', 'Application Setting'),
(174, 'invalid_favicon', 'Invalid Favicon'),
(175, 'new_enquiry', 'New Enquiry'),
(177, 'home', 'Home'),
(178, 'select_department', 'Select Department'),
(179, 'select_doctor', 'Select Doctor'),
(180, 'select_representative', 'Select Representative'),
(181, 'post_id', 'Post ID'),
(182, 'thank_you_for_your_comment', 'Thank you for your comment!'),
(183, 'comment_id', 'Comment ID'),
(184, 'comment_status', 'Comment Status'),
(185, 'comment_added_successfully', 'Comment Added Successfully'),
(186, 'comment_remove_successfully', 'Comment Remove Successfully'),
(187, 'select_item', 'Section Item'),
(188, 'add_item', 'Add Item'),
(189, 'menu_name', 'Menu Name'),
(190, 'title', 'Title'),
(191, 'position', 'Position'),
(192, 'invalid_icon_image', 'Invalid Icon Image!'),
(193, 'about', 'About'),
(194, 'blog', 'Blog'),
(195, 'service', 'Service'),
(196, 'item_edit', 'Item Edit'),
(197, 'registration_successfully', 'Registration Successfully'),
(198, 'add_section', 'Add Section'),
(199, 'section_name', 'Section Name'),
(200, 'invalid_featured_image', 'Invalid Featured Image!'),
(201, 'section_edit', 'Section Edit'),
(202, 'meta_description', 'Meta Description'),
(203, 'twitter_api', 'Twitter Api'),
(204, 'google_map', 'Google Map'),
(205, 'copyright_text', 'Copyright Text'),
(206, 'facebook_url', 'Facebook URL'),
(207, 'twitter_url', 'Twitter URL'),
(208, 'vimeo_url', 'Vimeo URL'),
(209, 'instagram_url', 'Instagram Url'),
(210, 'dribbble_url', 'Dribbble URL'),
(211, 'skype_url', 'Skype URL'),
(212, 'add_slider', 'Add Slider'),
(213, 'subtitle', 'Sub Title'),
(214, 'slide_position', 'Slide Position'),
(215, 'invalid_image', 'Invalid Image'),
(216, 'image_is_required', 'Image is required'),
(217, 'slider_edit', 'Slider Edit'),
(218, 'meta_keyword', 'Meta Keyword'),
(219, 'year', 'Year'),
(220, 'month', 'Month'),
(221, 'recent_post', 'Recent Post'),
(222, 'leave_a_comment', 'Leave a Comment'),
(223, 'submit', 'Submit'),
(224, 'google_plus_url', 'Google Plus URL'),
(225, 'website_status', 'Website Status'),
(226, 'new_slide', 'New Slide'),
(227, 'new_section', 'New Section'),
(228, 'subtitle_description', 'Sub Title / Description'),
(229, 'featured_image', 'Featured Image'),
(230, 'new_item', 'New Item'),
(231, 'item_position', 'Item Position'),
(232, 'icon_image', 'Icon Image'),
(233, 'post_title', 'Post Title'),
(234, 'add_to_website', 'Add to Website'),
(235, 'read_more', 'Read More'),
(236, 'registration', 'Registration'),
(237, 'appointment_form', 'Appointment Form'),
(238, 'contact', 'Contact'),
(239, 'optional', 'Optional'),
(240, 'customer_comments', 'Customer Comments'),
(241, 'need_a_doctor_for_checkup', 'Need a Doctor for Check-up?'),
(242, 'just_make_an_appointment_and_you_are_done', 'JUST MAKE AN APPOINTMENT & YOU\'RE DONE ! '),
(243, 'get_an_appointment', 'Get an appointment'),
(244, 'latest_news', 'Latest News'),
(245, 'latest_tweet', 'Latest Tweet'),
(246, 'menu', 'Menu'),
(247, 'select_user_role', 'Select User Role'),
(248, 'site_align', 'Website Align'),
(249, 'right_to_left', 'Right to Left'),
(250, 'left_to_right', 'Left to Right'),
(251, 'account_manager', 'Account Manager'),
(252, 'add_invoice', 'Add Invoice'),
(253, 'invoice_list', 'Invoice List'),
(254, 'account_list', 'Account List'),
(255, 'add_account', 'Add Account'),
(256, 'account_name', 'Account Name'),
(257, 'credit', 'Credit'),
(258, 'debit', 'Debit'),
(259, 'account_edit', 'Account Edit'),
(260, 'quantity', 'Quantity'),
(261, 'price', 'Price'),
(262, 'total', 'Total'),
(263, 'remove', 'Remove'),
(264, 'add', 'Add'),
(265, 'subtotal', 'Sub Total'),
(266, 'vat', 'Vat'),
(267, 'grand_total', 'Grand Total'),
(268, 'discount', 'Discount'),
(269, 'paid', 'Paid'),
(270, 'due', 'Due'),
(271, 'reset', 'Reset'),
(272, 'add_or_remove', 'Add / Remove'),
(273, 'invoice', 'Invoice'),
(274, 'invoice_information', 'Invoice Information'),
(275, 'invoice_edit', 'Invoice Edit'),
(276, 'update', 'Update'),
(277, 'all', 'All'),
(278, 'patient_wise', 'Patient Wise'),
(283, 'add_payment', 'Add Payment'),
(284, 'payment_edit', 'Payment Edit'),
(285, 'pay_to', 'Pay To'),
(286, 'amount', 'Amount'),
(289, 'charge', 'Charge'),
(295, 'assign_date', 'Assign Date'),
(296, 'discharge_date', 'Discharge Date'),
(298, 'assign_by', 'Assign By'),
(301, 'invlid_input', 'Invalid Input'),
(302, 'allocated', 'Allocated'),
(303, 'free_now', 'Free'),
(304, 'select_only_avaiable_days', 'Select Only Avaiable Days'),
(305, 'human_resources', 'Human Resources'),
(306, 'nurse_list', 'Nurse List'),
(308, 'user_type', 'User Type'),
(312, 'accountant_list', 'Accountant List'),
(313, 'receptionist_list', 'Receptionist List'),
(314, 'pharmacist_list', 'Pharmacist List'),
(315, 'nurse', 'Nurse'),
(316, 'laboratorist', 'Laboratorist'),
(317, 'pharmacist', 'Pharmacist'),
(318, 'accountant', 'Accountant'),
(319, 'receptionist', 'Receptionist'),
(320, 'noticeboard', 'Noticeboard'),
(321, 'notice_list', 'Notice List'),
(322, 'add_notice', 'Add Notice'),
(323, 'hospital_activities', 'Hospital Activities'),
(324, 'death_report', 'Death Report'),
(325, 'add_death_report', 'Add Death Report'),
(330, 'add_operation_report', 'Add Operation Report'),
(331, 'operation_report', 'Operation Report'),
(332, 'investigation_report', 'Investigation Report'),
(333, 'add_investigation_report', 'Add Investigation Report'),
(336, 'category_name', 'Category Name'),
(343, 'messages', 'Messages'),
(344, 'inbox', 'Inbox'),
(345, 'sent', 'Sent'),
(346, 'new_message', 'New Message'),
(347, 'sender', 'Sender Name'),
(349, 'message', 'Message'),
(350, 'subject', 'Subject'),
(351, 'receiver_name', 'Send To'),
(352, 'select_user', 'Select User'),
(353, 'message_sent', 'Messages Sent'),
(354, 'mail', 'Mail'),
(355, 'send_mail', 'Send Mail'),
(356, 'mail_setting', 'Mail Setting'),
(357, 'protocol', 'Protocol'),
(358, 'mailpath', 'Mail Path'),
(359, 'mailtype', 'Mail Type'),
(360, 'validate_email', 'Validate Email Address'),
(361, 'true', 'True'),
(362, 'false', 'False'),
(363, 'attach_file', 'Attach File'),
(364, 'wordwrap', 'Enable Word Wrap'),
(365, 'send', 'Send'),
(366, 'upload_successfully', 'Upload Successfully!'),
(367, 'app_setting', 'App Setting'),
(368, 'case_manager', 'Case Manager'),
(369, 'patient_status', 'Patient Status'),
(370, 'patient_status_edit', 'Edit Patient Status'),
(371, 'add_patient_status', 'Add Patient Status'),
(372, 'add_new_status', 'Add New Status'),
(373, 'case_manager_list', 'Case Manager List'),
(374, 'hospital_address', 'Hospital Address'),
(375, 'ref_doctor_name', 'Ref. Doctor Name'),
(376, 'hospital_name', 'Hospital Name'),
(377, 'patient_name', 'Patient  Name'),
(378, 'document_list', 'Document List'),
(379, 'add_document', 'Add Document'),
(380, 'upload_by', 'Upload By'),
(381, 'documents', 'Documents'),
(382, 'prescription', 'Prescription'),
(383, 'add_prescription', 'Add Prescription'),
(384, 'prescription_list', 'Prescription List'),
(389, 'add_medicine', 'Add Medicine'),
(390, 'medicine_list', 'Medicine List'),
(391, 'add_patient_case_study', 'Add Patient Case Study'),
(392, 'patient_case_study_list', 'Patient Case Study List'),
(395, 'heart_disease', 'Heart Disease'),
(396, 'high_blood_pressure', 'High Blood Pressure'),
(397, 'diabetic', 'Diabetic'),
(398, 'surgery', 'Surgery'),
(399, 'accident', 'Accident'),
(400, 'others', 'Others'),
(401, 'family_medical_history', 'Family Medical History'),
(402, 'current_medication', 'Current Medication'),
(403, 'female_pregnancy', 'Female Pregnancy'),
(404, 'breast_feeding', 'Breast Feeding'),
(405, 'health_insurance', 'Health Insurance'),
(406, 'low_income', 'Low Income'),
(407, 'reference', 'Reference'),
(408, 'status', 'Status'),
(409, 'medicine_name', 'Medicine Name'),
(410, 'instruction', 'Instruction'),
(411, 'medicine_type', 'Medicine Type'),
(412, 'days', 'Days'),
(413, 'weight', 'Weight'),
(414, 'blood_pressure', 'Blood Pressure'),
(415, 'old', 'Old'),
(416, 'new', 'New'),
(417, 'case_study', 'Case Study'),
(418, 'chief_complain', 'Chief Complain'),
(419, 'patient_notes', 'Patient Notes'),
(421, 'diagnosis', 'Diagnosis'),
(422, 'prescription_id', 'Prescription ID'),
(423, 'name', 'Name'),
(424, 'prescription_information', 'Prescription Information'),
(425, 'postal_code', 'Postal Code'),
(426, 'symptoms', 'Symptoms'),
(427, 'add_symptoms', 'Add Symptoms'),
(428, 'symptoms_list', 'Symptoms List'),
(429, 'question', 'Question'),
(430, 'questions', 'Questions'),
(431, 'add_question', 'Add Question'),
(432, 'question_list', 'Question list'),
(433, 'select_question', 'Select Question'),
(434, 'ques_detail', 'Question Detail'),
(435, 'appointment', 'Appointment'),
(436, 'fill_survey', 'Fill Survey'),
(437, 'survey_history', 'Check Survey History'),
(438, 'survey_response_list', 'Survey Response List');

-- --------------------------------------------------------

--
-- Table structure for table `mail_setting`
--

CREATE TABLE `mail_setting` (
  `id` int(11) NOT NULL,
  `protocol` varchar(20) NOT NULL,
  `mailpath` varchar(255) NOT NULL,
  `mailtype` varchar(20) NOT NULL,
  `validate_email` varchar(20) NOT NULL,
  `wordwrap` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mail_setting`
--

INSERT INTO `mail_setting` (`id`, `protocol`, `mailpath`, `mailtype`, `validate_email`, `wordwrap`) VALUES
(5, 'sendmail', '/usr/sbin/sendmail', 'html', 'false', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL,
  `sender_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=unseen, 1=seen, 2=delete',
  `receiver_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=unseen, 1=seen, 2=delete'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opttion`
--

CREATE TABLE `opttion` (
  `opt_id` int(11) NOT NULL,
  `ques_id` int(11) NOT NULL,
  `opt_descr` varchar(255) NOT NULL,
  `opt_score` int(11) NOT NULL,
  `opt_order` int(11) NOT NULL,
  `opt_detail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `opttion`
--

INSERT INTO `opttion` (`opt_id`, `ques_id`, `opt_descr`, `opt_score`, `opt_order`, `opt_detail`) VALUES
(203, 58, 'Not at all', 0, 0, ''),
(204, 58, 'Less than 1 time in 5', 1, 0, ''),
(205, 58, 'Less than half the time', 2, 0, ''),
(206, 58, 'About half the time', 3, 0, ''),
(207, 58, 'More than half the time', 4, 0, ''),
(208, 58, 'Almost always', 5, 0, ''),
(209, 59, 'Not at all', 0, 0, ''),
(210, 59, 'Less than 1 time in 5', 1, 0, ''),
(211, 59, 'Less than half the time', 2, 0, ''),
(212, 59, 'About half the time', 3, 0, ''),
(213, 59, 'More than half the time', 4, 0, ''),
(214, 59, 'Almost always', 5, 0, ''),
(215, 60, 'Not at all', 0, 0, ''),
(216, 60, 'Less than 1 time in 5', 1, 0, ''),
(217, 60, 'Less than half the time', 2, 0, ''),
(218, 60, 'About half the time', 3, 0, ''),
(219, 60, 'More than half the time', 4, 0, ''),
(220, 60, 'Almost always', 5, 0, ''),
(221, 61, 'Not at all', 0, 0, ''),
(222, 61, 'Less than 1 time in 5', 1, 0, ''),
(223, 61, 'Less than half the time', 2, 0, ''),
(224, 61, 'About half the time', 3, 0, ''),
(225, 61, 'More than half the time', 4, 0, ''),
(226, 61, 'Almost always', 5, 0, ''),
(227, 62, 'Not at all', 0, 0, ''),
(228, 62, 'Less than 1 time in 5', 1, 0, ''),
(229, 62, 'Less than half the time', 2, 0, ''),
(230, 62, 'About half the time', 3, 0, ''),
(231, 62, 'More than half the time', 4, 0, ''),
(232, 62, 'Almost always', 5, 0, ''),
(233, 63, 'Not at all', 0, 0, ''),
(234, 63, 'Less than 1 time in 5', 1, 0, ''),
(235, 63, 'Less than half the time', 2, 0, ''),
(236, 63, 'About half the time', 3, 0, ''),
(237, 63, 'More than half the time', 4, 0, ''),
(238, 63, 'Almost always', 5, 0, ''),
(239, 64, 'None', 0, 0, ''),
(240, 64, '1 time', 1, 0, ''),
(241, 64, '2 time', 2, 0, ''),
(242, 64, '3 times', 3, 0, ''),
(243, 64, '4 times ', 4, 0, ''),
(244, 64, '5 or more times', 5, 0, ''),
(245, 65, 'Not at all', 0, 0, ''),
(246, 65, 'Several days', 1, 0, ''),
(247, 65, 'More than half the days', 2, 0, ''),
(248, 65, 'Nearly every day', 3, 0, ''),
(249, 66, 'Not at all', 0, 0, ''),
(250, 66, 'Several days', 1, 0, ''),
(251, 66, 'More than half the days', 2, 0, ''),
(252, 66, 'Nearly every day', 3, 0, ''),
(253, 67, 'Not at all', 0, 0, ''),
(254, 67, 'Several days', 1, 0, ''),
(255, 67, 'More than half the days', 2, 0, ''),
(256, 67, 'Nearly every day', 3, 0, ''),
(257, 68, 'Not at all', 0, 0, ''),
(258, 68, 'Several days', 1, 0, ''),
(259, 68, 'More than half the days', 2, 0, ''),
(260, 68, 'Nearly every day', 3, 0, ''),
(261, 69, 'Not at all', 0, 0, ''),
(262, 69, 'Several days', 1, 0, ''),
(263, 69, 'More than half the days', 2, 0, ''),
(264, 69, 'Nearly every day', 3, 0, ''),
(269, 71, 'Not at all', 0, 0, ''),
(270, 71, 'Several days', 1, 0, ''),
(271, 71, 'More than half the days', 2, 0, ''),
(272, 71, 'Nearly every day', 3, 0, ''),
(273, 72, 'Not at all', 0, 0, ''),
(274, 72, 'Several days', 1, 0, ''),
(275, 72, 'More than half the days', 2, 0, ''),
(276, 72, 'Nearly every day', 3, 0, ''),
(277, 73, 'Not at all', 0, 0, ''),
(278, 73, 'Several days', 1, 0, ''),
(279, 73, 'More than half the days', 2, 0, ''),
(280, 73, 'Nearly every day', 3, 0, ''),
(281, 74, 'Not at all', 0, 0, ''),
(282, 74, 'Several days', 1, 0, ''),
(283, 74, 'More than half the days', 2, 0, ''),
(284, 74, 'Nearly every day', 3, 0, ''),
(285, 75, 'Not at all', 0, 0, ''),
(286, 75, 'Several days', 1, 0, ''),
(287, 75, 'More than half the days', 2, 0, ''),
(288, 75, 'Nearly every days', 3, 0, ''),
(289, 76, 'Not at all', 0, 0, ''),
(290, 76, 'Several days', 1, 0, ''),
(291, 76, 'More than half the days', 2, 0, ''),
(292, 76, 'Nearly every days', 3, 0, ''),
(293, 77, 'Not at all', 0, 0, ''),
(294, 77, 'Several days', 1, 0, ''),
(295, 77, 'More than half the days', 2, 0, ''),
(296, 77, 'Nearly every days', 3, 0, ''),
(297, 78, 'Not at all', 0, 0, ''),
(298, 78, 'Several days', 1, 0, ''),
(299, 78, 'More than half the days', 2, 0, ''),
(300, 78, 'Nearly every days', 3, 0, ''),
(301, 79, 'Not at all', 0, 0, ''),
(302, 79, 'Several days', 1, 0, ''),
(303, 79, 'More than half the days', 2, 0, ''),
(304, 79, 'Nearly every days', 3, 0, ''),
(305, 80, 'Not at all', 0, 0, ''),
(306, 80, 'Several days', 1, 0, ''),
(307, 80, 'More than half the days', 2, 0, ''),
(308, 80, 'Nearly every days', 3, 0, ''),
(309, 81, 'Not at all', 0, 0, ''),
(310, 81, 'Several days', 1, 0, ''),
(311, 81, 'More than half the days', 2, 0, ''),
(312, 81, 'Nearly every days', 3, 0, ''),
(313, 82, 'No chance of dozing', 0, 0, ''),
(314, 82, 'Slight chance of dozing', 1, 0, ''),
(315, 82, 'Moderate chance of dozing', 2, 0, ''),
(316, 82, 'High chance of dozing', 3, 0, ''),
(317, 83, 'No chance of dozing', 0, 0, ''),
(318, 83, 'Slight chance of dozing', 1, 0, ''),
(319, 83, 'Moderate chance of dozing', 2, 0, ''),
(320, 83, 'High chance of dozing', 3, 0, ''),
(321, 84, 'No chance of dozing', 0, 0, ''),
(322, 84, 'Slight chance of dozing', 1, 0, ''),
(323, 84, 'Moderate chance of dozing', 2, 0, ''),
(324, 84, 'High chance of dozing', 3, 0, ''),
(325, 85, 'No chance of dozing', 0, 0, ''),
(326, 85, 'Slight chance of dozing', 1, 0, ''),
(327, 85, 'Moderate chance of dozing', 2, 0, ''),
(328, 85, 'High chance of dozing', 3, 0, ''),
(329, 86, 'No chance of dozing', 0, 0, ''),
(330, 86, 'Slight chance of dozing', 1, 0, ''),
(331, 86, 'Moderate chance of dozing', 2, 0, ''),
(332, 86, 'High chance of dozing', 3, 0, ''),
(333, 87, 'No chance of dozing', 0, 0, ''),
(334, 87, 'Slight chance of dozing', 1, 0, ''),
(335, 87, 'Moderate chance of dozing', 2, 0, ''),
(336, 87, 'High chance of dozing', 3, 0, ''),
(337, 88, 'No chance of dozing', 0, 0, ''),
(338, 88, 'Slight chance of dozing', 1, 0, ''),
(339, 88, 'Moderate chance of dozing', 2, 0, ''),
(340, 88, 'High chance of dozing', 3, 0, ''),
(341, 89, 'No chance of dozing', 0, 0, ''),
(342, 89, 'Slight chance of dozing', 1, 0, ''),
(343, 89, 'Moderate chance of dozing', 2, 0, ''),
(344, 89, 'High chance of dozing', 3, 0, ''),
(345, 90, 'None', 0, 0, ''),
(346, 90, 'Very mild', 1, 0, ''),
(347, 90, 'Mild', 2, 0, ''),
(348, 90, 'Moderate', 3, 0, ''),
(349, 90, 'Severe', 4, 0, ''),
(350, 91, 'No trouble at all', 0, 0, ''),
(351, 91, 'Very little trouble', 1, 0, ''),
(352, 91, 'Moderate trouble', 2, 0, ''),
(353, 91, 'Extreme difficulty', 3, 0, ''),
(354, 91, 'Impossible to do', 4, 0, ''),
(355, 92, 'No trouble at all', 0, 0, ''),
(356, 92, 'Very little trouble', 1, 0, ''),
(357, 92, 'Moderate trouble', 2, 0, ''),
(358, 92, 'Extreme difficulty', 3, 0, ''),
(359, 92, 'Impossible to do', 4, 0, ''),
(360, 93, 'No pain > 60 min', 0, 0, ''),
(361, 93, '16 - 60 minutes', 1, 0, ''),
(362, 93, '5 - 15 minutes', 2, 0, ''),
(363, 93, 'Around the house only', 3, 0, ''),
(364, 93, 'Not at all - severe on walking', 4, 0, ''),
(365, 94, 'Not at all painful', 0, 0, ''),
(366, 94, 'Slightly painful', 1, 0, ''),
(367, 94, 'Moderately pain', 2, 0, ''),
(368, 94, 'Very painful', 3, 0, ''),
(369, 94, 'Unbearable', 4, 0, ''),
(370, 95, 'Rarely / never', 0, 0, ''),
(371, 95, 'Sometimes or just at first', 1, 0, ''),
(372, 95, 'Often, not just at first', 2, 0, ''),
(373, 95, 'Most of the time', 3, 0, ''),
(374, 95, 'All of the time', 4, 0, ''),
(375, 96, 'Yes, easily', 0, 0, ''),
(376, 96, 'With little difficulty', 1, 0, ''),
(377, 96, 'With moderate difficulty', 2, 0, ''),
(378, 96, 'With extreme difficulty', 3, 0, ''),
(379, 96, 'No, impossible', 4, 0, ''),
(380, 97, 'Not at all', 0, 0, ''),
(381, 97, 'Only one or two nights', 1, 0, ''),
(382, 97, 'Some nights', 2, 0, ''),
(383, 97, 'Most nights', 3, 0, ''),
(384, 97, 'Every night', 4, 0, ''),
(385, 98, 'Not at all', 0, 0, ''),
(386, 98, 'A little bit', 1, 0, ''),
(387, 98, 'Moderately', 2, 0, ''),
(388, 98, 'Greatly', 3, 0, ''),
(389, 98, 'Totally', 4, 0, ''),
(390, 99, 'Rarely / never', 0, 0, ''),
(391, 99, 'Sometimes or just at first', 1, 0, ''),
(392, 99, 'Often, not just at first', 2, 0, ''),
(393, 99, 'Most of the time', 3, 0, ''),
(394, 99, 'All of the time', 4, 0, ''),
(395, 100, 'Yes, easily', 0, 0, ''),
(396, 100, 'With little difficulty', 1, 0, ''),
(397, 100, 'With moderate difficulty', 2, 0, ''),
(398, 100, 'With extreme difficulty', 3, 0, ''),
(399, 100, 'No, impossible`', 4, 0, ''),
(400, 101, 'Yes, easily', 0, 0, ''),
(401, 101, 'With little difficulty', 1, 0, ''),
(402, 101, 'With moderate difficulty', 2, 0, ''),
(403, 101, 'With extreme difficulty', 3, 0, ''),
(404, 101, 'No, impossible', 4, 0, ''),
(405, 102, 'As much as I always could', 0, 0, ''),
(406, 102, 'Not quite so much now ', 1, 0, ''),
(407, 102, 'Definitely not so much now', 2, 0, ''),
(408, 102, 'Not at all', 3, 0, ''),
(409, 103, 'As much as I ever did ', 0, 0, ''),
(410, 103, 'Rather less than I used to ', 1, 0, ''),
(411, 103, 'Definitely less than I used to ', 2, 0, ''),
(412, 103, 'Hardly at all', 3, 0, ''),
(413, 104, 'No, not at all ', 0, 0, ''),
(414, 104, 'Hardly ever ', 1, 0, ''),
(415, 104, 'Yes, sometimes ', 2, 0, ''),
(416, 104, 'Yes, very often', 3, 0, ''),
(417, 105, 'No, never', 0, 0, ''),
(418, 105, 'Not very often ', 1, 0, ''),
(419, 105, 'Yes, some of the time ', 2, 0, ''),
(420, 105, 'Yes, most of the time ', 3, 0, ''),
(421, 106, 'No, not at all ', 0, 0, ''),
(422, 106, 'No, not much ', 1, 0, ''),
(423, 106, 'Yes, sometimes', 2, 0, ''),
(424, 106, 'Yes, quite a lot ', 3, 0, ''),
(425, 107, 'No, I have been coping as well as ever', 0, 0, ''),
(426, 107, 'No, most of the time I have coped quite well ', 1, 0, ''),
(427, 107, 'Yes, sometimes I haven?t been coping as well as usual ', 2, 0, ''),
(428, 107, 'Yes, most of the time I haven?t been able to cope ', 3, 0, ''),
(429, 108, 'No, not at all', 0, 0, ''),
(430, 108, 'Not very often ', 1, 0, ''),
(431, 108, 'Yes, sometimes ', 2, 0, ''),
(432, 108, 'Yes, most of the time ', 3, 0, ''),
(433, 109, 'No, not at all', 0, 0, ''),
(434, 109, 'Not very often ', 1, 0, ''),
(435, 109, 'Yes, quite often ', 2, 0, ''),
(436, 109, 'Yes, most of the time ', 3, 0, ''),
(437, 110, 'No, never', 0, 0, ''),
(438, 110, 'Only occasionally', 1, 0, ''),
(439, 110, 'Yes, quite often ', 2, 0, ''),
(440, 110, 'Yes, most of the time ', 3, 0, ''),
(441, 111, 'Never', 0, 0, ''),
(442, 111, 'Hardly ever ', 1, 0, ''),
(443, 111, 'Sometimes ', 2, 0, ''),
(444, 111, 'Yes, quite often ', 3, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(20) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `postal_code` varchar(10) NOT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `blood_group` varchar(10) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `affliate` varchar(50) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `patient_id`, `firstname`, `lastname`, `email`, `password`, `phone`, `mobile`, `address`, `postal_code`, `sex`, `blood_group`, `date_of_birth`, `affliate`, `picture`, `created_by`, `create_date`, `status`) VALUES
(51, 'PASPKYIL', 'Syed', 'Yaman', 'yaman@thinkbots.tech', '22de19a68bdf46de3527c25391350168', '01782148995', '015776798658', 'Reichenhainer Str. 37/ 094', '09126', 'Male', 'O+', '1996-04-13', NULL, 'assets/images/patient/2020-04-13/y.jpg', 51, '2020-04-13', 1),
(52, 'PRBL9B4D', 'Taymoor', 'Ahmad', 'taymoor@thinkbots.tech', 'e75fcabeb5cf11fac5faabbceace0f3f', '01782148995', '01781326208', 'Bahnostrasse 72, Chemnitz', '09120', 'Male', 'O+', '1991-01-10', NULL, 'assets/images/patient/2020-04-13/T.jpg', 52, '2020-04-13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `patient_survey`
--

CREATE TABLE `patient_survey` (
  `survey_id` int(11) NOT NULL,
  `sym_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `range_id` int(11) NOT NULL,
  `filled_date` date NOT NULL,
  `total_score` int(11) NOT NULL,
  `condition_status` bit(64) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `remarks` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_survey`
--

INSERT INTO `patient_survey` (`survey_id`, `sym_id`, `patient_id`, `range_id`, `filled_date`, `total_score`, `condition_status`, `appointment_id`, `remarks`) VALUES
(8, 35, 51, 78, '2020-04-09', 15, b'0000000000000000000000000000000000000000000000000000000000000000', 0, 'Probable depression'),
(11, 31, 52, 60, '2020-04-14', 12, b'0000000000000000000000000000000000000000000000000000000000000000', 0, ' Moderate: Use clinical judgment (symptom duration, functional impairment) to determine necessity of treatment'),
(12, 33, 52, 69, '2020-04-10', 13, b'0000000000000000000000000000000000000000000000000000000000000000', 0, 'You may be excessively sleepy depending on the situation. You may want to consider seeking medical attention.'),
(13, 34, 51, 72, '2020-04-12', 27, b'0000000000000000000000000000000000000000000000000000000000000000', 0, 'May indicate moderate to severe knee arthritis. See your family\r\nphysician for an assessment and x-ray. Consider a consult with an\r\nOrthopaedic Surgeon.');

-- --------------------------------------------------------

--
-- Table structure for table `patient_survey_child`
--

CREATE TABLE `patient_survey_child` (
  `psc_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `ques_id` int(11) NOT NULL,
  `opt_id` int(11) NOT NULL,
  `sore` int(11) NOT NULL,
  `detail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_survey_child`
--

INSERT INTO `patient_survey_child` (`psc_id`, `survey_id`, `ques_id`, `opt_id`, `sore`, `detail`) VALUES
(16, 8, 102, 407, 0, ''),
(17, 8, 103, 410, 0, ''),
(18, 8, 104, 414, 0, ''),
(19, 8, 105, 418, 0, ''),
(20, 8, 106, 423, 0, ''),
(21, 8, 107, 427, 0, ''),
(22, 8, 108, 431, 0, ''),
(23, 8, 109, 434, 0, ''),
(24, 8, 110, 438, 0, ''),
(25, 8, 111, 443, 0, ''),
(44, 11, 65, 246, 0, ''),
(45, 11, 66, 250, 0, ''),
(46, 11, 67, 255, 0, ''),
(47, 11, 68, 258, 0, ''),
(48, 11, 69, 263, 0, ''),
(49, 11, 71, 270, 0, ''),
(50, 11, 72, 275, 0, ''),
(51, 11, 73, 278, 0, ''),
(52, 11, 74, 282, 0, ''),
(53, 12, 82, 315, 0, ''),
(54, 12, 83, 318, 0, ''),
(55, 12, 84, 323, 0, ''),
(56, 12, 85, 327, 0, ''),
(57, 12, 86, 331, 0, ''),
(58, 12, 87, 335, 0, ''),
(59, 12, 88, 338, 0, ''),
(60, 12, 89, 342, 0, ''),
(61, 13, 90, 348, 0, ''),
(62, 13, 91, 352, 0, ''),
(63, 13, 92, 357, 0, ''),
(64, 13, 93, 363, 0, ''),
(65, 13, 94, 366, 0, ''),
(66, 13, 95, 373, 0, ''),
(67, 13, 96, 377, 0, ''),
(68, 13, 97, 383, 0, ''),
(69, 13, 98, 387, 0, ''),
(70, 13, 99, 392, 0, ''),
(71, 13, 100, 397, 0, ''),
(72, 13, 101, 402, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `pr_insurance`
--

CREATE TABLE `pr_insurance` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pr_prescription`
--

CREATE TABLE `pr_prescription` (
  `id` int(11) UNSIGNED NOT NULL,
  `appointment_id` varchar(30) DEFAULT NULL,
  `patient_id` varchar(30) NOT NULL,
  `patient_type` varchar(50) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `chief_complain` text DEFAULT NULL,
  `insurance_id` int(11) DEFAULT NULL,
  `weight` varchar(50) DEFAULT NULL,
  `blood_pressure` varchar(255) DEFAULT NULL,
  `medicine` text DEFAULT NULL,
  `diagnosis` text DEFAULT NULL,
  `patient_notes` text DEFAULT NULL,
  `reference_by` varchar(50) DEFAULT NULL,
  `reference_to` varchar(50) DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `ques_id` int(11) NOT NULL,
  `sym_id` int(11) NOT NULL,
  `ques_detail` varchar(255) NOT NULL,
  `ques_status` int(11) NOT NULL,
  `remarks` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`ques_id`, `sym_id`, `ques_detail`, `ques_status`, `remarks`) VALUES
(58, 30, 'Over the past month, how often have you had a sensation of not emptying your bladder completely after you finished urinating?', 0, ''),
(59, 30, 'Over the past month, how often have you had to urinate again less than 2 hours after you finished urinating?', 0, ''),
(60, 30, 'Over the past month, how often have you found you stopped and started again several times when you urinated?', 0, ''),
(61, 30, 'Over the past month, how often have you found it difficult to postpone urination?', 0, ''),
(62, 30, 'Over the past month, how often have you had a weak urinary stream?', 0, ''),
(63, 30, 'Over the past month, how often have you had to push or strain to begin urination?', 0, ''),
(64, 30, 'Over the past month, how many times did you most typically get up to urinate from the time you went to bed at night until the time you got up in the morning?', 0, ''),
(65, 31, 'Little interest or pleasure in doing things?', 0, ''),
(66, 31, 'Feeling down, depressed, or hopeless?', 0, ''),
(67, 31, 'Trouble falling or staying asleep, or sleeping too much?', 0, ''),
(68, 31, 'Feeling tired or having little energy?', 0, ''),
(69, 31, 'Poor appetite or overeating?', 0, ''),
(71, 31, 'Feeling bad about yourself - or that you are a failure or have let yourself or your family down?', 0, ''),
(72, 31, 'Trouble concentrating on things, such as reading the newspaper or watching television?', 0, ''),
(73, 31, 'Moving or speaking so slowly that other people could have noticed?\r\nOr the opposite - being so fidgety or restless that you have been moving around a lot more than usual?', 0, ''),
(74, 31, 'Thoughts that you would be better off dead, or of hurting yourself in some way?', 0, ''),
(75, 32, 'Feeling nervous, anxious or on edge', 0, ''),
(76, 32, 'Not being able to stop or control worrying', 0, ''),
(77, 32, 'Worrying too much about different things', 0, ''),
(78, 32, 'Trouble relaxing', 0, ''),
(79, 32, 'Being so restless that it is hard to sit still', 0, ''),
(80, 32, 'Becoming easily annoyed or irritable', 0, ''),
(81, 32, 'Feeling afraid as if something awful might happen', 0, ''),
(82, 33, 'Sitting and reading', 0, ''),
(83, 33, 'Watching TV', 0, ''),
(84, 33, 'Sitting inactive in a public place (e.g., a theater or a meeting)', 0, ''),
(85, 33, 'As a passenger in a car for an hour without a break', 0, ''),
(86, 33, 'Lying down to rest in the afternoon when circumstances permit', 0, ''),
(87, 33, 'Sitting and talking to someone', 0, ''),
(88, 33, 'Sitting quietly after a lunch without alcohol', 0, ''),
(89, 33, 'In a car, while stopped for a few minutes in traffic', 0, ''),
(90, 34, 'How would you describe the pain you usually have in your knee?', 0, ''),
(91, 34, 'Have you had any trouble washing and drying yourself (all over) because of your knee?', 0, ''),
(92, 34, 'Have you had any trouble getting in and out of the car or using public transport because of your knee? (With or without a stick)', 0, ''),
(93, 34, 'For how long are you able to walk before the pain in your knee becomes s eve re? (With or without a stick)', 0, ''),
(94, 34, 'After a meal (sat at a table), how painful has it been for you to stand up from a chair because of your knee?', 0, ''),
(95, 34, 'Have you been limping when walking, because of your knee?', 0, ''),
(96, 34, 'Could you kneel down and get up again afterwards?', 0, ''),
(97, 34, 'Are you troubled by pain in your knee at night in bed?', 0, ''),
(98, 34, 'How much has pain from your knee interfered with your usual work? (including housework)', 0, ''),
(99, 34, 'Have you felt that your knee might suddenly give away or let you down?', 0, ''),
(100, 34, 'Could you do household shopping on your own?', 0, ''),
(101, 34, 'Could you walk down a flight of stairs?', 0, ''),
(102, 35, 'I have been able to laugh and see the funny side of things', 0, ''),
(103, 35, 'I have looked forward with enjoyment to things', 0, ''),
(104, 35, 'I have been anxious or worried for no good reason', 0, ''),
(105, 35, 'I have blamed myself unnecessarily when things went wrong', 0, ''),
(106, 35, 'I have felt scared or panicky for no very good reason', 0, ''),
(107, 35, 'Things have been getting on top of me', 0, ''),
(108, 35, 'I have been so unhappy that I have had difficulty sleeping', 0, ''),
(109, 35, 'I have felt sad or miserable', 0, ''),
(110, 35, 'I have been so unhappy that I have been crying', 0, ''),
(111, 35, 'The thought of harming myself has occurred to me ', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `available_days` varchar(50) DEFAULT NULL,
  `per_patient_time` time DEFAULT NULL,
  `serial_visibility_type` tinyint(4) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `doctor_id`, `start_time`, `end_time`, `available_days`, `per_patient_time`, `serial_visibility_type`, `status`) VALUES
(1, 33, '09:00:00', '12:00:00', 'Monday', '00:15:00', 1, 1),
(2, 33, '09:00:00', '12:00:00', 'Tuesday', '00:15:00', 1, 1),
(3, 33, '09:00:00', '11:00:00', 'Wednesday', '00:15:00', 1, 1),
(4, 33, '09:00:00', '11:00:00', 'Friday', '00:15:00', 1, 1),
(5, 34, '10:00:00', '13:00:00', 'Tuesday', '00:10:00', 1, 1),
(6, 34, '12:00:00', '17:00:00', 'Wednesday', '00:10:00', 1, 1),
(7, 34, '12:00:00', '17:00:00', 'Thursday', '00:15:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `setting_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `favicon` varchar(100) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `site_align` varchar(50) DEFAULT NULL,
  `footer_text` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`setting_id`, `title`, `description`, `email`, `phone`, `logo`, `favicon`, `language`, `site_align`, `footer_text`) VALUES
(2, 'ThnikBots', 'Technische Universitat Chemnitz Strasse der Nationen 62', 'info@thinkbots.tech', '015776798658', 'assets/images/apps/2020-04-13/t.jpg', '', 'english', 'LTR', '? 2020 Thinkbots');

-- --------------------------------------------------------

--
-- Table structure for table `symptoms`
--

CREATE TABLE `symptoms` (
  `sym_id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `status` varchar(256) NOT NULL,
  `description` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `symptoms`
--

INSERT INTO `symptoms` (`sym_id`, `name`, `status`, `description`) VALUES
(30, 'Male Urinary Tract Review and IPSS', '1', 'Male Urinary Tract Review and IPSS'),
(31, 'Patient Health Questionnaire (PHQ-9) (Depression)', '1', 'Over the last two weeks, how often have you been bothered by any of the following problems?'),
(32, 'Generalized Anxiety Disorder 7-item (GAD-7)', '1', 'Over the last 2 weeks, how often have you been bothered by the following problems?'),
(33, 'The Epworth Sleepiness Scale', '1', 'The Epworth Sleepiness Scale'),
(34, 'Oxford Knee Score', '1', 'Oxford Knee Score'),
(35, 'Edinburgh Perinatal/Postnatal Depression Scale (EPDS)', '1', 'As you are having a baby, we would like to know how you are feeling. Please mark ?X? in the box next to the answer which comes closest to how you have felt in the past 7 days?not just how you feel today. ');

-- --------------------------------------------------------

--
-- Table structure for table `sym_ranges`
--

CREATE TABLE `sym_ranges` (
  `range_id` int(11) NOT NULL,
  `symptoms_id` int(11) NOT NULL,
  `range_from` int(11) NOT NULL,
  `range_to` int(11) NOT NULL,
  `range_datail` varchar(255) NOT NULL,
  `remarks` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sym_ranges`
--

INSERT INTO `sym_ranges` (`range_id`, `symptoms_id`, `range_from`, `range_to`, `range_datail`, `remarks`) VALUES
(55, 30, 0, 7, '', 'Mild symptoms'),
(56, 30, 8, 19, '', 'Moderate Symptoms'),
(57, 30, 20, 35, '', 'Severe symptoms'),
(58, 31, 0, 4, '', 'Minimal or none: Monitor; may not require treatment'),
(59, 31, 5, 9, '', ' Mild: Use clinical judgment (symptom duration, functional impairment) to determine necessity of treatment'),
(60, 31, 10, 14, '', ' Moderate: Use clinical judgment (symptom duration, functional impairment) to determine necessity of treatment'),
(61, 31, 15, 19, '', ' Moderately Severe: Warrants active treatment with psychotherapy, medications, or combination'),
(62, 31, 20, 27, '', ' Severe: Warrants active treatment with psychotherapy, medications, or combination'),
(63, 32, 0, 4, '', 'Minimal Anxiety'),
(64, 32, 5, 9, '', 'Mild Anxiety'),
(65, 32, 10, 14, '', 'Moderate Anxiety'),
(66, 32, 15, 27, '', 'Severe Anxiety'),
(67, 33, 0, 7, '', ' It is unlikely that you are abnormally sleepy.'),
(68, 33, 8, 9, '', ' You have an average amount of daytime sleepiness.'),
(69, 33, 10, 15, '', 'You may be excessively sleepy depending on the situation. You may want to consider seeking medical attention.'),
(70, 33, 16, 24, '', 'You are excessively sleepy and should consider seeking medical attention.'),
(71, 34, 0, 19, '', 'May indicate severe knee arthritis. It is highly likely that you may\r\nwell require some form of surgical intervention, contact your\r\nfamily physician for a consult with an Orthopaedic Surgeon.'),
(72, 34, 20, 29, '', 'May indicate moderate to severe knee arthritis. See your family\r\nphysician for an assessment and x-ray. Consider a consult with an\r\nOrthopaedic Surgeon.'),
(73, 34, 30, 39, '', 'May indicate mild to moderate knee arthritis. Consider seeing\r\nyour family physician for an assessment and possible x-ray. You\r\nmay benefit from non-surgical treatment, such as exercise,\r\nweight loss, and /or anti-inflammatory medication'),
(74, 34, 40, 48, '', 'May indicate satisfactory joint function. May not require any\r\nformal treatment.'),
(75, 35, 0, 8, '', 'Depression not likely'),
(76, 35, 9, 11, '', 'Depression possible'),
(77, 35, 12, 13, '', 'Fairly high possibility of depression '),
(78, 35, 14, 30, '', 'Probable depression');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `user_role` tinyint(1) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `short_biography` text DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `specialist` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `blood_group` varchar(10) DEFAULT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `user_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `firstname`, `lastname`, `email`, `password`, `user_role`, `designation`, `department_id`, `address`, `phone`, `mobile`, `short_biography`, `picture`, `specialist`, `date_of_birth`, `sex`, `blood_group`, `degree`, `created_by`, `create_date`, `update_date`, `status`, `user_status`) VALUES
(2, 'Jetendar', 'Maheshwari', 'info@thinkbots.tech', '0e7517141fb53f21ee439b355b5a1d0a', 1, NULL, NULL, 'Reichenhainer strasse 37 Chemnitz', NULL, '01782148995', NULL, 'assets/images/doctor/2020-04-13/J.jpg', NULL, '1970-01-01', 'Male', NULL, NULL, 2, '2020-04-16', NULL, 1, 'Active'),
(33, 'Israt', 'Mahmud', 'israt@thinkbots.tech', 'c5ac4c9809bf48def19be72a72e96515', 2, 'Senior Consultant ', 9, 'Reichenhainer Strasse', '', '01717653969', '', 'assets/images/doctor/2020-04-13/i.jpg', 'Neurologist', '1991-02-13', 'Male', 'B+', '', 2, '2020-04-13', NULL, 1, ''),
(34, 'Soukaina', 'Hendy', 'soukaina@thinkbots.tech', '6a88d834bef8fada9a584a6338d2a293', 2, 'Consultant ', 10, 'Reichenhainer Str. 37', '', '01794111813', '', 'assets/images/doctor/2020-04-13/s.jpg', 'Dermatologist', '2020-04-13', 'Female', 'B+', '', 2, '2020-04-13', NULL, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `ws_comment`
--

CREATE TABLE `ws_comment` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `comment` text NOT NULL,
  `date` datetime NOT NULL,
  `add_to_website` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ws_section`
--

CREATE TABLE `ws_section` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `featured_image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ws_section`
--

INSERT INTO `ws_section` (`id`, `name`, `title`, `description`, `featured_image`) VALUES
(19, 'service', 'Service We Offer', 'Our department & special service ', ''),
(20, 'about', 'About Us', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature froLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,m 45 BC.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.', ''),
(23, 'appointment', 'Why Choose Us', 'Our department & special service ', ''),
(26, 'doctor', 'OUR DOCTOR', 'Our department & special service ', ''),
(27, 'department', 'DEPARTMENT', 'Our department & special service ', ''),
(28, 'blog', 'Latest Blog', 'Latest topics of the webstie', '');

-- --------------------------------------------------------

--
-- Table structure for table `ws_setting`
--

CREATE TABLE `ws_setting` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `favicon` varchar(100) DEFAULT NULL,
  `meta_tag` varchar(255) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `copyright_text` varchar(255) DEFAULT NULL,
  `twitter_api` text DEFAULT NULL,
  `google_map` text DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `vimeo` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `dribbble` varchar(100) DEFAULT NULL,
  `skype` varchar(100) DEFAULT NULL,
  `google_plus` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ws_slider`
--

CREATE TABLE `ws_slider` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `subtitle` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cm_patient`
--
ALTER TABLE `cm_patient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cm_status`
--
ALTER TABLE `cm_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dprt_id`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_setting`
--
ALTER TABLE `mail_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opttion`
--
ALTER TABLE `opttion`
  ADD PRIMARY KEY (`opt_id`),
  ADD KEY `option_id_fk` (`ques_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_survey`
--
ALTER TABLE `patient_survey`
  ADD PRIMARY KEY (`survey_id`),
  ADD KEY `patient_id_fk` (`patient_id`),
  ADD KEY `sym_id_fk` (`sym_id`),
  ADD KEY `range_id_fk` (`range_id`);

--
-- Indexes for table `patient_survey_child`
--
ALTER TABLE `patient_survey_child`
  ADD PRIMARY KEY (`psc_id`),
  ADD KEY `ps_id_fk` (`survey_id`),
  ADD KEY `ques_id_fk` (`ques_id`),
  ADD KEY `op_id_fk` (`opt_id`);

--
-- Indexes for table `pr_prescription`
--
ALTER TABLE `pr_prescription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`ques_id`),
  ADD KEY `sympt_id_fk` (`sym_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `symptoms`
--
ALTER TABLE `symptoms`
  ADD PRIMARY KEY (`sym_id`);

--
-- Indexes for table `sym_ranges`
--
ALTER TABLE `sym_ranges`
  ADD PRIMARY KEY (`range_id`),
  ADD KEY `symptoms_id_fk` (`symptoms_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `ws_comment`
--
ALTER TABLE `ws_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ws_section`
--
ALTER TABLE `ws_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ws_setting`
--
ALTER TABLE `ws_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ws_slider`
--
ALTER TABLE `ws_slider`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `cm_patient`
--
ALTER TABLE `cm_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cm_status`
--
ALTER TABLE `cm_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dprt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=439;

--
-- AUTO_INCREMENT for table `mail_setting`
--
ALTER TABLE `mail_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `opttion`
--
ALTER TABLE `opttion`
  MODIFY `opt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=445;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `patient_survey`
--
ALTER TABLE `patient_survey`
  MODIFY `survey_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `patient_survey_child`
--
ALTER TABLE `patient_survey_child`
  MODIFY `psc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `pr_prescription`
--
ALTER TABLE `pr_prescription`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `ques_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `symptoms`
--
ALTER TABLE `symptoms`
  MODIFY `sym_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `sym_ranges`
--
ALTER TABLE `sym_ranges`
  MODIFY `range_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `ws_comment`
--
ALTER TABLE `ws_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ws_section`
--
ALTER TABLE `ws_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `ws_setting`
--
ALTER TABLE `ws_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ws_slider`
--
ALTER TABLE `ws_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `opttion`
--
ALTER TABLE `opttion`
  ADD CONSTRAINT `option_id_fk` FOREIGN KEY (`ques_id`) REFERENCES `question` (`ques_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `patient_survey`
--
ALTER TABLE `patient_survey`
  ADD CONSTRAINT `patient_id_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `range_id_fk` FOREIGN KEY (`range_id`) REFERENCES `sym_ranges` (`range_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sym_id_fk` FOREIGN KEY (`sym_id`) REFERENCES `symptoms` (`sym_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `patient_survey_child`
--
ALTER TABLE `patient_survey_child`
  ADD CONSTRAINT `op_id_fk` FOREIGN KEY (`opt_id`) REFERENCES `opttion` (`opt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ps_id_fk` FOREIGN KEY (`survey_id`) REFERENCES `patient_survey` (`survey_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ques_id_fk` FOREIGN KEY (`ques_id`) REFERENCES `question` (`ques_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `sympt_id_fk` FOREIGN KEY (`sym_id`) REFERENCES `symptoms` (`sym_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `sym_ranges`
--
ALTER TABLE `sym_ranges`
  ADD CONSTRAINT `symptoms_id_fk` FOREIGN KEY (`symptoms_id`) REFERENCES `symptoms` (`sym_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
