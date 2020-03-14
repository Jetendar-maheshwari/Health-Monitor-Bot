
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags --><!--
    <title><?/*= display('login') */?> - <?php /*echo (!empty($title)?$title:null) */?></title>-->

    <title> Health Monitoring Bot </title>


    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="<?php echo (!empty($favicon)?$favicon:null) ?>">

    <!-- Bootstrap -->
    <link href="<?php echo base_url(); ?>assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <?php if (!empty($settings->site_align) && $settings->site_align == "RTL") {  ?>
        <!-- THEME RTL -->
        <link href="<?php echo base_url(); ?>assets/css/bootstrap-rtl.min.css" rel="stylesheet" type="text/css"/>
        <link href="<?php echo base_url('assets/css/custom-rtl.css') ?>" rel="stylesheet" type="text/css"/>
    <?php } ?>

    <!-- 7 stroke css -->
    <link href="<?php echo base_url(); ?>assets/css/pe-icon-7-stroke.css" rel="stylesheet" type="text/css"/>

    <!-- style css -->
    <link href="<?php echo base_url(); ?>assets/css/custom.css" rel="stylesheet" type="text/css"/>

    <!-- navbar css -->

    <link href="<?php echo base_url(); ?>assets/css/navbar.css" rel="stylesheet" type="text/css"/>
    <link href="<?php echo base_url(); ?>assets/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

    


</head>
<body>
<!-- Content Wrapper -->

