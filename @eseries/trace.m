function result = trace(es)
% ESERIES/TRACE calculates trace of an exponential series
% result = trace(es)

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

%   Copyright (c) 1996-97 by S.M. Tan
%   Revision history:
%   06-Jan-99   S.M. Tan   Initial release
nt = nterms(es);
s=es.s; es=struct(es.qobase); es.s=s;
temp = sparse(1,nt);
for k = 1:nt
   temp(k) = sum(diag(reshape(es.data(:,k),es.shape)));
end
es.data = temp;
es.dims = {[1],[1]}; es.shape = [1,1];
result = estidy(eseries(qo(es),es.s));
