<div class="row">
    <!--  table area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">

            <div class="panel-heading no-print">
                <div class="btn-group">
                    <a class="btn btn-success" href="<?php echo base_url("symptoms/create") ?>"> <i class="fa fa-plus"></i>  <?php echo display('add_symptoms') ?> </a>
                </div>
            </div>
            <div class="panel-body">
                <table class="datatable table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th><?php echo display('serial') ?></th>
                        <th><?php echo display('name') ?></th>
                        <th><?php echo display('description') ?></th>
                        <th><?php echo display('status') ?></th>
                        <th><?php echo display('action') ?></th>
                        <th>Questions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php if (!empty($symptoms)) { ?>
                        <?php $sl = 1; ?>
                        <?php foreach ($symptoms as $symptom) { ?>
                            <tr class="<?php echo ($sl & 1)?"odd gradeX":"even gradeC" ?>">
                                <td><?php echo $sl; ?></td>
                                <td><?php echo $symptom->name; ?></td>
                                <td><?php echo character_limiter($symptom->description, 60); ?></td>
                                <td><?php echo (($symptom->status==1)?display('active'):display('inactive')); ?></td>
                                <td class="center">
                                    <a href="<?php echo base_url("symptoms/edit/$symptom->sym_id") ?>" class="btn btn-xs  btn-primary"><i class="fa fa-edit"></i></a>
                                    <a href="<?php echo base_url("symptoms/delete/$symptom->sym_id") ?>" onclick="return confirm('<?php echo display("are_you_sure") ?>')" class="btn btn-xs  btn-danger"><i class="fa fa-trash"></i></a>
                                </td>
                                <td> <a href="symptoms/<?php echo $symptom->sym_id?>/questions"> <button class="btn btn-success"> View </button> </a> </td>
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
