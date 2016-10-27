window.onload = function(){ 
 //Ŭ���̾�Ʈ ���� ����
 var socket = io.connect('ws://127.0.0.1:3000');
 //DOM ����
 var div = document.getElementById('message');
 var txt = document.getElementById('txtChat');
 //�ؽ�Ʈ �ڽ��� ��Ŀ�� �ֱ� 
 txt.focus();
 
 //�ؽ�Ʈ �ڽ��� �̺�Ʈ ���ε�
 txt.onkeydown = sendMessage.bind(this); 
 function sendMessage(event){     
  if(event.keyCode == 13){
   //�޼��� �Է� ���� üũ   
   var message = event.target.value;
   if(message){
     //���ϼ��� �Լ� ȣ��  
     socket.emit('serverReceiver', message);
     //�ؽ�Ʈ�ڽ� �ʱ�ȭ
     txt.value = '';
   }
  }
 };
 
 //Ŭ���̾�Ʈ receive �̺�Ʈ �Լ�(�������� ȣ���� �̺�Ʈ)
 socket.on('clientReceiver', function(data){  
   //console.log('�������� ����:', data);   
   //ä��â�� �޼��� ����ϱ�
   var message = '['+ data.clientID + 'says' + '] ' + data.message;
   div.innerText += message + '\r\n';
   //ä��â ��ũ�ѹ� ������  
   div.scrollTop = div.scrollHeight;   
 });
};