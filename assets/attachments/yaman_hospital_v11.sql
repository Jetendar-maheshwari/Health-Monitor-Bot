-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2020 at 12:37 PM
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
-- Database: `hospital`
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
(90, 'AYWV86E8', 'P52195F9', 4, 33, 1, 3, '2020-04-06', 'Heart Problem', 2, '2020-04-05', 1);

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
(4, 'Cardiology', 'Check only Heart Patient', 1),
(5, 'Psychology', 'Brain function, Observe, interview, and survey individuals', 1),
(6, 'Neurology', 'Neurological diseases can include headaches stroke, movement disorders, such as tremor or Parkinson\'s disease', 1);

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
(1, 'P52195F9', 33, '', './assets/attachments/admin_p52195f9_p1.jpg', '2020-04-05', 2);

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
(163, 'appointment_assign_by_representative', 'Appointment Assign by Representative'),
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
(176, 'information', 'Information'),
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
(285, 'pay_to', 'Pay To'),
(286, 'amount', 'Amount'),
(287, 'bed_type', 'Bed Type'),
(288, 'bed_limit', 'Bed Capacity'),
(289, 'charge', 'Charge'),
(290, 'bed_list', 'Bed List'),
(295, 'assign_date', 'Assign Date'),
(296, 'discharge_date', 'Discharge Date'),
(298, 'assign_by', 'Assign By'),
(299, 'bed_available', 'Bed is Available'),
(300, 'bed_not_available', 'Bed is Not Available'),
(301, 'invlid_input', 'Invalid Input'),
(302, 'allocated', 'Allocated'),
(303, 'free_now', 'Free'),
(304, 'select_only_avaiable_days', 'Select Only Avaiable Days'),
(308, 'user_type', 'User Type'),
(309, 'employee_information', 'Employee Information'),
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
(326, 'death_report_edit', 'Death Report Edit'),
(327, 'birth_report', 'Birth Report'),
(328, 'birth_report_edit', 'Birth Report Edit'),
(329, 'add_birth_report', 'Add Birth Report'),
(330, 'add_operation_report', 'Add Operation Report'),
(331, 'operation_report', 'Operation Report'),
(332, 'investigation_report', 'Investigation Report'),
(333, 'add_investigation_report', 'Add Investigation Report'),
(334, 'add_medicine_category', 'Add Medicine Category'),
(335, 'medicine_category_list', 'Medicine Category List'),
(336, 'category_name', 'Category Name'),
(337, 'medicine_category_edit', 'Medicine Category Edit'),
(338, 'add_medicine', 'Add Medicine '),
(339, 'medicine_list', 'Medicine List'),
(340, 'medicine_edit', 'Medicine Edit'),
(341, 'manufactured_by', 'Manufactured By'),
(342, 'medicine_name', 'Medicine Name'),
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
(385, 'add_insurance', 'Add Insurance'),
(386, 'insurance_list', 'Insurance List'),
(387, 'insurance_name', 'Insurance Name'),
(388, 'medicine_name', 'Medicine Name'),
(389, 'add_medicine', 'Add Medicine'),
(390, 'medicine_list', 'Medicine List'),
(391, 'add_patient_case_study', 'Add Patient Case Study'),
(392, 'patient_case_study_list', 'Patient Case Study List'),
(393, 'food_allergies', 'Food Allergies'),
(394, 'tendency_bleed', 'Tendency Bleed'),
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
(146, 45, 'Not at all', 0, 0, ''),
(147, 45, 'Less than 1 time in 5', 1, 0, ''),
(148, 45, 'Less than half the time', 2, 0, ''),
(149, 45, 'About half the time', 3, 0, ''),
(150, 45, 'More than half the time', 4, 0, ''),
(151, 45, 'Almost always', 5, 0, '');

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
(47, 'P52195F9', 'Syed', 'Yaman', 'jk12cs80@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '', '01782148995', 'Reichenhainer Str. 37/ 091', '09126', 'Male', 'B+', '1994-04-03', NULL, 'assets/images/patient/2020-04-05/y.jpg', 47, '2020-04-05', 1);

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
(4, 26, 47, 36, '2020-04-05', 2, b'0000000000000000000000000000000000000000000000000000000000000001', 0, 'Mild symptoms'),
(5, 26, 47, 36, '2020-04-11', 2, b'0000000000000000000000000000000000000000000000000000000000000000', 0, 'Mild symptoms');

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
(1, 4, 45, 148, 0, ''),
(2, 5, 45, 148, 0, '');

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
(45, 26, 'Over the past month, how often have you had a sensation of not emptying your bladder completely after you finished urinating?', 0, '');

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
(1, 33, '09:00:00', '12:00:00', 'Monday', '00:20:00', 1, 1);

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
(2, 'Whaddon Medical Center', '25 Witham Court Tweed Drive  Bletchley MK3 7QU', 'hospital@gmail.com', '01908 373058', 'assets/images/apps/2017-10-24/7.jpg', 'assets/images/icons/2017-10-24/7.jpg', 'english', 'LTR', '? 2020 Thinkbots');

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
(26, 'Male Urinary Tract Review and IPSS', '1', 'Male Urinary Tract Review and IPSS'),
(27, 'Patient Health Questionnaire (PHQ-9) (Depression)', '1', 'Over the last two weeks, how often have you been bothered by any of the following problems?'),
(28, 'Generalized Anxiety Disorder 7-item (GAD-7)', '1', 'Over the last 2 weeks, how often have you been bothered by the following problems?');

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
  `remarks` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sym_ranges`
--

INSERT INTO `sym_ranges` (`range_id`, `symptoms_id`, `range_from`, `range_to`, `range_datail`, `remarks`) VALUES
(36, 26, 0, 7, '', 'Mild symptoms'),
(37, 26, 8, 19, '', 'Moderate Symptoms'),
(38, 26, 20, 35, '', 'Severe symptoms'),
(39, 27, 0, 4, '', 'None'),
(40, 27, 5, 9, '', 'Mild'),
(41, 27, 10, 14, '', 'Moderate'),
(42, 27, 15, 19, '', 'Moderately Severe'),
(43, 27, 20, 27, '', 'Severe'),
(44, 28, 0, 4, '', 'Minimal Anxiety'),
(45, 28, 5, 9, '', 'Mild Anxiety'),
(46, 28, 10, 14, '', 'Moderate Anxiety'),
(47, 28, 15, 25, '', 'Severe Anxiety');

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
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `firstname`, `lastname`, `email`, `password`, `user_role`, `designation`, `department_id`, `address`, `phone`, `mobile`, `short_biography`, `picture`, `specialist`, `date_of_birth`, `sex`, `blood_group`, `degree`, `created_by`, `create_date`, `update_date`, `status`) VALUES
(2, 'Jetendar', 'Maheshwari', 'admin@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', 1, NULL, NULL, 'Reichenhainer strasse 37 Chemnitz', NULL, '01782148995', NULL, 'assets/images/doctor/2020-04-05/J2.jpg', NULL, '1970-01-01', 'Male', NULL, NULL, 2, '2020-04-05', NULL, 1),
(33, 'Joubert ', 'Roi', 'joubert@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 'Senior Consultant ', 4, 'Reichenhainer Str. 37/ 091', '', '+491782148336', '', 'assets/images/doctor/2020-04-05/T1.jpg', 'Cardiology', '1987-08-08', 'Male', 'A+', '', 2, '2020-04-05', NULL, 1);

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
(19, 'service', 'Service We Offer', 'Our department & special service ', 'assets_web/images/uploads/2016-11-02/b.jpg'),
(20, 'about', 'About Us', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature froLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,m 45 BC.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.', 'assets_web/images/uploads/2016-11-05/a1.jpg'),
(23, 'appointment', 'Why Choose Us', 'Our department & special service ', 'assets_web/images/uploads/2016-11-06/d.png'),
(26, 'doctor', 'OUR DOCTOR', 'Our department & special service ', 'assets_web/images/uploads/2016-11-05/d.png'),
(27, 'department', 'DEPARTMENT', 'Our department & special service ', ''),
(28, 'blog', 'Latest Blog', 'Latest topics of the webstie', 'assets_web/images/uploads/2016-11-05/c.png');

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

--
-- Dumping data for table `ws_setting`
--

INSERT INTO `ws_setting` (`id`, `title`, `description`, `logo`, `favicon`, `meta_tag`, `meta_keyword`, `email`, `phone`, `address`, `copyright_text`, `twitter_api`, `google_map`, `facebook`, `twitter`, `vimeo`, `instagram`, `dribbble`, `skype`, `google_plus`, `status`) VALUES
(3, 'Hospital', 'your text will appear here', 'assets_web/images/icons/2017-04-13/f.png', 'assets_web/images/icons/2017-04-13/f1.png', 'your text appear  here', 'your text appear  here', 'hospital@hospital.com', '9876543210', '456/B, Street, State,345,COUNtry', 'your text appear  here', '<a class=\"twitter-timeline\" data-lang=\"en\" data-dnt=\"true\" data-link-color=\"#207FDD\" href=\"https://twitter.com/taylorswift13\">Tweets by taylorswift13</a> <script async src=\"//platform.twitter.com/widgets.js\" charset=\"utf-8\"></script>', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d29215.021939977993!2d90.40923229999999!3d23.75173875!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sbn!2sbd!4v1477987829881\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'http://facebook.com/', 'http://', 'http://', 'http://', 'http://', 'http://', 'http://', 1);

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
-- Dumping data for table `ws_slider`
--

INSERT INTO `ws_slider` (`id`, `title`, `subtitle`, `description`, `image`, `position`, `status`) VALUES
(1, 'your text will appear here', 'your text will appear here', '<p>Lorem Ipsum is simply dummy text of the printingLorem Ipsum is simply dummy text of the printing Lorem Ipsum is simply dummy text of the printing Lorem Ipsum is simply dummy text of the printing Lorem Ipsum is simply dummy text of the printing Lorem Ipsum is simply dummy text of the printing</p>', 'assets_web/images/slider/2016-11-03/a2.jpg', 3, 1),
(2, 'your text will appear here', 'your text will appear here', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting</p>', 'assets_web/images/slider/2017-01-16/d1.jpg', 1, 1),
(5, 'your text will appear here', 'your text will appear here', '<p><strong>Lorem Ipsum</strong></p>\r\n<hr />\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,</p>\r\n<ul>\r\n<li>Demo Hospital Limited</li>\r\n<li>&lt;script&gt;alert(2)&lt;/script&gt;</li>\r\n</ul>', 'assets_web/images/slider/2016-11-03/s.jpg', 1, 1);

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
  ADD KEY `sym_id_fk` (`sym_id`),
  ADD KEY `range_id_fk` (`range_id`),
  ADD KEY `patient_id_fk` (`patient_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

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
  MODIFY `dprt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `opt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `patient_survey`
--
ALTER TABLE `patient_survey`
  MODIFY `survey_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patient_survey_child`
--
ALTER TABLE `patient_survey_child`
  MODIFY `psc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pr_prescription`
--
ALTER TABLE `pr_prescription`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `ques_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `symptoms`
--
ALTER TABLE `symptoms`
  MODIFY `sym_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `sym_ranges`
--
ALTER TABLE `sym_ranges`
  MODIFY `range_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

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
  ADD CONSTRAINT `sym_id_fk` FOREIGN KEY (`sym_id`) REFERENCES `symptoms` (`sym_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

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
