--
--  Project Euler problem #6
--
--  The sum of the squares of the first ten natural numbers is,
--
--      1^2 + 2^2 + ... + 10^2 = 385
--
--  The square of the sum of the first ten natural numbers is,
--
--      (1 + 2 + ... + 10)^2 = 55^2 = 3025
--
--  Hence the difference between the sum of the squares of the first ten
--  natural numbers and the square of the sum is 3025  385 = 2640.
--
--  Find the difference between the sum of the squares of the first one hundred
--  natural numbers and the square of the sum.


with Ada.Text_IO;

use Ada.Text_IO;

procedure Six is
    Ceiling : constant Natural := 100;

    function Sum_Of_Squares (Upper_Bound : in Natural) return Natural is
        Result : Natural := 0;
    begin
        for Step in 1 .. Upper_Bound loop
            Result := (Result + (Step ** 2));
        end loop;
        return Result;
    end Sum_Of_Squares;

    function Square_Of_Sums (Upper_Bound : in Natural) return Natural is
        Result : Natural := 0;
    begin
        for Step in 1 .. Upper_Bound loop
            Result := (Result + Step);
        end loop;
        return Result ** 2;
    end Square_Of_Sums;
begin
    declare
        Left : constant Natural := Sum_Of_Squares (Ceiling);
        Right : constant Natural := Square_Of_Sums (Ceiling);
    begin
        Put_Line ("Sum of squares:" & Natural'Image (Left));
        Put_Line ("Square of sums:" & Natural'Image (Right));
        New_Line;
        Put_Line ("Difference:" & Natural'Image (Right - Left));
    end;
end Six;
