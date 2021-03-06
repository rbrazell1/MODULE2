       IDENTIFICATION DIVISION.
       PROGRAM-ID.              PROGRAM2.
       AUTHOR.                  RUSSELL BRAZELL.
       INSTALLATION.            HOME DESKTOP.
       DATE-WRITTEN.            7/26/2021.
       DATE-COMPILED.           7/26/2021.
       SECURITY.                MICROFOCUS

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.         IBM-370.
       OBJECT-COMPUTER.         IBM-370.
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           SELECT INFILE ASSIGN "INPUTFILE.DAT"
           ORGANIZATION IS RECORD SEQUENTIAL.
           SELECT OUTFILE ASSIGN "OUTFILE.DAT".


       DATA DIVISION.
       FILE SECTION.
      *    INPUTFILE INFO 
       FD  INFILE 
       01  INPUT-RECORD
        03 IN-RECORD-TYPE     PIC X.
        03 IN-RECORD-NAME     PIC X(20).
        03 IN-RECORD-DOB      PIC 9(8).
      *    OUTFILE INFO 
       FD  OUTFILE
       01  OUTPUT-RECORD
        03 OUTPUT-NAME        PIC X(20).
        03 OUTPUT-DOB         PIC 9(8).

       WORKING-STORAGE SECTION.
       01  EMPLOYEE-REC-N.
        03 EMPLOYEE-TYPE PIC 9(1).
        03 EMPLOYEE-NAME PIC X(20).
        03 EMPLOYEE-SALARY PIC 9(5)V9(2).
        03 EMPLOYEE-NO PIC 9(6).
        03 EMPLOYEE-LEAVING-DATE.
         05 EMPLOYEE-LEAVE-YEAR PIC 9(4).
         05 EMPLOYEE-LEAVE-MONTH PIC 9(2).
         05 EMPLOYEE-LEAVE-DAY PIC 9(2).
        
       LINKAGE SECTION.

       PROCEDURE DIVISION.
      * MAINLINE SECTION.
      *     DISPLAY "My name is XXXXXX"
      *     GOBACK.
      * MAINLINE SECTION.
      *     MOVE SPACES TO EMPLOYEE-REC-N.
      *     DISPLAY EMPLOYEE-REC-N.
      *     MOVE ZEROS TO EMPLOYEE-REC-N.
      *     DISPLAY EMPLOYEE-REC-N.
      *     MOVE LOW-VALUES TO EMPLOYEE-REC-N.
      *     DISPLAY EMPLOYEE-REC-N.
      *     MOVE HIGH-VALUES TO EMPLOYEE-REC-N.
      *     DISPLAY EMPLOYEE-REC-N.
      *     MOVE ALL "A" TO EMPLOYEE-REC-N.
      *     DISPLAY EMPLOYEE-REC-N.
      *     GOBACK.

       MAINLINE SECTION. 
           OPEN INPUT INFILE.

           OPEN OUTPUT OUTFILE.
      *     OR THIS ADDS A POINTER AT THE END OF THE FILE AND STARTS FROM THERE
      *     OPEN EXTEND OUTFILE.
           READ INFILE AT END MOVE 1 TO WS-END-OF-FILE.
           END-READ.

           MOVE IN-RECORD-NAME TO OUTPUT-NAME.
           MOVE IN-RECORD-DOB TO OUTPUT-DOB.
           WRITE OUTPUT-RECORD.
           
           CLOSE INFILE OUTFILE.

