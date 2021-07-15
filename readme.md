## Migration.
* sequelize model:generate --name user --attributes first_name:STRING,last_name:STRING,username:STRING,email:STRING,address:STRING,phone:BIGINT,password:STRING
* sequelize model:generate --name logging --attributes idUser:INTEGER,username:STRING,role:ENUM,token:STRING
* sequelize model:generate --name admin --attributes username:STRING,email:STRING,fullname:STRING,password:STRING