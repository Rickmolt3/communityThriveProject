/*============================
Description: This script is used to generate the userRole table and add the corresponding columns.

Author: Bailey Strum

Date: 11/30/16  --- 2:04pm

Change History:

==============================*/

CREATE TABLE userRole
(
	userRoleID int NOT NULL PRIMARY KEY IDENTITY(1,1), /*primary key*/
	roleID int FOREIGN KEY REFERENCES rolesTable(rolesID) /*foreign key*/

)

