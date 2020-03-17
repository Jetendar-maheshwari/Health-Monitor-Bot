<script type="application/javascript"> var i = 0;  </script>
<div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">

            <div class="panel-heading no-print">
                <div class="btn-group">
                    <a class="btn btn-primary" href="<?php echo base_url("symptoms") ?>"> <i class="fa fa-list"></i>  <?php echo display('symptoms_list') ?> </a>
                </div>
            </div>

            <div class="panel-body panel-form">
                <div class="row">
                    <div class="col-md-9 col-sm-12">

                        <?php echo form_open('symptoms/create','class="form-inner"') ?>

                        <?php echo form_hidden('sym_id',$symptoms->sym_id) ?>

                        <div class="form-group row">
                            <label for="name" class="col-xs-3 col-form-label"><?php echo display('name') ?> <i class="text-danger">*</i></label>
                            <div class="col-xs-9">
                                <input name="name"  type="text" class="form-control" id="name" required placeholder="<?php echo display('name') ?>" value="<?php echo $symptoms->name ?>">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="description" class="col-xs-3 col-form-label"><?php echo display('description') ?></label>
                            <div class="col-xs-9">
                                <textarea name="description" class="form-control"  placeholder="<?php echo display('description') ?>" rows="7"><?php echo $symptoms->description ?></textarea>
                            </div>
                        </div>

                        <!--Radio-->
                        <!-- <div class="form-group row">
                            <label class="col-sm-3"><?php echo display('status') ?></label>
                            <div class="col-xs-9">
                                <div class="form-check">
                                    <label class="radio-inline"><input type="radio" name="status" value="1" checked><?php echo display('active') ?></label>
                                    <label class="radio-inline"><input type="radio" name="status" value="0"><?php echo display('inactive') ?></label>
                                </div>
                            </div>
                        </div> -->
                        <?php if(isset($ranges)){?>
                            <input type="hidden" name="length" id="length" value="<?php echo count($ranges);?>" />
                        <?php } else { ?>
                            <input type="hidden" name="length" id="length" />
                        <?php } ?>

                        <div class="dynamic_range">
                            <?php if(!empty($ranges)){
                                foreach($ranges as $key=>$range){
                                ?>
                                <div class="form-group row ">
                                    <div class="col-xs-2">
                                        <input type="hidden" name="range_id<?php echo $key;?>" value="<?php echo $range->range_id; ?>">
                                    </div>
                                    <label for="name" class="col-xs-1 col-form-label"> Range </label>
                                    <div class="col-xs-4">
                                        <input name="from<?php echo $key;?>" value="<?php echo $range->range_from; ?>"  type="text" class="form-control">
                                    </div>
                                    <label for="name" class="col-xs-1 col-form-label"> _ </label>
                                    <div class="col-xs-4">
                                        <input name="to<?php echo $key;?>"  value="<?php echo $range->range_to; ?>" type="text" class="form-control">
                                    </div>
                                    <div class="col-xs-2">
                                        <input type="hidden" name="range_id<?php echo $key;?>" value="<?php echo $range->range_id; ?>">
                                    </div>
                                    <label for="name" class="col-xs-1 col-form-label mark"> Remark </label>
                                    <div class="col-xs-9">
                                        <textarea rows="2"<?php echo $key;?> value="<?php echo $range->remarks; ?>"  class="form-control mark"></textarea>
                                        <input type="hidden" value="<?php echo $range->symptoms_id; ?>" name="symptoms_id<?php echo $key;?>" />
                                    </div>
                                </div>
                                 <script> i++;  </script>
                            <?php }} ?>

                        </div>

                        <div class="form-group row">
                            <div class="col-xs-3"> </div>
                            <div class="col-xs-1">
                                <i class="fa fa-plus-circle fa-3x range" onclick="ranges()" style="color: dodgerblue" aria-hidden="true"></i>
                            </div>  <label class= "add" > Add Ranges</label>
                        </div>

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
        let sym_id = $('input[name=sym_id]').val();
        let str =  `<div class="form-group row ">
                <div class="col-xs-2">
                </div>
                <label for="name" class="col-xs-1 col-form-label"> Range </label>
                <div class="col-xs-4">
                    <input name="from`+i+`"  type="text" class="form-control" id="from`+i+`">
                </div>
                <label for="name" class="col-xs-1 col-form-label"> _ </label>
                <div class="col-xs-4">
                    <input name="to`+i+`"  type="text" class="form-control" id="to`+i+`">
                </div>
                <div class="col-xs-2">
                </div>
                <label for="name" class="col-xs-1 col-form-label"> Remark </label>
                <div class="col-xs-9">
                    <textarea name="remarks`+i+`"  type="text" class="form-control mark" id="remarks`+i+`"></textarea>
                    <input type="hidden" value="`+sym_id+`" name="symptoms_id`+i+`" />
                </div>
                </div>`;
        i++;
        $('#length').val(i);
        return str;
    }

    function ranges() {
        let formDiv = $('.form-inner .dynamic_range');
        formDiv.append(dynamic_add());
    }
</script> 