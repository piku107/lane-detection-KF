classdef Track
    %TRACK represents a track
   
    properties
        x
        P
        status
        trackScore
        id
        filtered
        predicted
        measurement
    end
    
    methods
        function obj = Track(TrackID)
            obj.id = TrackID;
            obj.filtered = 0;
            obj.predicted = 0;
        end
        function obj = set.trackScore(obj,newTrackScore)
            if newTrackScore > 80 % max track score
                obj.trackScore = 80;
            else
                obj.trackScore = newTrackScore;
            end
            
        end % set.trackScore
    end
    
end

