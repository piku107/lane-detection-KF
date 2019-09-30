function [t,TrackID] = createNewTrack(TrackID, measurements, initalP)
%CREATENEWTRACK Creates a new track from class Track

TrackID = TrackID + 1;
t = Track(TrackID);
t.x = measurements;
t.P = initalP;
t.measurement = measurements;
t.status = 'i';
t.trackScore = 2;
end

