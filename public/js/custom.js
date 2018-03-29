$(document).ready(function(){
    $(document).on('change','#category',function(){
        var category=$(this).val();
        $.ajax({
            url:SITE_URL+'/admin/categories/getAllSubcategory/'+category,
            type:'get',
            data:{category:category},
            success:function(response){
              $('#subcategory').html(response);
            }
        });
    });
});