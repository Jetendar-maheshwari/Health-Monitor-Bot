<div class="row">
    <!--  table area -->
    <div class="col-sm-12" id="PrintMe">
        <div class="panel panel-default thumbnail">
            <div class="panel-heading  no-print">
                <div class="btn-group">
                    <a class="btn btn-success" href="<?php echo base_url("patient/survey") ?>"> <i class="fa fa-list"></i>  View History </a>
                    <button type="button" onclick="printContent('PrintMe')" class="btn btn-danger"><i class="fa fa-print"></i></button> 
                </div> 
            </div>
            <div class="panel-body">
                <dl class="dl-horizontal">
                    <dt>Symptoms</dt>
                    <dd><?php echo $surveydetails->Sym_name ?></dd>
                    <dt>Severity/Comment</dt>
                    <dd><?php echo $surveydetails->remarks ?></dd>
                    <dt>Filled Date</dt>
                    <dd><?php echo $surveydetails->filled_date ?></dd>
                    <dt>Score</dt>
                    <dd><?php echo $surveydetails->total_score ?></dd>
                </dl>
            </div>
            <div class="response">
            <?php if (!empty($questiondetails)) { ?>
                <?php $sl = 1; ?>
                <?php foreach ($questiondetails as $questiondetail) { ?>
            
            <div class="col-sm-8">
            <h4 align="left" style="color:#1fa5c4; margin-left:35px;">Q <?php echo $sl; ?> . <?php echo $questiondetail->questionname; ?> </h4>
            </div>
            <div class="col-sm-6">
            <p class="Severity" style="font-weight:600; margin-left:35px;"> Answer: <?php echo $questiondetail->optionname; ?></p>
            </div>
            

                    <?php $sl++; ?>
                <?php } ?>
            <?php } ?>
            </div>
        </div>
     </div>
</div>
 

  


