function [true,ecc,mean,time] = anomalies(value,unit,a,e,mu)
% Given the value of true anomaly, eccentric anomaly, mean anomaly, or time
% (including its unit) return the vector of all four values given the
% semimajor axis, eccentricity, and gravitational parameter of the orbit.
% INPUTS
%   value = the decimal value of one of the anomalies or time past
%   periapsis in degrees or seconds, respectively
%   unit = 'true', 'ecc', 'mean', or 'time' to indicate which of the four
%   possible inputs is being used
%   a = the semimajor axis of the orbit in kilometers
%   e = the eccentricity of the orbit
%   mu = the gravitational parameter of the central body in km^3/s^2
% OUTPUTS
%   true = true anomaly [deg]
%   ecc = eccentric anomaly [deg]
%   mean = mean anomaly [deg]
%   time = time past periapsis [s]
% USAGE
%   [true,ecc,mean,time]=anomalies(25,'true',15000,0.1,398600.44)

if (strcmp(unit,'true'))
    % Given true anomaly
    true = value;
    
elseif (strcmp(unit,'ecc'))
    % Given eccentric anomaly
elseif (strcmp(unit,'mean'))
    % Given mean anomaly
elseif (strcmp(unit,'time'))
    % Given time past periapsis
end



end

