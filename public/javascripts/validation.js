
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





// Agent signup form
$('#agentsigupform').validate({
     rules : {
         names : {
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
            minlength : 8        }


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


$('#agentchat').validate({

    rules : {
        message : {
            required : true,
        }

    }
});




