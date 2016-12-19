/*============================
Description: This script is used to generate the privilidgesTable table and add the corresponding columns.

Author: Bailey Strum

Date: 11/30/16  --- 3:13pm

Change History:

==============================*/

CREATE TABLE privilidgesTable
(
	privilidgesID int NOT NULL PRIMARY KEY, /*primary key*/
	privilidgesDescription nvarchar(150),
)

/*the privilidges that will be assigned to certain roles and defain their ability to CRUD in general
-can edit profiles
-can update inventory
-can invite donor
-can invite volunteer
-edit roles
-send receipts
-distribute inventory
-view sensetive user data
-edit events
*/