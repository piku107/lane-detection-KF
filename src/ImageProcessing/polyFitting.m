function lane = polyFitting(L)
%POLYFITTING iterates over labeled pixels and fits polynomials to it

lane=[];
lane_id = 1;
for i=1:max(max(L))
    
    [r, c] = find(L==i);
    [r,i_sort] = sort(r);
    c = c(i_sort);
    
    if size(r,1) > 80 % only if set is large enough
        
        
        if size(r,1) > 1800
            [p_1, p_2, r_1, r_2, error_1, error_2, succ] = fitTwoPolynomials(r,c);
            
            
            [v_min,v_i] = min(error_1 + error_2);
            
            
            if succ
                % if curvature difference is large
                % create two lanes
                if abs(p_1{v_i}(2)-p_2{v_i}(2))>30000.5
                    
                    
                    lane{lane_id}.p= p_2{v_i};
                    lane{lane_id}.r = r_2{v_i};
                    lane_id = lane_id + 1;
                    
                else %create one lane
                    p = polyfit(r,c,2);
                    lane{lane_id}.p= p;
                    lane{lane_id}.r = r;
                    lane_id = lane_id + 1;
                end
            else % for the second lane
                p = polyfit(r,c,2);
                lane{lane_id}.p= p;
                lane{lane_id}.r = r;
                lane_id = lane_id + 1;
            end
        else
            p = polyfit(r,c,2);
            lane{lane_id}.p= p;
            lane{lane_id}.r = r;
            lane_id = lane_id + 1;
        end
    end
end
end

