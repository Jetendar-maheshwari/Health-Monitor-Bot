


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
                            <button  class="btn btn-primary btn-sm sendMail" id="sendMail"  >Save</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>