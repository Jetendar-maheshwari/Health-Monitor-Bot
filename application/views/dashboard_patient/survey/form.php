<div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail"> 

            <div class="panel-heading">
                <div class="btn-group">
                    <a class="btn btn-success" href="<?php echo base_url("dashboard_patient/survey/survey") ?>"> <i class="fa fa-list"></i>  View History </a>
                </div>
            </div>



            <div class="panel-body">
                <?php echo form_open_multipart('dashboard_patient/survey/survey/submitSurvey','class="form-inner" id="mailForm" ') ?>

                <div class="row">
                    <div id="output" class="hide alert"></div>

                    <div class="col-md-9 col-sm-12">

                            <div class="form-group row">
                                <label for="sym_id" class="col-xs-3 col-form-label">Symptoms</label>
                                <div class="col-xs-9" id=  >
                                    <?php echo form_dropdown('sym_id',$symptoms_list,$survey->sym_id,'class="form-control sym" id="sym_id_dropdown"') ?>
                                </div>
                            </div>
                    </div>
                </div>
                <div class="col-xs-1 col-xs-offset-0"></div>
                <div class="col-xs-9">
                <div class="survey_questions_out row">
                </div>
                </div>
</div>
                <div class="result_out">

                </div>
                <div class="col-xs-1 col-xs-offset-0"></div>
                <div class="col-xs-10">
                <div class="range_out">
                </div>
                </div>
                </div>
                <div style="text-align:center">
                <button type="submit"  class="btn-success patientsubmit">Submit</button>
                </div>
            </div>
            <?php echo form_close() ?>
        </div>
    </div>
</div>