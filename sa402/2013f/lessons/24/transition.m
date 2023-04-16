% transition()
% Returns transition probability matrix for Monopoly.
% - Ignores "double roll" rules
% - Players leave jail on the first turn
%   ("Go to Jail" just moves a player's position)
%
function P = transition()

% Monopoly board positions, in order
% 1 = Go
% 2 = Mediterranean Avenue
% 3 = Community Chest 1
% 4 = Baltic Avenue
% 5 = Income Tax (pay $200)
% 6 = Reading Railroad
% 7 = Oriental Avenue
% 8 = Chance 1
% 9 = Vermont Avenue
% 10 = Connecticut Avenue
% 11 = Jail (we use this as visiting jail)
% 12 = St. Charles Place
% 13 = Electric Company
% 14 = States Avenue
% 15 = Virginia Avenue
% 16 = Pennsylvania Railroad
% 17 = St. James Place
% 18 = Community Chest 2
% 19 = Tennessee Avenue
% 20 = New York Avenue
% 21 = Free Parking
% 22 = Kentucky Avenue
% 23 = Chance 2 
% 24 = Indiana Avenue
% 25 = Illinois Avenue
% 26 = B&O Railroad
% 27 = Atlantic Avenue
% 28 = Ventnor Avenue
% 29 = Water Works
% 30 = Marvin Gardens
% 31 = Go to Jail (we use this as being in jail)
% 32 = Pacific Avenue
% 33 = North Carolina Avenue
% 34 = Community Chest 3
% 35 = Pennsylvania Avenue
% 36 = Short Line
% 37 = Chance 3
% 38 = Park Place
% 39 = Luxury Tax (pay $100)
% 40 = Boardwalk

% Move probabilities
% 1 -> 0
% 2 -> 1/36
% 3 -> 2/36
% 4 -> 3/36
% 5 -> 4/36
% 6 -> 5/36
% 7 -> 6/36
% 8 -> 5/36
% 9 -> 4/36
% 10 -> 3/36
% 11 -> 2/36
% 12 -> 1/36
roll_prob = [0, 1/36, 2/36, 3/36, 4/36, 5/36, 6/36, 5/36, 4/36, 3/36, 2/36, 1/36];

% We're going to ignore the "double roll" rules
% State space = board positions

% Form transition probability matrix
% Initialize all probabilities to 0
P = zeros(40, 40);

% Compute base transition probabilities
for last = 1 : 40
    for roll = 2 : 12
        
        % Next board position
        % If last = 31, need to do this separately
        if (last == 31)
            next = 11 + roll;
        else
            next = last + roll;
            if (next > 40)
                next = next - 40;
            end
        end
        
        P(last, next) = roll_prob(roll);
        
    end
end

% Now adjust for Chance and Community Chest positions
for last = 1 : 40
    for roll = 2 : 12

        % Next board position
        % If last = 31, need to do this separately
        if (last == 31)
            next = 11 + roll;
        else
            next = last + roll;
            if (next > 40)
                next = next - 40;
            end
        end
        
        % If the next board position is Chance 1
        if (next == 8)
            P(last, 1) = P(last, 1) + (1/16)*roll_prob(roll);     % 1 = Go
            P(last, 5) = P(last, 5) + (1/16)*roll_prob(roll);     % 5 = 3 spaces back
            P(last, 6) = P(last, 6) + (1/16)*roll_prob(roll);     % 6 = Reading
            P(last, 12) = P(last, 12) + (1/16)*roll_prob(roll);   % 12 = St. Charles
            P(last, 13) = P(last, 13) + (1/16)*roll_prob(roll);   % 13 = Elec, nearest utility
            P(last, 16) = P(last, 16) + (1/16)*roll_prob(roll);   % 16 = PennR, nearest railroad
            P(last, 25) = P(last, 25) + (1/16)*roll_prob(roll);   % 25 = Illinois
            P(last, 31) = P(last, 31) + (1/16)*roll_prob(roll);   % 31 = Go to Jail
            P(last, 40) = P(last, 40) + (1/16)*roll_prob(roll);   % 40 = Boardwalk
            P(last, next) = (7/16)*roll_prob(roll);
            
        % If the next board position is Chance 2
        elseif (next == 23)
            P(last, 1) = P(last, 1) + (1/16)*roll_prob(roll);     % 1 = Go
            P(last, 6) = P(last, 6) + (1/16)*roll_prob(roll);     % 6 = Reading
            P(last, 12) = P(last, 12) + (1/16)*roll_prob(roll);   % 12 = St. Charles
            P(last, 20) = P(last, 20) + (1/16)*roll_prob(roll);   % 20 = 3 spaces back
            P(last, 25) = P(last, 25) + (1/16)*roll_prob(roll);   % 25 = Illinois
            P(last, 26) = P(last, 26) + (1/16)*roll_prob(roll);   % 26 = B&O, nearest railroad
            P(last, 29) = P(last, 29) + (1/16)*roll_prob(roll);   % 29 = WW, nearest utility
            P(last, 31) = P(last, 31) + (1/16)*roll_prob(roll);   % 31 = Go to Jail
            P(last, 40) = P(last, 40) + (1/16)*roll_prob(roll);   % 40 = Boardwalk
            P(last, next) = (7/16)*roll_prob(roll);
            
        % If the next board position is Chance 3
        elseif (next == 37)
            P(last, 1) = P(last, 1) + (1/16)*roll_prob(roll);     % 1 = Go
            P(last, 6) = P(last, 6) + (2/16)*roll_prob(roll);     % 6 = Reading + nearest railroad
            P(last, 12) = P(last, 12) + (1/16)*roll_prob(roll);   % 12 = St. Charles
            P(last, 13) = P(last, 13) + (1/16)*roll_prob(roll);   % 13 = Elec, nearest utility
            P(last, 25) = P(last, 25) + (1/16)*roll_prob(roll);   % 25 = Illinois
            P(last, 31) = P(last, 31) + (1/16)*roll_prob(roll);   % 31 = Go to Jail
            P(last, 34) = P(last, 34) + (1/16)*roll_prob(roll);   % 34 = 3 spaces back
            P(last, 40) = P(last, 40) + (1/16)*roll_prob(roll);   % 40 = Boardwalk
            P(last, next) = (7/16)*roll_prob(roll);
            
        % If the next board is Community Chest (any one)
        elseif ( (next == 3) || (next == 18) || (next == 34) )
            P(last, 1) = P(last, 1) + (1/16)*roll_prob(roll);     % 1 = Go
            P(last, 31) = P(last, 31) + (1/16)*roll_prob(roll);   % 31 = Go to Jail
            P(last, next) = (14/16)*roll_prob(roll);
        end
        
    end
end

end