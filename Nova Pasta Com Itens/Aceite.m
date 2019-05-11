function [ Flag ] = Aceite( DeltaE, tk )

if rand <= exp(-DeltaE/tk) %rand menor que a exp aceita
    Flag = 1;
else
    Flag = 0;
end

end

