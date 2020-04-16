<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

    public function __construct()
    {
        parent::__construct();

        $this->load->model(array(
            'dashboard_model',
            'setting_model'
        )); 
    }

    public function index()
    {

        if($this->session->userdata('isLogIn')) 
        $this->redirectTo($this->session->userdata('user_role'));

        $this->form_validation->set_rules('email', display('email'),'required|max_length[50]|valid_email');
        $this->form_validation->set_rules('password', display('password'),'required|max_length[32]|md5');
        $this->form_validation->set_rules('user_role',display('user_role'),'required');
        #-------------------------------#
        $setting = $this->setting_model->read();
        $data['title']   = (!empty($setting->title)?$setting->title:null);
        $data['logo']    = (!empty($setting->logo)?$setting->logo:null); 
        $data['favicon'] = (!empty($setting->favicon)?$setting->favicon:null); 
        $data['footer_text'] = (!empty($setting->footer_text)?$setting->footer_text:null); 

        $data['user'] = (object)$postData = [
            'email'     => $this->input->post('email',true),
            'password'  => md5($this->input->post('password',true)),
            'user_role' => $this->input->post('user_role',true)
        ];

        #-------------------------------#
        if ($this->form_validation->run() === true) {
            //check user data
            $check_user = $this->dashboard_model->check_user($postData);


            if ($postData['user_role'] == 10) {
                $check_user = $this->dashboard_model->check_patient($postData);

            } else {
                $check_user = $this->dashboard_model->check_user($postData); 
            }

            if ($check_user->num_rows() === 1) {


                //retrive setting data and store to session

                //store data in session
                $this->session->set_userdata([
                    'isLogIn'   => true,
                    'user_id' => (($postData['user_role']==10)?$check_user->row()->id:$check_user->row()->user_id),
                    'patient_id' => (($postData['user_role']==10)?$check_user->row()->patient_id:null),
                    'email'     => $check_user->row()->email,
                    'fullname'  => $check_user->row()->firstname.' '.$check_user->row()->lastname,
                    'user_role' => (($postData['user_role']==10)?10:$check_user->row()->user_role),
                    'picture'   => $check_user->row()->picture, 
                    'title'     => (!empty($setting->title)?$setting->title:null),
                    'address'   => (!empty($setting->description)?$setting->description:null),
                    'logo'      => (!empty($setting->logo)?$setting->logo:null),
                    'favicon'      => (!empty($setting->favicon)?$setting->favicon:null),
                    'footer_text' => (!empty($setting->footer_text)?$setting->footer_text:null),
                ]);

                //redirect to dashboard home page
                $this->redirectTo($postData['user_role']);

            } else {
                #set exception message
                $this->session->set_flashdata('exception',display('incorrect_email_password'));
                //redirect to login form
                redirect('login');
            }

        } else {

            $this->load->view('layout/login_wrapper',$data);
        } 
    }  

    public function redirectTo($user_role = null)
    {
        //redirect to dashboard/home page
        switch ($user_role) {
            case 1:
                    redirect('dashboard/home');
                break; 
            case 2:
                    redirect('dashboard_doctor/home');
                break;  

            case 10:
                    redirect('dashboard_patient/home');
                break; 
            //if $user_role is not set 
            //then redirect to login
            default: 
                    redirect('login');
                break;
        }        
    }


    public function home()
    {    
        if ($this->session->userdata('isLogIn') == false
            || $this->session->userdata('user_role') != 1)
        redirect('login');  

        $data['title'] = display('home');
        #------------------------------#
        $data['notify']   = $this->dashboard_model->notify(); 
        $data['surveys'] = $this->dashboard_model->surveys();
        $data['chart']    = $this->dashboard_model->chart();    
        $data['content']  = $this->load->view('home',$data,true);
        $this->load->view('layout/main_wrapper',$data);
    } 

    public function profile()
    {  
        $data['title'] = display('profile');
        #------------------------------# 
        $user_id = $this->session->userdata('user_id');
        $data['user']    = $this->dashboard_model->profile($user_id);
        $data['content'] = $this->load->view('profile', $data, true);
        $this->load->view('layout/main_wrapper',$data);
    } 

    public function email_check($email, $user_id)
    { 
        $emailExists = $this->db->select('email')
            ->where('email',$email) 
            ->where_not_in('user_id',$user_id) 
            ->get('user')
            ->num_rows();

        if ($emailExists > 0) {
            $this->form_validation->set_message('email_check', 'The {field} field must contain a unique value.');
            return false;
        } else {
            return true;
        }
    }

    public function checkAndSendMail()
    {

        $email = $this->input->post('emailaddress',true);
        $emailExists = $this->db->select('email')
            ->where('email',$email)
            ->get('patient')
            ->num_rows();

        $getpassword  = $this->randomStringGererate();
        $encrptpassword = md5($getpassword);

        if ($emailExists ==  0) {
            echo json_encode(array('status'=>404, 'message'=>'This Email Address is not Register Please Check You Email Again'));
        }
        else{

                //Update Temporary Password in Database
                $this->db->set('password', $encrptpassword);
                $this->db->where('email', $email);
                $this->db->update('patient');

                $message = 'Dear Customer,' .   "<br/><br/>"  . 'You recently requested to reset your password. Please find your temporary password below.'
                    . "<br/>" .  $getpassword . "<br/><br/>" .  "Best Regards ThinkBots";

                $data['email'] = (object)$postData = array(
                'from'        => 'info@thinkbots.tech',
                'to'          => $this->input->post('emailaddress'),
                'subject'     => 'Recover Your Password',
                'message'     =>   $message,

                );

            /* --------INITIAL CONFIG---------*/
            $config = array(
                'protocol' => 'smtp',
                'smtp_host' => $this->config->item('smtp_host'),
                'smtp_port' => 465,
                'smtp_user' => $this->config->item('smtp_user'),
                'smtp_pass' => $this->config->item('smtp_pass'),
                'mailtype' => 'html',
                'charset' => 'iso-8859-1'
            );
            $this->email->initialize($config);
            $this->email->set_mailtype("html");
            $this->email->set_newline("\r\n");

            $this->email->to($postData['to']);
            $this->email->from($postData['from']);
            $this->email->subject($postData['subject']);
            $this->email->message($postData['message']);

            if ($this->email->send()) {
                #set success message
                echo json_encode(array('status'=>200, 'message'=>'For Further Detail Please Check Your Email Address'));
            }
            else {
                #set exception message
                echo json_encode(array('status'=>500, 'message'=>'Something went wrong!'));
            }
        }

    }

    public function registerPatient(){

        $email = $this->input->post('remail');

        $emailExists = $this->db->select('email')
            ->where('email',$email)
            ->get('patient')
            ->num_rows();

        if($emailExists === 1){
            echo json_encode(array('status'=>204, 'message'=>'This Email is Already Registered!'));
        }
        else{
            $data['patient'] = (object)$postData = [
                'patient_id'   => "P".$this->randStrGen(2,7),
                'firstname'  =>  $this->input->post('rfname'),
                'lastname' => $this->input->post('rlname'),
                'email' => $this->input->post('remail'),
                'password' => md5($this->input->post('rpassword')),
                'mobile' => $this->input->post('rtel'),
                'date_of_birth' => $this->input->post('rdob'),
                'sex' => $this->input->post('sex'),
                'address' => $this->input->post('raddress'),
                'status' => 0
            ];

            if ($this->dashboard_model->createPatient($postData)) {
                echo json_encode(array('status'=>200, 'message'=>'We have received your registration request. You will receive a conformation email soon'));
            }else{
                echo json_encode(array('status'=>500, 'message'=>'Something went wrong!'));
            }
        }

    }


    private function randomStringGererate()
    {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < 5 ; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }




    public function form()
    {
        $data['title'] = display('edit_profile');
        $user_id = $this->session->userdata('user_id');
        #-------------------------------#
        $this->form_validation->set_rules('firstname', display('first_name') ,'required|max_length[50]');
        $this->form_validation->set_rules('lastname', display('last_name'),'required|max_length[50]');

        $this->form_validation->set_rules('email',display('email'), "required|max_length[50]|valid_email|callback_email_check[$user_id]");

        $this->form_validation->set_rules('password', display('password'),'required|max_length[32]|md5');

        $this->form_validation->set_rules('phone', display('phone') ,'max_length[20]');
        $this->form_validation->set_rules('mobile', display('mobile'),'required|max_length[20]');
        $this->form_validation->set_rules('blood_group', display('blood_group'),'max_length[10]');
        $this->form_validation->set_rules('sex', display('sex'),'required|max_length[10]');
        $this->form_validation->set_rules('date_of_birth', display('date_of_birth'),'max_length[10]');
        $this->form_validation->set_rules('address',display('address'),'required|max_length[255]');
        #-------------------------------#
        //picture upload
        $picture = $this->fileupload->do_upload(
            'assets/images/doctor/',
            'picture'
        );
        // if picture is uploaded then resize the picture
        if ($picture !== false && $picture != null) {
            $this->fileupload->do_resize(
                $picture, 
                293,
                350
            );
        }
        //if picture is not uploaded
        if ($picture === false) {
            $this->session->set_flashdata('exception', display('invalid_picture'));
        }
        #-------------------------------# 
        $data['doctor'] = (object)$postData = [
            'user_id'      => $this->input->post('user_id',true),
            'firstname'    => $this->input->post('firstname',true),
            'lastname'     => $this->input->post('lastname',true),
            'designation'  => $this->input->post('designation',true),
            'department_id' => $this->input->post('department_id',true),
            'address'      => $this->input->post('address',true),
            'phone'        => $this->input->post('phone',true),
            'mobile'       => $this->input->post('mobile',true),
            'email'        => $this->input->post('email',true),
            'password'     => md5($this->input->post('password',true)),
            'short_biography' => $this->input->post('short_biography',true),
            'picture'      => (!empty($picture)?$picture:$this->input->post('old_picture')),
            'specialist'   => $this->input->post('specialist',true),
            'date_of_birth' => date('Y-m-d', strtotime($this->input->post('date_of_birth',true))),
            'sex'          => $this->input->post('sex',true),
            'blood_group'  => $this->input->post('blood_group',true),
            'degree'       => $this->input->post('degree',true),
            'created_by'   => $this->session->userdata('user_id'),
            'create_date'  => date('Y-m-d'),
            'status'       => 1,
        ]; 
        #-------------------------------#
        if ($this->form_validation->run() === true) {

            if ($this->dashboard_model->update($postData)) {
                #set success message
                $this->session->set_flashdata('message',display('update_successfully'));
            } else {
                #set exception message
                $this->session->set_flashdata('exception', display('please_try_again'));
            }

            //update profile picture
            if ($postData['user_id'] == $this->session->userdata('user_id')) {                  
                $this->session->set_userdata([
                    'picture'   => $postData['picture'],
                    'fullname'  => $postData['firstname'].' '.$postData['lastname']
                ]); 
            }
            
            redirect('dashboard/form/');

        } else {
            $user_id = $this->session->userdata('user_id');
            $data['doctor'] = $this->dashboard_model->profile($user_id); 
            $data['content'] = $this->load->view('profile_form',$data,true);
            $this->load->view('layout/main_wrapper',$data);
        } 
    }

    public function randStrGen($mode = null, $len = null){
        $result = "";
        if($mode == 1):
            $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        elseif($mode == 2):
            $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        elseif($mode == 3):
            $chars = "abcdefghijklmnopqrstuvwxyz0123456789";
        elseif($mode == 4):
            $chars = "0123456789";
        endif;

        $charArray = str_split($chars);
        for($i = 0; $i < $len; $i++) {
            $randItem = array_rand($charArray);
            $result .="".$charArray[$randItem];
        }
        return $result;
    }


    public function logout()
    {   
        $this->session->sess_destroy(); 
        redirect('login');
    } 
 
}
