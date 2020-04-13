<script type="application/javascript"> var i = 0;  </script>
<div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary" href="<?php echo base_url("symptoms/".$symptId."/questions") ?>"> <i class="fa fa-list"></i>  <?php echo display('question_list') ?> </a>
                </div>
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
                    <div class="col-md-9 col-sm-12">
                        <?php echo form_open( "symptoms/".$symptId."/questions/create",'class="form-inner"') ?>
                            <?php if(isset($ques_id)) {?>
                                <input type="hidden" name="ques_id" value="<?php echo $ques_id;?>">
                            <?php } ?>
                            <div class="form-group row">
                                
                                <label for="description" class="col-xs-3 col-form-label">Question Description</label>
                                <div class="col-xs-9">
                                    <textarea name="ques_detail" class="form-control"  placeholder="Question Description" rows="7"><?php echo $question->ques_detail ?></textarea>
                                </div>
                            </div>


                        <?php if(isset($options)){?>
                            <input type="hidden" name="length" id="length" value="<?php echo count($options);?>" />
                        <?php } else { ?>
                            <input type="hidden" name="length" id="length" />
                        <?php } ?>

                        <div class="dynamic_option row">
                
                            <?php if(!empty($options)){
                                foreach($options as $key=>$option){
                                    ?>
                                    <div class="form-group  col-sm-12">
                                        <div class="col-xs-2">
                                            <input type="hidden" name="option_id<?php echo $key;?>" value="<?php echo $option->opt_id; ?>">
                                        </div>
                                        <label for="option" class="col-xs-1 col-form-label option"> Option </label>
                                        <div class="col-xs-6">
                                            <input name="option<?php echo $key;?>" value="<?php echo $option->opt_descr; ?>"  type="text" class="form-control">
                                        </div>
                                        <label for="score" class="col-xs-1 col-form-label"> Score </label>
                                        <div class="col-xs-2">
                                            <input name="to<?php echo $key;?>"  value="<?php echo $option->opt_score; ?>" type="text" class="form-control">
                                        </div>

                                    </div>
                                    <script> i++;  </script>
                                <?php }} ?>
                        </div>
                        <div class="plus">
                        <div class="col-xs-1">
                                <i class="fa fa-plus-circle fa-2x range" onclick="option()" style="color: dodgerblue" aria-hidden="true"></i>
                                </div> <label class= "addoption" > Add Option</label> </div>
                                <div class="form-group button">
                            <div class="col-sm-offset-3 col-sm-6">
                                <div class="ui buttons">
                                    <button type="reset" class="ui button"><?php echo display('reset') ?></button>
                                    <div class="or"></div>
                                    <button class="ui positive button"><?php echo display('save') ?></button>
                                </div>
                            </div>
                        </div>

                        <?php echo form_close() ?>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function  dynamic_add() {
        let str =  `<div class="form-group row col-sm-12">
                <div class="col-xs-2"> </div>
                <label for="option" class="col-xs-1 col-form-label"> option </label>
                <div class="col-xs-6">
                    <input name="option`+i+`"  type="text" class="form-control" id="option`+i+`">
                </div>
                <label for="score" class="col-xs-1 col-form-label"> Score </label>
                <div class="col-xs-2">
                    <input name="to`+i+`"  type="text" class="form-control" id="to`+i+`">
                </div>
                </div>`;
        i++;
        $('#length').val(i);
        return str;
    }

    function option() {
        let formDiv = $('.form-inner .dynamic_option');
        formDiv.append(dynamic_add());
    }
</script>