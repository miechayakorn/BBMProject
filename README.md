<h1>BBMWebApp </h1><br>
<p>
Link: http://localhost:8080/BBMWebApp/index.html <br><br>
/index หน้าแรก <br>
/ErrorInfo.jsp หน้า 404 - FileNotFound <br>
/Login หน้าLogin <br>
/Register หน้าสมัครสมาชิก <br>
/Activate? หน้าactivatecodeจากemail <br>
/Recovery หน้ากู้รหัสผ่าน <br>
/Shoping หน้าซื้อของ <br>
/Item?id=12 แสดงรายละเอียดข้อมูลสินค้าidนั้นๆ <br></p>

<hr>
<h3>DB Connection</h3>
<p>
Database Name: BBMProject <br>
UserName: bbm <br>
Password: bbm <br>
</p>
<hr>
<h3>Run sql - Register</h3>
email:admin@mail.com Pass:12345 <br>
<code>
create table MemberCustomer
(email varchar(30) primary key,
password varchar(40)not null,
registerDate timestamp,
activateKey varchar(40)not null,
activateDate timestamp) ;
</code><br>
<code>insert into Register values ('admin@mail.com','827ccbeea8a706c4c34a16891f84e7b') ;</code>
<hr>
