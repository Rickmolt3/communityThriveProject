/*============================
Description: This script is used to update the ctRecipientDonationTracking info and add the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 4:00pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_UpdateRecipientDonationTracking
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

		UPDATE ctRecipientDonationTracking
		Set @donationTrackingID = donationTrackingID, @recipientID = recipientID, @donationDate = donationDate, @eventsID = eventsID, @stockID = stockID
		WHERE @donationTrackingID = donationTrackingiD


	END TRY
	BEGIN CATCH 

		SELECT @v_error = ERROR_MESSAGE()
		SELECT @v_errorNo = ERROR_NUMBER()

		RAISERROR('Database error occured %s',16,1,@v_error)
		RETURN -20000

	END CATCH
END
GO