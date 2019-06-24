function[value] = IsElement(scaler, vector)
    VecNM = size(vector);
    rows = VecNM(1,1);
    cols = VecNM(1,2);
    value = 0;
    for er = 1:rows
        for ec = 1:cols
            if vector(er,ec) == scaler 
                value = 1;
            end
        end
    end
end