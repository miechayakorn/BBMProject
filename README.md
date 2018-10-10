# BBMWebApp

- Link: [http://localhost:8080/BBMWebApp/index.html](http://localhost:8080/BBMWebApp/index.html)
- Board: [https://app.gitkraken.com/glo/board/W69Ml4WGZA4AV_pa](https://app.gitkraken.com/glo/board/W69Ml4WGZA4AV_pa)

/index หน้าแรก  
/ErrorInfo.jsp หน้า 404 - FileNotFound  
/Login หน้าLogin  
/Register หน้าสมัครสมาชิก  
/Activate? หน้าactivatecodeจากemail  
/Recovery หน้ากู้รหัสผ่าน  
/Shoping หน้าซื้อของ  
/Item?id=12 แสดงรายละเอียดข้อมูลสินค้าidนั้นๆ  

## DB Connection

***Database Name:*** BBMProject  
***UserName:*** bbm  
***Password:*** bbm  

## Run sql - Register
***email:*** admin@mail.com  
***Pass:*** 12345  

```sql
create table MemberCustomer (email varchar(30) primary key, password varchar(40)not null, name varchar(20)not null, surname varchar(30)not null, phone varchar(10)not null, registerDate timestamp not null, activateKey varchar(40)not null, activateDate timestamp); 
```
```sql
insert into MemberCustomer (email,password,name,surname,phone,registerdate,activatekey) values ('admin@mail.com','827ccbeea8a706c4c34a16891f84e7b','bbm','project','0812345678','2018-09-29 15:13:36.630','8014892c0e83400');
```
