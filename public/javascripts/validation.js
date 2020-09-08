
// Register lawcaform

$('#lawcatform').validate({
    rules : {
        category_name : {
            required : true,
        },
       description :{
            required : true,
         },
    }
});


// Register laws

$('#lawsform').validate({
    rules : {
        category_name : {
            required : true,
        },
        law_name :{
            required : true,
         },
        law_number :{
            required : true,
         },

       description :{
            required : true,
         },

    }
});





//  comment form
$('#commentform').validate({
     rules : {
         names : {
            required : true,
             minlength : 4
         },
         identity : {
            required : true
        } ,
         comment : {
            required : true,
        }

    }
});


// Agent signup form
$('#adminsignup').validate({
    rules : {
        fullname : {
            required : true,
            minlength : 6
        },
        gender : {
            required : true
        } ,
        email : {
            required : true,
            email: true
        },
        password : {
            required : true,
            minlength : 8
         },
        company : {
            required : true,
         },
        gender : {
            required : true,
         },
        address : {
            required : true,
         }


    }
});




$(document).ready(function() {     // when clicks on law , data will be saved automatically

    $('.DivLaws a').click(function (e) {


        //
        //
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        var context = $(this).parents('.DivLaws');
        var $id =  $(".lawid", context).val();


        $.ajax({
            type: 'POST',
            url:"/post/review/law/"+$id,
            data: $id,
            async: false,
            dataType: 'json',
            success:function(response){
                "successfully captured";
            },
            error:function(response){
                response;
            }
        } )
    });
});

