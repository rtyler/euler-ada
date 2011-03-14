--
--  Project Euler problem #7
--
--  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
--  that the 6th prime is 13.
--
--  What is the 10001st prime number?
--

with Ada.Numerics.Elementary_Functions,
     Ada.Text_IO;

use Ada.Numerics.Elementary_Functions,
    Ada.Text_IO;

procedure Seven is

    function Is_Prime (Input : in Natural) return Boolean is
        -- Using the "Trial Division" method detailed in this Wikipedia entry:
        -- https://secure.wikimedia.org/wikipedia/en/wiki/Prime_number#Trial_division
        Ceiling : constant Natural := Natural (Sqrt (Float (Input)));
    begin
        for Index in 2 .. Ceiling loop
            if (Input mod Index) = 0 then
                return false;
            end if;
        end loop;
        return true;
    end Is_Prime;

    Count : Natural := 0;
begin
    for N in 2 .. Natural'Last loop
        if Is_Prime (N) then
            Count := (Count + 1);

            if Count = 10_001 then
                Put_Line (Natural'Image (N) & " is prime");
                return;
            end if;
        end if;
    end loop;
end Seven;
