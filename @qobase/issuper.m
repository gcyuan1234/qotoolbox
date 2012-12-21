function result = issuper(L,rflag)
% QO/ISSUPER Determines if a quantum object can be a superoperator
% issuper(q) is non-zero if q can be a superoperator
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
%   11-Jan-98   S.M. Tan   Implemented for Matlab 5

result = iscell(L.dims{1});
if nargin==1,
	if result, 
   	result = result & isequal(L.dims{1},L.dims{2}) & isequal(L.dims{1}{1},L.dims{1}{2}); 
   end
elseif ~strcmp(rflag,'rect')
   error('Unknown option. Only valid option is ''rect''.');
end
