create database wordpress; 
create user roott@localhost identified by 'roottpass'; 
grant all privileges on *.* to roott@localhost; 
flush privileges;
