
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


</head>
<body>
<!-- Content Wrapper -->

<!-- navbar -->
<div class="content">
    <div id="navbar">
        <div class="row">
            <div id="logo" class="col-xs-8 col-md-3">
                <a href="/hmb_project"><img src="assets/images/mylogo.png" class="image-style"></a>
            </div>

            <div id="menu" class="col-md-9 main-menu">
                <a href="#About" title="About">About</a>
                <a href="#offer" title="We offer">We offer</a>
                <a href="#contact" title="Contact">Contact</a>
                <a class="btn btn-primary requestdemo" data-toggle="modal" data-target="#requestDemoMainModal">Request Demo </a>
                <a href="javascript:void(0);" class="icon" onclick="navFunction()">
                    <i class="fa fa-bars"></i></a>


            </div>
        </div>
    </div>
</div>

<div id="content">
    <div class="section" id="section-loginBox">
        <div id="loginBox" >

            <?php echo form_open('login','id="loginForm" novalidate'); ?>
            <div class="form-group ">
                <label class="control-label" for="user_role"><?= display('user_role') ?></label>
                <?php
                $userRoles = array(
                    ''  => display('select_user_role'),
                    '1' => display('admin'),
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

            <button type="submit" class="btn btn-primary login-btn "><?= display('login') ?>
            </button>

            <a class="btn btn-primary patient_register" data-toggle="modal" data-target="#modalRegisterForm" >Patient Sign up </a>

            <br/>
            <div class="flasherror js-hint alert alert-danger" style="display: none">
            </div>

            <div class="js-hint alert alert-success" style="display: none">
            </div>

            <a  class="btn btn-transparent forgotbtn" id ="forgotbtn" name="forgotbtn">Forgot your password?</a>



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

            <div class="form-group" style="display:none" id="forgotpannel" >

                <input type="email" placeholder="Email Address" name="forgetpassword"  required id="forgetpassword" class="form-control">



                <button type="button"  id="btnforgetpassword" name ="btnforgetpassword" class="btn btn-primary fp ">Send
                </button>
            </div>
            <?php echo form_close(); ?>
        </div>
    </div>

</div>


<!-------------------------- Request Demo Modal Changed  ------------------------>

<div class="modal fade" id="requestDemoMainModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Request Demo</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body mx-3">
                <form class="form-horizontal" id="myForm" name="contact" action="#">
                    <div class="md-form mb-5">
                        <label data-error="wrong" data-success="right" for="orangeForm-name">Full Name</label><span class="required">*</span>
                        <input type="text"  name="username" id="username" required class="form-control" >
                    </div>

                    <div class="md-form mb-4">
                        <label data-error="wrong" data-success="right" for="orangeForm-pass">Organisation Name</label><span class="required">*</span>
                        <input type="text"  name="hospitalname" id="hospitalname" required class="form-control validate">
                    </div>

                    <div class="md-form mb-5">
                        <label data-error="wrong" data-success="right" for="orangeForm-email">Email</label><span class="required">*</span>

                        <input  type="email" placeholder="Email Address" name="emailaddress"  required required id="emailaddress" class="form-control">
                    </div>

                    <div class="md-form mb-5">
                        <label data-error="wrong" data-success="right" for="orangeForm-email">Telephone</label><span class="required">*</span>
                        <input type="tel" class="form-control " id="contactno" name="contactno" required>

                    </div>
                    <div class="md-form mb-5">
                        <label data-error="wrong" data-success="right" for="orangeForm-email">Provide Any Additional Information</label>

                        <textarea id="message" rows="5" cols="65" name="message" id="message"></textarea>
                    </div>

                    <div class="modal-footer d-flex justify-content-center">
                        <button  class="btn btn-primary btn-sm" id="submitBtnDemo" name="submitBtn" >Submit</button>
                        <button type="button" class="btn btn-primary btn-sm close-external-modal" data-dismiss="modal">Close</button>
                    </div>

                </form>

            </div>



        </div>
    </div>

</div>

<!-------------------------- Request Demo Modal Finished  ------------------------>


<div class="modal fade" id="modalRegisterForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Sign up</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body mx-3">
                <form class="form-horizontal" id="modalRegisterForm" name="modalRegisterForm" action="#">
                    <div class="md-form mb-5">
                        <label data-error="wrong" data-success="right" for="orangeForm-name">First Name</label><span class="required">*</span>
                        <input type="text"  name="rfname" id="rfname" required class="form-control" >
                    </div>

                    <div class="md-form mb-5">
                        <label data-error="wrong" data-success="right" for="orangeForm-name">Last Name</label><span class="required">*</span>
                        <input type="text" id="rlname" name="rlname" class="form-control validate" required />
                    </div>

                    <div class="md-form mb-5">
                        <label data-error="wrong" data-success="right" for="orangeForm-email">Email</label><span class="required">*</span>
                        <input type="email" name="remail" value="" id="remail" required class="form-control validate" />
                    </div>

                    <div class="md-form mb-4">
                        <label data-error="wrong" data-success="right" for="orangeForm-pass">Password</label><span class="required">*</span>
                        <input type="password" value="" name ="rpassword" id="rpassword" class="form-control validate" required />
                    </div>

                    <div class="md-form mb-5">
                        <label data-error="wrong" data-success="right" for="orangeForm-email">Mobile No</label><span class="required">*</span>
                        <input type="tel" id="rtel" name="rtel" class="form-control validate" required />
                    </div>

                    <div class="md-form mb-5">
                        <label data-error="wrong" data-success="right" for="orangeForm-email">Date of Birth</label><span class="required">*</span>
                        <input type="date" id="rdob" name="rdob" class="form-control validate" required />
                    </div>
                    <br>
                    <div class="md-form mb-5">
                        <label data-error="wrong" data-success="right" for="orangeForm-email">Sex</label>
                        <div class="form-check">
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="sex" value="Male" <?php echo  set_radio('sex', 'Male', TRUE); ?> ><?php echo display('male') ?>
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="sex" value="Female" <?php echo  set_radio('sex', 'Female'); ?> ><?php echo display('female') ?>
                            </label>

                        </div>
                    </div>
                    <br>
                    <div class="md-form mb-5">
                        <label data-error="wrong" data-success="right" for="orangeForm-email">Your Address</label><span class="required">*</span>
                        <textarea id="raddress" name="raddress" rows="5" cols="65"></textarea>

                    </div>

                    <div class="modal-footer d-flex justify-content-center">
                        <button  class="btn btn-primary btn-sm" id="submitBtnDemo" name="submitBtn" >Submit</button>
                        <button type="button" class="btn btn-primary btn-sm close-external-modal" data-dismiss="modal">Close</button>
                    </div>

                </form>

            </div>



        </div>
    </div>

</div>

<!-------------------------- Patient Registeration Modal  ------------------------>



<!--------------------- Patient Registeration Modal Finished ---------------------->

<div class="container" id="offer">
    <div class="container-wrapper">
        <c class='fa fa-hand-o-right faa-wrench animated fa-4x'></c>
        <h1>Health Monitoring in Few Steps
        </h1>
    </div>

    <div class="row row-style">
        <div class="col-md-6">
            <h1 class="heading-h1">Step 1</h1>

            <div class="icon-center">
                <i class="fa fa-wpforms fa-4x font-style"   aria-hidden="true"></i>
            </div>
            <p class="step">The patient has to register first after registration he has to login
                with the credientials.After that he has to fill the symptoms forms to see his health state.He can also see his previous history.Get the appointment with the doctor</p>

        </div>

        <div class="col-md-6">

            <h1 class="heading-h1">Step 2</h1>

            <div class="icon-center">
                <i class="fa fa-exclamation-circle fa-4x font-style" ></i>
            </div>


            <p class="step">When the patient condition is critical or moderate he can get the
                auto appointment with the doctor and get the alert from hospital that the appointment with the
                doctor has been fixed  </p>
        </div>
    </div>

    <div class="row row-style">
        <div class="col-md-6">
            <h1 class="heading-h1">Step 3</h1>
            <div class="icon-center">
                <i class="fa fa-calendar fa-4x font-style" aria-hidden="true"></i>
            </div>
            <p class="step">The admin of the hospital can see all the patient condition.He can add the sympton survey form.He can make urgent appointment with the doctors  </p>
        </div>
        <div class="col-md-6">
            <h1 class="heading-h1">Step 4</h1>
            <div class="icon-center">
                <i class="fa fa-smile-o fa-4x font-style" aria-hidden="true"></i>
            </div>
            <p class="step">At the last step, the patient is very happy that he can save a lot of time and effort if the patient's condition is normal or critical he can get an appointment.The system is beneficial for both the patient and the hospital</p>
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
    <div class="container-footer" id="contact">
        <div class="col-md-4 ">
            <div id= "thinkbots">
                <a href="https://thinkbots.tech/" target="_blank"><img src="assets/images/thinkbots.jpg" class="image-stylee"></a>
            </div>
            <div id="borderbottom"></div>
            <p class="intro"> We create automated solutions that help our customers work smarter.</p>
        </div>
        <div class="col-md-4">
            <h3 class="underline-text">Address</h3>
            <div id="borderbottom"></div>
            <p class= "address">Technical University of Chemnitz Strasse der Nationen 62
                09111 Chemnitz, Germany</p>

        </div>


        <div class="col-md-4">
            <h3 class="underline-text">Contact</h3>
            <div id="borderbottom"></div>
            <div class= "contact">
                <p><strong>Email:</strong> info@thinkbots.tech</p>
                <p><strong>Phone:</strong> +15776798658</p>
                <a href="https://www.facebook.com/thinkbots5" target="_blank" class="fa fa-facebook"></a>
                <a href="https://twitter.com/thinkbots5" target="_blank" class="fa fa-twitter"></a>
            </div>

        </div>

    </div>

</div>
<div class="page-border bottom colors-e background-solid" style= bottom:15px right:10px>
    <a href="#navbar" class="hover-effect totop">
        <i class="fa fa-arrow-up fa-arrow-up"></i>
    </a>
</div>

</div>

<footer class="col-xs-12 col-md-12 col-lg-12 copy-right"> <p style= "text-align: center">&copy; 2020 Thinkbots </p></footer>
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


    $(document).ready(function(){
        $(".forgotbtn").click(function(){
            $("#forgotpannel").show();
        });
    });

    $(document).on("click" , "#btnforgetpassword" , function (e) {
        var emailaddress = $('#forgetpassword').val();
        $.ajax({
            url: "dashboard/checkAndSendMail",
            method:"POST",
            data:{
                emailaddress:emailaddress,
                [csrfName]: csrfHash
            },
            success:function(data){
                data = JSON.parse(data);
                if(data.status === 200){
                    $('.alert-danger').css('display', 'none');
                    $('.alert-success').css('display', 'block');
                    $('.alert-success').text(data.message);
                } else {
                    $('.alert-suceess').css('display', 'none');
                    $('.alert-danger').css('display', 'block');
                    $('.alert-danger').text(data.message);
                }

                setInterval(function () {
                    $('.alert-danger').css('display', 'none');
                    $('.alert-success').css('display', 'none');
                }, 7000)
            }
        });
    });

    $('#modalRegisterForm').submit(function(e) {

        e.preventDefault();

        var rfname = $('#rfname').val();
        var rlname = $('#rlname').val();
        var remail = $('#remail').val();
        var rpassword = $('#rpassword').val();
        var rtel = $('#rtel').val();
        var rdob = $('#rdob').val();
        var sex = $('#sex').val();
        var raddress = $('#raddress').val();

        $.ajax({
            url: "dashboard/registerPatient",
            method:"POST",
            data:{
                [csrfName]: csrfHash,
                rfname:rfname,
                rlname:rlname,
                remail:remail,
                rpassword:rpassword,
                rtel:rtel,
                rdob:rdob,
                sex:sex,
                raddress:raddress,
            },
            success:function(data){
                data = JSON.parse(data);
                if(data.status == 204){
                    alert(data.message);
                }
                if(data.status === 200){
                    $('#rfname').val("");
                    $('#rlname').val("");
                    $('#remail').val("");
                    $('#rpassword').val("");
                    $('#rtel').val("");
                    $('#rdob').val("");
                    $('#sex').val("");
                    $('#raddress').val("");
                    alert(data.message);
                    $('#modalRegisterForm').modal('hide')
                }
                if(data.status === 500){
                    $('#modalRegisterForm').modal('hide')
                    alert(data.message);

                }

            }
        });

    });

    $('#requestDemoMainModal').submit(function(e) {

        e.preventDefault();
        var name = $('#username').val();
        var hospitalname = $('#hospitalname').val();
        var emailaddress = $('#emailaddress').val();
        var contactno = $('#contactno').val();
        var message = $('#message').val();

        $.ajax({
            url: "home/requestTrail",
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
                data = JSON.parse(data);
                if(data.status === 200){
                    alert(data.message);
                    $('#username').val("");
                    $('#hospitalname').val("");
                    $('#emailaddress').val("");
                    $('#contactno').val("");
                    $('#message').val("");
                }
                if(data.status === 500){
                    alert(data.message);
                }
                $('#requestDemoMainModal').modal('hide')
            }
        });
    });


    $(document).ready(function(){
        // Add smooth scrolling to all links
        $("a").on('click', function(event) {

            // Make sure this.hash has a value before overriding default behavior
            if (this.hash !== "") {
                // Prevent default anchor click behavior
                event.preventDefault();

                // Store hash
                var hash = this.hash;

                // Using jQuery's animate() method to add smooth page scroll
                // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
                $('html, body').animate({
                    scrollTop: $(hash).offset().top
                }, 800, function(){

                    // Add hash (#) to URL when done scrolling (default click behavior)
                    window.location.hash = hash;
                });
            } // End if
        });
    });

    jQuery(document).ready(function() {
        fadeMenuWrap();
        jQuery(window).scroll(fadeMenuWrap);
    });

    function fadeMenuWrap() {
        var scrollPos = window.pageYOffset || document.documentElement.scrollTop;
        if (scrollPos > 300) {
            jQuery('.fa-arrow-up').fadeIn(300);
        } else {
            jQuery('.fa-arrow-up').fadeOut(300);
        }
    }


    function navFunction() {
        var x = document.getElementById("menu");
        if (x.className === "main-menu") {
            x.className += " responsive";
        } else {
            x.className = "main-menu";
        }
    }

</script>
</body>
</html>
