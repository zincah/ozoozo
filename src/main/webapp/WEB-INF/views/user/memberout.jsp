<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/user_css/header/memberout.css?var=1">
</head>
<script>

function statuschange(){
	
	
	 if( $('#_3UImz').is(':checked') ){
	
		 $.ajax({
	  		url: "stopit.com",
	  		type:'post',
	  		contentType : 'application/json; charset=UTF-8',
	  		dataType : 'text',
	  		success : function(resp){
	  			
	  			if(resp == 'success'){
	  				alert("Ż�� ��û�� �Ϸ�Ǿ����ϴ�. ���� ���� Ż�� �Ϸ�˴ϴ�.");
	  				document.location = '/house/logout.com'
	  			}
	  		},
	  		error:function(request, status, error){
	  			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

	  		}
	  		
	  		
		}); 
	 
	}else{
		alert("ȸ��Ż�� ��û������ Ȯ���Ͽ� üũ���ּ���.")
		
	} 
  		
  	}
	


</script>
<body>
  <!-- ��� -->
  <!-- �ٵ�  -->

    
        <div class="css-gz4wgi e187gapo9">
            <h1 class="css-114qsva e187gapo8">ȸ��Ż�� ��û</h1>
            <div class="css-1cltfo6 evfva9a4">
                <div class="css-1nnxwro evfva9a3">ȸ�� Ż�� ��û�� �ռ� �Ʒ� ������ �ݵ�� Ȯ�����ּ���.</div>
                <div class="css-0 evfva9a2">
                    <div class="css-15t02j8 e187gapo7">
                        <h3>ȸ��Ż�� �� ó������</h3>
                        <ul>
                            <li>�������� ����Ʈ�������� �Ҹ�Ǹ� ȯ�ҵ��� �ʽ��ϴ�.</li>
                            <li>�������� ���� ������ �����˴ϴ�.</li>
                            <li>�Һ��ں�ȣ�� ���� ���� ��6���� �ǰ�,��� �Ǵ� û��öȸ � ���� ����� 5��, ��ݰ��� �� ��ȭ���� ���޿� ���� ����� 5��, �Һ����� �Ҹ� �Ǵ�
                                ����ó���� ���� ����� 3�� ���� �����˴ϴ�. �� ���������� ������ ���� ���� ���� �ܿ� �ٸ� �������δ� �̿���� �ʽ��ϴ�.</li>
                        </ul>
                        <h3>ȸ��Ż�� �� �Խù� ����</h3>
                        <p>ȸ��Ż�� �� �������� ���񽺿� �Է��� �Խù� �� ����� �������� ������, ȸ������ ������ ���� �ۼ��� ������ Ȯ���� �� �����Ƿ� �Խù� ���� �� ���� ó���� ��õ������
                            �Ұ��� �մϴ�. �Խù� ������ ���Ͻô� ��쿡�� ���� �ش� �Խù��� ���� �Ͻ� ��, Ż�� ��û�Ͻñ� �ٶ��ϴ�.</p>
                        <h3>ȸ��Ż�� �� �簡�� ����</h3>
                        <p>Ż�� ȸ���� �簡���ϴ��� ������ �������� ����Ʈ�� �̹� �Ҹ�Ǿ��� ������ �絵���� �ʽ��ϴ�.</p>
                    </div>
                    <div class="css-xb73h0 e187gapo5">
                        <div><label class="_3xqzr _4VN_z">
                                <div class="_3zqA8"><input id="_3UImz" type="checkbox" class="_3UImz" name="confirmed"
                                        value=""><span class="_2mDYR"><svg width="1em" height="1em" viewBox="0 0 16 16"
                                            class="_2UftR">
                                            <path fill="currentColor"
                                                d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z">
                                            </path>
                                        </svg></span></div><span class="_1aN3J">�� ������ ��� Ȯ���Ͽ����ϴ�.&nbsp;<span
                                        class="css-alijph e187gapo3">�ʼ�</span></span>
                            </label></div>
                        <div>������ <b>1670-0876</b></div>
                    </div>
                </div>
            </div>
            
           
            <div class="css-zjik7 e187gapo1">
            <button class="_3Z6oR _3s8ZZ _2tsrJ css-1s8op8d e187gapo0"
                    type="submit" onclick="statuschange()">Ż���û</button>
                    <button class="_3Z6oR _3AsCW _2tsrJ css-1s8op8d e187gapo0"
                    type="button">����ϱ�</button></div>
        </div>
    
  <!-- Ǫ��  -->

</body>
</html>