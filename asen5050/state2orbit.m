function elements = state2orbit(R,V,mu)
% DESCRIPTION
% INPUTS
%   R = position vector (X,Y,Z) [km]
%   V = velocity vector (Vx,Vy,Vz) [km]
%   mu = gravitational parameter [km^3/s^2]
% OUTPUTS
%   elements = a struct containing the following orbital characteristics:
%       a = semimajor axis [km]
%       e = eccentricity
%       i = inclination [rad]
%       Omega = right ascension of ascending node [rad]
%       omega = argument of periapsis [rad]
%       theta = true anomaly [rad]
%       mean = mean anomaly [rad]
%       ecc = eccentric anomaly [rad]
%       t_p = time past periapsis [s]
%       T = orbital period [s]
%       p = semilatus rectum 
%       alt_max = maximum altitude above surface [km]
%       alt_min = minimum altitude above surface [km]
%       energy = specific energy per unit mass of satellite
%       hx = x component of specific angular momentum vector
%       hy = y component of specific angular momentum vector
%       hz = z component of specific angular momentum vector
%       h = magnitude of specific angular momentum vector
%       phi_fpa = flight path angle [rad]
%       r = magnitude of position vector
%       v = magnitude of velocity vector
% USAGE
%   elements = state2elms(R,V)

if (length(R) ~= 3 || length(V) ~= 3)
    printf('ERROR: Inputs need to be vectors of length 3!\n');
end

% Earth radius
%%%%%%%% TODO %%%%%%%%%
% Add support for altitude above other central bodies
RE = 6378;      % [km]

% Calculate distance and speed
r = norm(R);
v = norm(V);
% Calculate radial velocity and specific angular momentum
v_r = dot(R,V) / r;
H = cross(R,V);
h = norm(H);
hx = H(1);  hy = H(2);  hz = H(3);
% Calculate inclination
i = acos(H(3)/h);
% Calculate node line
N = cross([0 0 1],H);
Nmag = norm(N);
% Calculate right ascension of ascending node
if (N(2) >= 0)
    Omega = acos(N(1)/Nmag);
else
    Omega = 2*pi - acos(N(1)/Nmag);
end
% Calculate eccentricity
E = (1/mu)*(cross(V,H) - (mu/r)*R);
e = norm(E);
% Calculate argument of perigee
if (E(3) >= 0)
    omega = acos(dot(N,E)/(Nmag*e));
else
    omega = 2*pi - acos(dot(N,E)/(Nmag*e));
end
% Calculate true anomaly
if (v_r >= 0)
    theta = acos(dot(E/e,R/r));
else
    theta = 2*pi - acos(dot(E/e,R/r));
end
% Calculate other anomalies and time past periapsis
[~,ecc,mean,t_p]=anomalies(true,'true',a,e,mu);

% Calculate energy per unit mass
energy = v^2/2 - mu/r;
% Calculate semimajor axis, orbital period, and semilatus rectum
p = h^2/mu;         % semilatus rectum [km]
a = p/(1-e^2);      % semimajor axis [km]
T = 2*pi*sqrt(a^3/mu);      % orbital period [s]
% Calculate flight path angle
cos_phi = h/(r*v);
if (true > pi)
    phi_fpa = -acos(cos_phi);
else
    phi_fpa = acos(cos_phi);
end

end

