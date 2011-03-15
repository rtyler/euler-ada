--
--  Project Euler problem #9
--
--  A Pythagorean triplet is a set of three natural numbers, a < b < c, for
--  which,
--
--      a^2 + b^2 = c^2
--
--  For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
--
--  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
--  Find the product abc.


with Ada.Numerics.Elementary_Functions,
     Ada.Text_IO;

use Ada.Numerics.Elementary_Functions,
    Ada.Text_IO;

procedure Nine is
    Ceiling : constant Natural := 1000;
    C : natural := 0;

    function Is_Perfect_Square (Input : in Float) return Boolean is
    begin
        if Input = Float'Floor (Input) then
            return true;
        end if;
        return false;
    end Is_Perfect_Square;

    function Is_Correct_Triplet (A, B, C : in Natural) return Boolean is
    begin
        if (A + B + C) /= 1000 then
            return false;
        end if;

        if (A < B) and (B < C) then
            return true;
        end if;

        return false;
    end Is_Correct_Triplet;

begin
    for A in 1 .. Ceiling loop
        for B in 1 .. Ceiling loop
            declare
                C_Squared : constant Natural := (A ** 2) + (B ** 2);
                C : constant Float := Sqrt (Float(C_Squared));
            begin
                if Is_Perfect_Square (C) and Is_Correct_Triplet (A, B, Natural (C)) then
                    Put (" A:" & Natural'Image (A));
                    Put (" B:" & Natural'Image (B));
                    Put (" C:" & Natural'Image (Natural (C)));
                    New_Line;
                    Put_Line ("A * B * C =" & Natural'Image (A * B * Natural (C)));
                end if;
            end;
        end loop;
    end loop;
end Nine;
