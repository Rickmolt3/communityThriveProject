/*============================
Description: This script is used to generate the rolesTable table and add the corresponding columns.

Author: Bailey Strum

Date: 11/30/16  --- 3:16pm

Change History:

==============================*/

CREATE TABLE rolesTable 
(
	rolesID int NOT NULL PRIMARY KEY, /*primary key*/
	roleDescription nvarchar(150),

)