<!-- navbar -->
    <div class="content">

            <div id="navbar">
                <div class="row">

                    <div id="logo" class="col-xs-8 col-md-3">

                        <img src="assets/images/mylogo.png" class="image-style">
                    </div>

                    <div class="visible-xs visible-sm col-xs-4" id="modalToggle">
                        <button type="button" data-toggle="modal" data-target="#mobileNav"></button>
                    </div>

                    <div id="menu" class="hidden-xs hidden-sm col-md-9">
                        <ul id="mainmenu">

                            <li ><a href="#About" title="About">About</a></li>
                            <li ><a href="#offer" title="We offer">We offer</a></li>
                            <li ><a href="#" title="Contact">Contact</a></li>
                            <li> <a class="btn btn-primary requestdemo" data-toggle="modal" >   Request Demo </a>

                            </li>
                        </ul>


                    </div>

                </div>
            </div>

        <div id="content">
            <div class="section section-blue" id="section-loginBox">
                <div id="loginBox">

                    <?php echo form_open('login','id="loginForm" novalidate'); ?>

                    <div class="form-group">
                        <label class="control-label" for="user_role"><?= display('user_role') ?></label>
                        <?php
                        $userRoles = array(
                            ''  => display('select_user_role'),
                            '1' => display('admin'),
                            '2' => display('doctor'),
                            '10' => display('patient')
                        );
                        echo form_dropdown('user_role', $userRoles, $user->user_role, 'class="form-control" id="user_role" ');

                        ?>
                    </div>

                    <div class="form-group">
                        <label class="control-label" for="email"><?= display('email') ?></label>
                        <input type="text" placeholder="<?= display('email') ?>" name="email" id="email" class="form-control">
                    </div>


                    <div class="form-group">
                        <label class="control-label" for="password"><?= display('password') ?></label>
                        <input type="password"  placeholder="<?= display('password') ?>" name="password" id="password" class="form-control">
                    </div>



                    <div class="flasherror js-hint alert alert-danger" style="display: none">
                    </div>

                    <button type="submit" class="btn btn-primary "><?= display('login') ?>
                    </button>


                    <li> <a class="btn btn-primary patient_register" data-toggle="modal" >   Patient Register </a>


                    <a  class="btn btn-transparent">Forgot your password?</a>



                                <!-- alert message -->
                                <?php if ($this->session->flashdata('message') != null) {  ?>
                                    <div class="alert alert-info alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                        <?php echo $this->session->flashdata('message'); ?>
                                    </div>
                                <?php } ?>

                                <?php if ($this->session->flashdata('exception') != null) {  ?>
                                    <div class="alert alert-danger alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                        <?php echo $this->session->flashdata('exception'); ?>
                                    </div>
                                <?php } ?>

                                <?php if (validation_errors()) {  ?>
                                    <div class="alert alert-danger alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                        <?php echo validation_errors(); ?>
                                    </div>
                                <?php } ?>


                </div>
            </div>

        </div>

        <div id="testmodal" class="modal fade">
        <div class="wingBanner banner-solo" id="About" >

            <h2>About </h2>
            <p class="text-large">
                Health Monitoring Bot is a great application that helps hospitals to minimise loads of paperwork when it comes to
                monitoring their patients' health. It gives patients/users control to fill any symptom survey online in the comfort
                of their home without any time restrictions. HMB will then analyse the users' responses automatically and generate
                results on both hospital and patient accounts. Based on the results, HMB will send notifications/alerts to hospital
                staff, informing them that a patient may need to be examined by doctors. It will then help arrange an appointment
                between the patient and the hospital.
            </p>
        </div>
        </div>

        <!--Modal for Trail Request-->
        <div id="requestmodal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h3 class="modal-title">Request For Trail</h3>

                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" id="myForm" name="contact" action="#">
                        <div class="form-group">
                            <label class="control-label" for="username">User Name <i class="text-danger">*</i></label>
                            <input type="text" placeholder="Name" name="username" id="username" class="form-control" >
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="hospitalname">Hospital Name <i class="text-danger">*</i></label>
                            <input type="text" placeholder="Hospital Name" name="hospitalname" id="hospitalname" required class="form-control">
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="emailaddress">Email Address <i class="text-danger">*</i></label>
                            <input type="email" placeholder="Email Address" name="emailaddress"  required id="emailaddress" class="form-control">
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="contactno">Contact No</label>
                            <input type="text" placeholder="Contact No" name="contactno" id="contactno" class="form-control">
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="message">Message</label>
                            <input type="text-area"  name="message" id="message" class="form-control">
                        </div>

                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-3">
                                    <button  class="btn btn-primary btn-sm">Save</button>
                                </div>
                                <div class="col-sm-3">
                                    <button type="reset" class="btn btn-primary btn-sm">Reset</button>
                                </div>
                                <div class="col-sm-3">
                                    <button type="button" class="btn btn-primary btn-sm close-external-modal" data-dismiss="modal">Close</button>
                                </div>
                            </div>

                        </form>
                    </div>





                </div>
            </div>
        </div>


        <div id="myFormModal" class="modal fade" >
            <div class="modal-dialog">

                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Add details</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" id="myForm" name="contact" action="#">

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="username">User Name <i class="text-danger">*</i></label>
                                <div class="col-sm-12">
                                <input type="text" placeholder="Name" name="username" id="username" required class="form-control" >
                                </div>
                                </div>
                            <div class="form-group">
                                <label class="control-label  col-sm-3" for="hospitalname">Hospital Name <i class="text-danger">*</i></label>
                                <div class="col-sm-12">
                                <input type="text" placeholder="Hospital Name" name="hospitalname" id="hospitalname" required class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label  col-sm-3" for="emailaddress">Email Address <i class="text-danger">*</i></label>
                                <div class="col-sm-12">
                                    <input type="email" placeholder="Email Address" name="emailaddress"  required required id="emailaddress" class="form-control">
                                </div>
                                </div>
                            <div class="form-group">
                                <label class="control-label  col-sm-3" for="contactno">Contact No</label>
                                <div class="col-sm-12">
                                    <input type="text" placeholder="Contact No" name="contactno" id="contactno" class="form-control">

                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label  col-sm-3" for="message">Message <i class="text-danger">*</i></label>
                                <div class="col-sm-12">
                                <input type="text-area"  name="message" id="message" required class="form-control">
                                </div>
                            </div>


                            <div class="form-group">


                                <div class="col-sm-2">
                                    <button type="button" class="btn btn-primary btn-sm close-external-modal" data-dismiss="modal">Close</button>
                                <button  class="btn btn-primary btn-sm" >Save</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>



    <div class="container" id="offer">
        <div class="container-wrapper">
            <c class='fa fa-hand-o-right faa-wrench animated fa-4x'></c>
            <h1>Monitor Health In Few Steps
            </h1>
         </div>

        <div class="row row-style">
            <div class="col-md-6">
                  <h1 class="heading-h1">Step 1</h1>
               
                 <div class="icon-center">
                <i class="fa fa-wpforms fa-4x font-style"   aria-hidden="true"></i>
            </div>
                <h4 class="para-text">The patient has to register first after registration he has to login
                with the credientials.After that he has to fill the symptoms forms to see his health state.He can also see his previous history.Get the appointment with the doctor</h4>

            </div>

            <div class="col-md-6">

                <h1 class="heading-h1">Step 2</h1>

                <div class="icon-center">
                    <i class="fa fa-exclamation-circle fa-4x font-style" ></i>
                </div>


                <h4 class="para-text">When the patient condition is critical or moderate he can get the 
                auto appointment with the doctor and get the alert from hospital that the appointment with the
                doctor has been fixed  </h4>
            </div>
        </div>

        <div class="row row-style">
            <div class="col-md-6">
                <h1 class="heading-h1">Step 3</h1>
                 <div class="icon-center">
                 <i class="fa fa-calendar fa-4x font-style" aria-hidden="true"></i>
             </div>
                <h4 class="para-text">The admin of the hospital can see all the patient condition.He can add the sympton survey form.He can make urgent appointment with the doctors  </h4>
            </div>
            <div class="col-md-6">
                <h1 class="heading-h1">Step 4</h1>
                 <div class="icon-center">
                <i class="fa fa-smile-o fa-4x font-style" aria-hidden="true"></i>
            </div>
                 <h4 class="para-text">At the last step, the patient is very happy that he can save a lot of time and effort if the patient's condition is normal or critical he can get an appointment.The system is beneficial for both the patient and the hospital</h4>
            </div>
        </div>

    </div>
    <div class="container">
        <div class="wingBanner banner-solo" id="About" >

            <h2>About </h2>
            <p class="text-large">
                Health Monitoring Bot is a great application that helps hospitals to minimise loads of paperwork when it comes to
                monitoring their patients' health. It gives patients/users control to fill any symptom survey online in the comfort
                of their home without any time restrictions. HMB will then analyse the users' responses automatically and generate
                results on both hospital and patient accounts. Based on the results, HMB will send notifications/alerts to hospital
                staff, informing them that a patient may need to be examined by doctors. It will then help arrange an appointment
                between the patient and the hospital.
            </p>
        </div>
    </div>
