--
--  Project Euler problem #10
--
--  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
--
--  Find the sum of all the primes below two million.
--

with Ada.Numerics.Elementary_Functions,
     Ada.Text_IO;

use Ada.Numerics.Elementary_Functions,
    Ada.Text_IO;

procedure Ten is
    subtype Long_Natural is Long_Integer range 0 .. Long_Integer'Last;
    Ceiling : constant Natural := 2_000_000;
    Result : Long_Natural := 0;

    function Is_Prime (Input : in Natural) return Boolean is
        -- Using the "Trial Division" method detailed in this Wikipedia entry:
        -- https://secure.wikimedia.org/wikipedia/en/wiki/Prime_number#Trial_division
        Boundary : constant Natural := Natural (Sqrt (Float (Input)));
    begin
        for Index in 2 .. Boundary loop
            if (Input mod Index) = 0 then
                return false;
            end if;
        end loop;
        return true;
    end Is_Prime;
begin
    for Index in 2 .. Ceiling loop
        if Is_Prime (Index) then
            Result := (Result + Long_Natural (Index));
        end if;
    end loop;
    Put_Line ("Sum of all primes:" & Long_Natural'Image (Result));
end Ten;
