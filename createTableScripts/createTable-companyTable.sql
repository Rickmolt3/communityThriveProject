/*============================
Description: This script is used to generate the companyTable table and add the corresponding columns.

Author: Bailey Strum

Date: 11/30/16  --- 3:12pm

Change History:

==============================*/

CREATE TABLE companyTable
(
	companyID int NOT NULL PRIMARY KEY IDENTITY(1,1), /*primary key*/
	companyName nvarchar(150) NOT NULL,
	companyDescription nvarchar(250),
	companyLocation nvarchar(150)NOT NULL,
	companyDemographic nvarchar(150)NOT NULL


)