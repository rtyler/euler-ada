--
--  Project Euler problem #3
--
--  The prime factors of 13195 are 5, 7, 13 and 29.
--
--  What is the largest prime factor of the number 600851475143 ?

with Ada.Command_Line,
     Ada.Containers.Vectors,
     Ada.Numerics.Elementary_Functions,
     Ada.Text_IO;

use Ada.Containers,
    Ada.Numerics.Elementary_Functions,
    Ada.Text_IO;

procedure Three is
    package CL renames Ada.Command_Line;
    --  For this problem, we need a 64-bit Natural subtype
    subtype Long_Natural is Long_Integer range 0 .. Long_Integer'Last;

    package Bucket is new Ada.Containers.Vectors (Index_Type => Natural,
                                                    Element_Type => Long_Natural);


    --  Return a Vector with all the factors for `Input`
    function Factors_For (Input : in Long_Natural) return Bucket.Vector is
        Result : Bucket.Vector;
        -- Using the "Trial Division" method detailed in this Wikipedia entry:
        -- https://secure.wikimedia.org/wikipedia/en/wiki/Prime_number#Trial_division
        Ceiling : constant Long_Natural := Long_Natural (Sqrt (Float (Input)));
    begin
        for Index in 2 .. Ceiling loop
            if (Input mod Index) = 0 then
                Bucket.Append (Result, Index);
            end if;
        end loop;

        return Result;
    end Factors_For;

begin
    if CL.Argument_Count < 1 then
        Put_Line (">>> Insufficient command line parameters!");
        New_Line;
        Put_Line ("Please execute with: " & CL.Command_Name & " <maxnumber>");
        CL.Set_Exit_Status (CL.Failure);
        return;
    end if;

    declare
        Passed_Number : constant Long_Natural := Long_Natural'Value (CL.Argument (1));
        Factors : constant Bucket.Vector := Factors_For (Passed_Number);
    begin
        Put_Line ("Looking for the largest prime factors for:" & Long_Natural'Image (Passed_Number));
        New_Line;

        for Index in 0 .. Bucket.Last_Index (Factors) loop
            declare
                Factor : constant Long_Natural := Bucket.Element (Factors, Index);
                New_Factors : constant Bucket.Vector := Factors_For (Factor);
            begin
                if Bucket.Length (New_Factors) = 0 then
                    Put_Line (Long_Natural'Image (Factor) & " looks like a prime");
                end if;
            end;
        end loop;
    end;
end Three;
