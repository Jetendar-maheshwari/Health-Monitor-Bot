<div class="row">
    <!--  table area -->
    <div class="col-sm-12" id="PrintMe">
        <div class="panel panel-default thumbnail">
            <div class="panel-heading  no-print">
                <div class="btn-group">
                    <a class="btn btn-success" href="<?php echo base_url("dashboard_patient/survey/survey") ?>"> <i class="fa fa-list"></i>  View History </a>
                    <button type="button" onclick="printContent('PrintMe')" class="btn btn-danger"><i class="fa fa-print"></i></button> 
                </div> 
            </div>
            <div class="panel-body">
                <dl class="dl-horizontal">
                    <dt>Symptoms</dt>
                    <dd><?php echo $surveydetails->Sym_name ?></dd>
                    <dt>Disease Level</dt>
                    <dd><?php echo $surveydetails->remarks ?></dd>
                    <dt>Filled Date</dt>
                    <dd><?php echo $surveydetails->filled_date ?></dd>
                    <dt>Score</dt>
                    <dd><?php echo $surveydetails->total_score ?></dd>

                </dl>
            </div> 
        </div>
    </div>
</div>
 

  


