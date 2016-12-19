/*============================
Description: This script is used to generate the rolePrivilidges table and add the corresponding columns.

Author: Bailey Strum

Date: 11/30/16  --- 2:04pm

Change History:

==============================*/

CREATE TABLE rolePrivilidges
(
	roleFK int FOREIGN KEY REFERENCES rolesTable(rolesID), /*foreign key*/
	privilidgeFK int FOREIGN KEY REFERENCES privilidgesTable(privilidgesID), /*foreign key*/

)

