function sphereplot(theta,phi,values)
% SPHEREPLOT plots a graph defined on a sphere
%  sphereplot(theta,phi,values) plots a matrix of values on a sphere

%% version 0.15 20-Aug-2002
%
%    Copyright (C) 1996-2002  Sze M. Tan
%
%    This program is free software; you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation; either version 2 of the License, or
%    (at your option) any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with this program; if not, write to the Free Software
%    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
%
%    Address: Physics Department, The University of Auckland, New Zealand
%    Email: s.tan@auckland.ac.nz

%   Revision history:
%   17-Jan-98   S.M. Tan   Original version
%   01-Jan-99   S.M. Tan   Updated for release
[thetam,phim] = meshgrid(theta,phi);
xx = sin(thetam).*cos(phim);    % spherical coordinate equations
yy = sin(thetam).*sin(phim);
zz = cos(thetam);
r = abs(values); ph = angle(values);
surf(r.*xx,r.*yy,r.*zz,ph);
%surf(xx,yy,zz,values);
axis equal; 
light('position',[-10,-10,10]); lighting phong; material dull;
shading flat; caxis([-pi pi]); colormap(phasemap);
colorbar('vert'); 