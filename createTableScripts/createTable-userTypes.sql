/*============================
Description: This script is used to generate the userTypes table and add the corresponding columns.

Author: Bailey Strum

Date: 11/30/16  --- 3:21pm

Change History:

==============================*/

CREATE TABLE userTypes
(
	userType int NOT NULL PRIMARY KEY IDENTITY(1,1), /*primary key*/
	userTypeDescription nvarchar(100)

)

/*inserted statements into userTypes
-sysadmin
-siteadmin(creator)
-admin
-employee
-donor
-volunteer
-user added
*/