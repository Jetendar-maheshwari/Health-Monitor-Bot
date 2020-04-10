<div class="row">
    <!--  table area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">
 
            <div class="panel-body">
                <table width="100%" class="datatable table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th><?php echo display('serial') ?></th>
                            <th><?php echo display('appointment_id') ?></th>

                            <th><?php echo display('doctor_name') ?></th></th>

                            <th><?php echo display('date') ?></th>
                            <th width="80"><?php echo display('action') ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                        if (!empty($appointment)) {
                            $sl = 1;
                            foreach ($appointment as $value) {
                        ?>
                            <tr>
                                <td><?php echo $sl; ?></td>
                                <td><?php echo $value->appointment_id; ?></td>

                                <td><?php echo $value->firstname; ?></td>

                                <td><?php echo date('d-m-Y', strtotime($value->date)); ?></td>
                                <td class="center">
                                    <a href="<?php echo base_url("appointment/view/$value->appointment_id") ?>" class="btn btn-xs btn-success"><i class="fa fa-eye"></i></a>
                                </td>
                            </tr>
                        <?php 
                            $sl++; 
                            }
                        } 
                        ?> 
                    </tbody>
                </table>  <!-- /.table-responsive -->
            </div>
        </div>
    </div>
</div>

