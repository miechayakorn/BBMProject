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
create table customer (
customerId int primary key,
name varchar(40) not null,
surname varchar(50) not null,
phone int not null,
idcard int not null,
address varchar(255) not null);
```

```sql
create table account (
email varchar(40) primary key,
password varchar(40) not null,
registerDate timestamp not null,
activateKey varchar(40)not null,
activateDate timestamp,
customerId int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
FOREIGN KEY (customerId) REFERENCES customer(customerId));
```

```sql
create table room (
roomNumber int primary key,
floor int not null,
size varchar(100),
type char check (type in ('A','B','C')),
customerId int ,
FOREIGN KEY (customerId) REFERENCES customer(customerId)
);
```

```sql
create table history (
historyId int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1) primary key,
price int not null,
purchaseDate timestamp,
customerId int ,
roomNumber int not null,
FOREIGN KEY (customerId) REFERENCES customer(customerId),
FOREIGN KEY (roomNumber) REFERENCES room(roomNumber)
);
```

```css
<link href="https://fonts.googleapis.com/css?family=Athiti" rel="stylesheet">
font-family: 'Athiti', sans-serif;


MAIN COLOR
#161925 #272838 #23395b #1f487e #3e6990
