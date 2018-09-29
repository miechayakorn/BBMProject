BBMWebApp <br>
Link: http://localhost:8080/BBMWebApp/index.html <br><br>
/index หน้าแรก <br>
/ErrorInfo.jsp หน้า 404 - FileNotFound <br>
/Login หน้าLogin <br>
/Register หน้าสมัครสมาชิก <br>
/Activate? หน้าactivatecodeจากemail <br>
/Recovery หน้ากู้รหัสผ่าน <br>
/Shoping หน้าซื้อของ <br>
/Item?id=12 แสดงรายละเอียดข้อมูลสินค้าidนั้นๆ <br>

<hr>
<h3>Run sql - Register</h3>
User:admin Pass:12345 <br><br>

<code>
create table Register
(email varchar(30) primary key,
password varchar(40)not null,
registerDate timestamp,
activateKey varchar(40)not null,
activateDate timestamp) ;
</code>
<code>insert into Register values ('admin','827ccbeea8a706c4c34a16891f84e7b') ;</code>
<hr>
