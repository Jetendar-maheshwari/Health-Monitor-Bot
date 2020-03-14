<div class="row">
    <!--  table area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group">  <!--symptoms/5/questions/create-->
                    <a class="btn btn-success" href="<?php echo base_url("symptoms/".$symptId."/questions/create/") ?> "> <i class="fa fa-plus"></i>  <?php echo display('add_question') ?> </a>
                </div>
            </div>
            <div class="panel-body">
                <table class="datatable table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th><?php echo display('serial') ?></th>
                            <th><?php echo display('ques_detail') ?></th>
                            <th>Status</th>

                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($questions)) { ?>
                            <?php $sl = 1; ?>
                            <?php foreach ($questions as $question) { ?>
                                <tr class="<?php echo ($sl & 1)?"odd gradeX":"even gradeC" ?>">
                                    <td><?php echo $sl; ?></td>
                                    <td><?php echo $question->ques_detail; ?></td>


                                    <td class="center">
                                        <a href="<?php echo base_url("symptoms/".$symptId."/questions/edit/$question->ques_id") ?>" class="btn btn-xs  btn-primary"><i class="fa fa-edit"></i></a>
                                        <a href="<?php echo base_url("symptoms/".$symptId."/questions/delete/$question->ques_id") ?>" onclick="return confirm('<?php echo display("are_you_sure") ?>')" class="btn btn-xs  btn-danger"><i class="fa fa-trash"></i></a>
                                    </td>
                                </tr>
                                <?php $sl++; ?>
                            <?php } ?> 
                        <?php } ?> 
                    </tbody>
                </table>  <!-- /.table-responsive -->
            </div>
        </div>
    </div>
</div>
