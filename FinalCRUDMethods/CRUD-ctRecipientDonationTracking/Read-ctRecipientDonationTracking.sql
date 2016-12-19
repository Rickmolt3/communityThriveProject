/*============================
Description: This script is used to read the ctRecipientDonationTracking info and read the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 4:00pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_ReadRecipientDonationTracking
	
	@donationTrackingID int,
	@recipientID int,
	@donationDate datetime,
	@eventsID int,
	@stockID int
AS
BEGIN 
	SET NOCOUNT ON;

	DECLARE @v_error VARCHAR(255),
	@v_errorNo INT

	BEGIN TRY

		SELECT  donationTrackingID,recipientID,donationDate,eventsID,stockID
		FROM ctRecipientDonationTracking
		WHERE @donationTrackingID = donationTrackingID

	END TRY
	BEGIN CATCH 

		SELECT @v_error = ERROR_MESSAGE()
		SELECT @v_errorNo = ERROR_NUMBER()

		RAISERROR('Database error occured %s',16,1,@v_error)
		RETURN -20000

	END CATCH
END
GO