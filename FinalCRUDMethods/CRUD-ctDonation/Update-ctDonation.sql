/*============================
Description: This script is used to update the ctDonation info and add the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 2:04pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_UpdateDonation
	@donationID int,
	@userID int,
	@dateSubmitted datetime,
	@describe nvarchar(max),
	@notes nvarchar(max),
	@eventID int
	

AS
BEGIN 
	SET NOCOUNT ON;

	DECLARE @v_error VARCHAR(255),
	@v_errorNo INT

	BEGIN TRY

		UPDATE ctDonation
		SET @donationID = donationID, @userID = userID, @dateSubmitted = dateSubmitted, @describe = describe, @notes = notes, @eventID = eventID
		WHERE @donationID = donationID 

	END TRY
	BEGIN CATCH 

		SELECT @v_error = ERROR_MESSAGE()
		SELECT @v_errorNo = ERROR_NUMBER()

		RAISERROR('Database error occured %s',16,1,@v_error)
		RETURN -20000

	END CATCH
END
GO