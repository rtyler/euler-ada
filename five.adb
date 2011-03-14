--
--  Project Euler problem #5
--
--  2520 is the smallest number that can be divided by each of the numbers from
--  1 to 10 without any remainder.
--
--  What is the smallest positive number that is evenly divisible by all of the
--  numbers from 1 to 20?

with Ada.Text_IO;

use Ada.Text_IO;

procedure Five is
    Valid_Numbers : array (1 .. 20) of Natural;
    --  Stepping up with the highest number we need to be a multiple of
    Step : constant Natural := Valid_Numbers'Last;
    Should_Continue : Boolean := true;
    Value : Natural := 0;

    --  Divisible_By_Set will return early with false as soon as it hits on a
    --  number that is not cleanly divisible (i.e. no remainer)
    function Divisible_By_Set (Number : in Natural) return Boolean is
    begin
        for Item in Valid_Numbers'Range loop
            if (Number mod Item) /= 0 then
                return false;
            end if;
        end loop;
        return true;
    end Divisible_By_Set;
begin
    while Should_Continue loop
        Value := (Value + Step);

        if Divisible_By_Set (Value) then
            Should_Continue := false;
        end if;
    end loop;

    Put_Line (Natural'Image (Value));
end Five;
