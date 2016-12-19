/*============================
Description: This script is used to generate the userTable table and add the corresponding columns.

Author: Bailey Strum

Date: 11/30/16  --- 2:04pm

Change History:

==============================*/

CREATE TABLE userTable
(
	userID int NOT NULL PRIMARY KEY IDENTITY(1,1), /*primary key*/
	userRoleID int NOT NULL FOREIGN KEY REFERENCES rolesTable(rolesID),   /*foreign key*/
	userCompanyID int FOREIGN KEY REFERENCES companyTable(companyID), /*foreign key*/
	emailAddress  nvarchar(150) NOT NULL,
	userPassword nvarchar(150)NOT NULL,
	firstName nvarchar(100)NOT NULL,
	lastName nvarchar(100)NOT NULL,
	phoneNumber nvarchar(100) DEFAULT NULL,
	userAddress nvarchar(200) DEFAULT NULL,
)











