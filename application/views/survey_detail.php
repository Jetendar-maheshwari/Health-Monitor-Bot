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
                    <dt>Remarks</dt>
                    <dd><?php echo $surveydetails->remarks ?></dd>
                    <dt>Filled Date</dt>
                    <dd><?php echo $surveydetails->filled_date ?></dd>
                    <dt>Score</dt>
                    <dd><?php echo $surveydetails->total_score ?></dd>
                    <dt>Status</dt>
                </dl>
            </div>

            <?php if (!empty($questiondetails)) { ?>
                <?php $sl = 1; ?>
                <?php foreach ($questiondetails as $questiondetail) { ?>


                        <h1 align="left">Q <?php echo $sl; ?> . <?php echo $questiondetail->questionname; ?> ? </h1>
                        <p align="left"> <?php echo $questiondetail->optionname; ?></p>

                    </tr>
                    <?php $sl++; ?>
                <?php } ?>
            <?php } ?>



        </div>
     </div>
</div>
 

  


