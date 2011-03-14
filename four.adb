--
--  Project Euler problem #4
--
--  A palindromic number reads the same both ways. The largest palindrome made
--  from the product of two 2-digit numbers is 9009 = 91  99.
--
--  Find the largest palindrome made from the product of two 3-digit numbers.
--

with Ada.Strings.Fixed,
     Ada.Text_IO;

use Ada.Strings.Fixed,
    Ada.Text_IO;

procedure Four is
    Ceiling : constant Natural := 999;

    function Reversed_String (Forward : in String) return String is
        Result : String (Forward'Range);
    begin
        for Index in Result'Range loop
            Result (Index) := Forward ((Forward'Length + 1) - Index);
        end loop;
        return Result;
    end Reversed_String;

    function Is_Palindrome (Input : in Natural) return Boolean is
        Raw_Input_String : constant String := Natural'Image (Input);
        -- Trim the leading space off the stringifyed input
        Input_String : constant String := Raw_Input_String (2 .. Raw_Input_String'Last);
        Length : constant Natural := Input_String'Length;
    begin
        if (Length mod 2) /= 0 then
            return false;
        end if;

        declare
            First_Half : constant String := Head (Input_String, (Length / 2));
            Second_Half : constant String := Reversed_String (Tail (Input_String, (Length / 2)));
        begin
            if First_Half = Second_Half then
                return true;
            end if;
        end;

        return false;
    end Is_Palindrome;

    Highest_Palindrome : Natural := 0;
begin
    for Offset in 0 .. Ceiling loop
        declare
            N : constant Natural := Ceiling - Offset;
        begin
            for Sub_Offset in 0 .. Ceiling loop
                declare
                    J : constant Natural := Ceiling - Sub_Offset;
                    Product : constant Natural := J * N;
                    Bailout : constant Boolean := Is_Palindrome (Product);
                begin
                    if Bailout then
                        if Product > Highest_Palindrome then
                            Highest_Palindrome := Product;
                        end if;
                    end if;
                end;
            end loop;
        end;
    end loop;

    New_Line;
    Put_Line ("Highest:" & Natural'Image(Highest_Palindrome));
end Four;

