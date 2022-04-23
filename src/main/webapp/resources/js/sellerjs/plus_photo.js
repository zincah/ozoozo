var list_count = 0;

function plus_list(){

    $(".detail_file_list").show();

    list_count++;
    var countcheck = $(".countcheck").length;


    var html = 
    
    '<tr class="content-table-content countcheck" id="detail_list'+list_count+'">\
        <td class="content-table-content-text option-line" id="fileName'+list_count+'">\
            <input type="file" name="detail-img'+list_count+'" id="detail-img'+list_count+'" style="display: none;" onchange="photo_name'+list_count+'(this)" multiple="multiple">\
        </td>\
        <td class="content-table-content-text option-line">\
            <button type="button" class="btn btn-custom" id="detail-file-del-btn'+list_count+'" onclick="detail_file_del'+list_count+'()">삭제</button>\
            <button type="button" class="btn btn-custom" id="detail-file-upload-btn'+list_count+'" onclick="detail_upload_btn'+list_count+'()">업로드</button>\
        </td>\
    </tr>\
    <script class="photo_js'+list_count+'">\
    function detail_upload_btn'+list_count+'(){\
        var upload_value = $("#detail-img'+list_count+'");\
        $("#detail-img'+list_count+'").click();\
    }\
    function photo_name'+list_count+'(input){\
        var name = input.value;\
        var names = name.split("\\\\");\
        var trueName = names[names.length-1];\
        document.getElementById("fileName'+list_count+'").textContent = trueName;\
    }\
    function detail_file_del'+list_count+'(){\
        $("tr").remove("#detail_list'+list_count+'");\
        $("script").remove(".photo_js'+list_count+'");\
        var len = $(".countcheck").length;\
        if(len==0){\
            $(".detail_file_list").hide();\
        }else{\
            $(".detail_file_list").show();\
        }\
    }\
    </script>';

    if(countcheck < 10){
        $("#table-content-plus").append(html);
    }else{
        alert("더이상 추가되지 않습니다.")
    }
    
}

