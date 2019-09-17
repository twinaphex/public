; Error codes in F-BASIC Manual Appendix 5  (Page 20 in Appendix)

FBASIC_ERROR_BAD_FILE_MODE			EQU		51

FBASIC_ERROR_DEVICE_IO_ERROR		EQU		53
FBASIC_ERROR_FILE_NOT_FOUND			EQU		63
FBASIC_ERROR_FILE_ALREADY_EXISTS	EQU		64
FBASIC_ERROR_DIRECTORY_FULL			EQU		65
FBASIC_ERROR_DISK_FULL				EQU		67
FBASIC_ERROR_BAD_FILE_STRUCTURE		EQU		71
FBASIC_ERROR_DRIVE_NOT_READY		EQU		72
FBASIC_ERROR_DISK_WRITE_PROTECTED	EQU		73


; Input
;   A BIOS Error code
; Output
;   A F-BASIC Error code
FSYS_FILE_BIOSERROR_TO_FBASICERROR
					TSTA
					BEQ		FSYS_FILE_BIOSERROR_TO_FBASICERROR_EXIT
					CMPA	#BIOSERR_DISK_NOTREADY
					BEQ		FSYS_FILE_BIOSERROR_TO_FBASICERROR_NOTREADY
					CMPA	#BIOSERR_DISK_WRITEPROTECTED
					BEQ		FSYS_FILE_BIOSERROR_TO_FBASICERROR_WRITEPROTECTED
					LDA		#FBASIC_ERROR_DEVICE_IO_ERROR
					RTS

FSYS_FILE_BIOSERROR_TO_FBASICERROR_NOTREADY
					LDA		#FBASIC_ERROR_DRIVE_NOT_READY
					RTS

FSYS_FILE_BIOSERROR_TO_FBASICERROR_WRITEPROTECTED
					LDA		#FBASIC_ERROR_DISK_WRITE_PROTECTED
					RTS

FSYS_FILE_BIOSERROR_TO_FBASICERROR_EXIT
					RTS

