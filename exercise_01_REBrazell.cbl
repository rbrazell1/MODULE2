************************************************************************      
000250 IDENTIFICATION DIVISION.
000260 PROGRAM-ID. CIEXERCISE1.  
000270 INSTALLATION. STANDARD CUSTOMER INFORMATION SYSTEM.
000280 DATE-COMPILED. 7/28/2021.
000290*****************************************************************
000320* THIS PROGRAM IS PROPRIETARY TO SYSTEMS AND                    *
000330* SOFTWARE INC.  ANY COPY OR USE OF THIS PROGRAM                *
000340* IS PROHIBITED WITHOUT PERMISSION FROM                         *
000350* SYSTEMS AND SOFTWARE.                                         *
000360*****************************************************************
000370 ENVIRONMENT DIVISION.

000390 CONFIGURATION SECTION.
000400 SPECIAL-NAMES.
000410     CURSOR IS CURSOR-POSITION.
000420     CRT STATUS IS KEY-STATUS.
           CURRENCY SIGN IS $.
000430 INPUT-OUTPUT SECTION.
000440 FILE-CONTROL.


000980 DATA DIVISION.
000990 FILE SECTION.


001530 WORKING-STORAGE SECTION.
       01  CURSOR-POSITION.
           03 C-LINE PIC 9(3).
           03 C-COL PIC 9(3).  
       01  ACCT-COUNT PIC 9(3).
       01  ACCEPT-FIELDS.
           03  ACCT-NO PIC 9(12)V9(3).
           03  TYPE-CODE PIC 9(2).
           88  INVALID-TYPE-CODE VALUES ARE 1, 2, 4.
           03  KIND-CODE PIC 9(3).
           03  DESCRIPTION PIC X(30).
           03  DATE-INPUT PIC 9(8).
           03  BALANCE PIC S9(9)V99 VALUE 0.
       01  DISPLAY-FIELDS.
           03 ACCT-DISPLAY  PIC Z(12).
           03 BALANCE-DISPLAY PIC ZZZ,ZZZ,ZZZ.99-.
       01  TOTAL-BAL PIC 9(13). 
       01  FINAL-TOTAL-BALANCE PIC 9(13).   

002900 PROCEDURE DIVISION.
       DISPLAY WINDOW ERASE. 

       IF ACCT-NO = 99
       MOVE TOTAL-BAL TO BALANCE-DISPLAY
           DISPLAY "BAL SUM: "BALANCE-DISPLAY
           DISPLAY ENTER-FIELDS
           EXIT
       END-IF. 

       PERFORM INPUT-ACCT-INFO-PARA 1 TIMES.
       
       INPUT-ACCT-INFO-PARA.
           DISPLAY "Enter the date MMDDYYYY"
           ACCEPT DATE-INPUT FROM DATE MMDDYYYY
           DISPLAY DATE-INPUT
           DISPLAY "Please enter the ACCT #XXXX-XXXX-XXXX.XXX" 
           ACCEPT ACCT-NO
           DISPLAY "ACCT: "ACCT-NO
           DISPLAY "Please enter a Kind-Code 1 - 100"
           ACCEPT KIND-CODE      
           DISPLAY "KIND CODE: "KIND-CODE
           DISPLAY "Please enter a Type-Code 3 or 5 - 50"
           ACCEPT TYPE-CODE
           DISPLAY "TYPE CODE: "TYPE-CODE
            IF INVALID-TYPE-CODE AND KIND-CODE = 5
                 DISPLAY "INVALID CODE!"
                 GOBACK
            END-IF.         
           DISPLAY "Please enter a description"
           ACCEPT DESCRIPTION.
           DISPLAY "Please enter the new balance"
           ACCEPT BALANCE
           ADD BALANCE TO TOTAL-BAL GIVING FINAL-TOTAL-BALANCE
           DISPLAY FINAL-TOTAL-BALANCE.
       STOP-RUN.

