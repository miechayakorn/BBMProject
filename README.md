# BBMWebApp

- Link: [http://localhost:8080/BBMProject/](http://localhost:8080/BBMProject/)
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
create table account (
email varchar(40) primary key,
password varchar(40) not null,
registerDate timestamp not null,
activateKey varchar(40)not null,
activateDate timestamp);
```

```sql
create table customer (
customerId int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1) primary key,
name varchar(40) not null,
surname varchar(50) not null,
phone int not null,
idcard int not null,
address varchar(255) not null,
email varchar(40),
FOREIGN KEY (email) REFERENCES account(email));
```

```sql
create table room (
roomNumber int primary key,
floor int not null,
size varchar(100),
type char check (type in ('A','B','C')),
customerId int ,
available char(1) check (available in ('F' , 'T')),
FOREIGN KEY (customerId) REFERENCES customer(customerId));
```

```sql
create table history (
historyId int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1) primary key,
price int not null,
purchaseDate timestamp,
customerId int ,
roomNumber int not null,
FOREIGN KEY (customerId) REFERENCES customer(customerId),
FOREIGN KEY (roomNumber) REFERENCES room(roomNumber));
```

```css
<link href="https://fonts.googleapis.com/css?family=Athiti" rel="stylesheet">
font-family: 'Athiti', sans-serif;


MAIN COLOR
#161925 #272838 #23395b #1f487e #3e6990




GOOGLE MAPS API
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3877.1075395961643!2d100.49168871485426!3d13.651221803294094!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30e2a251bb6b0cf1%3A0xf656e94ff13324ad!2z4Lih4Lir4Liy4Lin4Li04LiX4Lii4Liy4Lil4Lix4Lii4LmA4LiX4LiE4LmC4LiZ4LmC4Lil4Lii4Li14Lie4Lij4Liw4LiI4Lit4Lih4LmA4LiB4Lil4LmJ4Liy4LiY4LiZ4Lia4Li44Lij4Li1!5e0!3m2!1sth!2sth!4v1541069121306" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
