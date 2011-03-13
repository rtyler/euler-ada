--
--  Project Euler problem #1
--

with Ada.Containers.Vectors,
        Ada.Command_Line,
        Ada.Text_IO;

use Ada.Containers,
    Ada.Text_IO;

procedure One is
    package CL renames Ada.Command_Line;
    package Bucket is new Ada.Containers.Vectors (Index_Type => Natural,
                                                Element_Type => Natural);
    --
    --  Print out multiples of 3 and 5 from 0 to the `Upper`
    function Multiples (Upper : in Natural) return Bucket.Vector is
        Numbers : Bucket.Vector;
    begin
        -- Non-inclusive
        for Index in 1 .. (Upper - 1) loop
            if (Index mod 3) = 0 then
                Bucket.Append (Numbers, Index);
            elsif (Index mod 5) = 0 then
                Bucket.Append (Numbers, Index);
            end if;
        end loop;
        return Numbers;
    end Multiples;
begin
    if CL.Argument_Count < 1 then
        Put_Line (">>> Insufficient command line parameters!");
        New_Line;
        Put_Line ("Please execute with: " & CL.Command_Name & " <maxnumber>");
        CL.Set_Exit_Status (CL.Failure);
        return;
    end if;

    declare
        Upper_Bound : constant Natural := Natural'Value (Ada.Command_Line.Argument (1));
        Valid_Numbers : constant Bucket.Vector := Multiples (Upper_Bound);
        Result : Natural := 0;
    begin
        for Index in 0 .. Bucket.Last_Index (Valid_Numbers) loop
            declare
                Value : constant Natural := Bucket.Element (Valid_Numbers, Integer (Index));
            begin
                Result := (Result + Value);
            end;
        end loop;

        Put_Line (Natural'Image (Result));
    end;
end One;