<!-- footer started -->


    <div id="content">
    <div class="container-footer">
    <div class="row">
        <div class="col-md-3 ">
             <img src="assets/images/mylogo.png" class="image-stylee">
        </div>
        <div class="col-md-3">
            <h3 class="underline-text">Address</h3>
            <p>Technische Universität Chemnitz Straße der Nationen 62
                09111 Chemnitz, Germany</p>
               
        </div>
       

        <div class="col-md-3">
            <h3 class="underline-text">Contact</h3>
            <p><strong>Website:</strong><a href="https://thinkbots.tech/"> www.thinkbots.tech</a></p>
            <p><strong>Email:</strong> info@thinkbots.tech</p>
            <p><strong>Phone:</strong> +15776798658</p>
              
        </div>
        <div class="col-md-3">
             <h3 class="underline-text">Social Pages</h3>
            <div class="center-icons">
                <a href="https://www.facebook.com/thinkbots5/?modal=admin_todo_tour">
                  <i class="fa fa-facebook font-style style-facebook" > </i></a>
                  <a href="https://twitter.com/thinkbots5">
                  <i class="fa fa-twitter font-style style-facebook" ></i></a>
            </div>
        </div>
    </div>
    </div>
</div>
    <div class="page-border bottom colors-e background-solid" style= bottom:15px right:10px>
    <a href="#top" class="hover-effect totop">
        <i class="fa fa-arrow-up fa-arrow-up"></i>
    </a>
</div>
    
</div>
<!-- footer end -->



<!-- jQuery -->
<script src="<?php echo base_url('assets/js/jquery.min.js') ?>" type="text/javascript"></script>
<!-- bootstrap js -->
<script src="<?php echo base_url('assets/js/bootstrap.min.js') ?>" type="text/javascript"></script>

<script type="text/javascript">
    $(document).ready(function() {
        var info = $('table tbody tr');
        info.click(function() {
            var email    = $(this).children().first().text();
            var password = $(this).children().first().next().text();
            var user_role = $(this).attr('data-role');

            $("input[name=email]").val(email);
            $("input[name=password]").val(password);
            $('select option[value='+user_role+']').attr("selected", "selected");
        });
    });



    $(document).ready(function(){
        var show_btn=$('.requestdemo');
        show_btn.click(function(){
            $("#myFormModal").modal('show');
        })
    });

    var csrfName = '<?php echo $this->security->get_csrf_token_name(); ?>',
            csrfHash = '<?php echo $this->security->get_csrf_hash(); ?>';

    $(document).on("click", ".patient_register", function (e) {
        e.preventDefault();
        console.log("HEre");
        $.ajax({
            url: "dashboard_patient/Survey/getSymptomsDetail",
            method:"POST",
            data:{
                [csrfName]: csrfHash,
            },
            success:function(data){
                //alert("Data Send");
            }
        });
    });


    $(document).on("click", "#sendMail", function (e) {
        e.preventDefault();

        var name = $('#username').val();
        var hospitalname = $('#hospitalname').val();
        var emailaddress = $('#emailaddress').val();
        var contactno = $('#contactno').val();
        var message = $('#message').val();

        $.ajax({
            url: "dashboard_patient/Survey/getSymptomsDetail",
            method:"POST",
            data:{
                [csrfName]: csrfHash,
                name:name,
                hospitalname:hospitalname,
                emailaddress:emailaddress,
                contactno:contactno,
                message:message
            },
            success:function(data){
                //alert("Data Send");
            }
        });
    });

</script>
</body>
</html>
