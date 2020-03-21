var calculateSCore = function(){
    var sum = 0;
    var options = $('input[type=radio]');

    for(var i=0; i<options.length; i++){
        if(options[i].checked){
            var split_value = (options[i].value).split('_');
            sum+= parseInt(split_value[1], 10);
        }
    }
    var divR = $('.result_out');
    divR.empty();
    divR.append('<h1 >' + sum + ' ' + (sum>1? 'Points' : 'Point') + '</h1>');
    divR.append('<input type="hidden" id="points" name="'+ sum +'" >');

};

$( document ).ready(function() {
    $('#sym_id_dropdown').on('change', function() {
        $.ajax({
            url: baseURL + "dashboard_patient/survey/survey/getSymptomsDetail",
            method:"GET",
            data:{
                sympId: this.value,
            },
            success:function(data){
                var response = JSON.parse(data);
                if(response != null){
                    var div = $('.survey_questions_out');
                    div.empty();
                    var str = '';
                    var symptoms = response.symptoms;
                    str+= '<h1> '+ symptoms.name +' </h1>'
                    var questions = symptoms.questions;
                    for (var i=0; i<questions.length; i++){
                        str+= '<h2 text-align="left" width:100%;>' + "Q. " + (  i+1) + "&nbsp;&nbsp;&nbsp;" + questions[i].ques_detail + '</h2>';
                        var options = questions[i].options;
                        for(var j=0; j<options.length; j++ ){
                            str+= '<input type="radio" onchange="calculateSCore()" name="questionId_'+questions[i].ques_id+'" value="'+ options[j].opt_id + '_'+  options[j].opt_score+ '"/> <span> '+options[j].opt_descr+' </span> <br>'
                        }
                    }
                    div.append(str);

                    var div2 = $('.range_out');
                    div2.empty();
                    var ranges = symptoms.ranges;
                    var strr = '<table class="table table-striped remark " border="1"   > <tr>  <th> Range From </th> <th> Range To </th> <th> Remarks </th> </tr> ';
                    for (var i=0; i<ranges.length; i++){
                        strr+= `<td>${ranges[i].range_from}</td> <td> ${ranges[i].range_to} </td> <td> ${ranges[i].remarks} </td> </tr>`;
                    }
                    strr+= '</table>';
                    div2.append(strr);
                }
            }
        });
    });
});