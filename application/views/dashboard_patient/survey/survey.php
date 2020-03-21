<div class="row">
    <!--  table area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">

            <div class="panel-body">
                <table width="100%" class="datatable table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th><?php echo display('serial') ?></th>
                        <th>Symptoms</th>
                        <th>Filled Date</th>
                        <th>Calculate Point </th>
                        <th>Condition</th>
                        <th><?php echo display('status') ?></th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php if (!empty($surveys)) { ?>
                        <?php $sl = 1; ?>
                        <?php foreach ($surveys as $survey) { ?>
                            <tr class="<?php echo ($sl & 1)?"odd gradeX":"even gradeC" ?>">
                                <td><?php echo $sl; ?></td>
                                <td><?php echo $survey->Sym_name; ?></td>

                                <td><?php echo $survey->filled_date; ?></td>
                                <td><?php echo $survey->total_score; ?></td>
                                <td><?php echo $survey->condition_status; ?></td>
                                <td><?php echo $survey->remarks; ?></td>

                            </tr>
                            <?php $sl++; ?>
                        <?php } ?>
                    <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>