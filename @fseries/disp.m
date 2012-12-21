function disp(f)
% FSERIES/DISP Display method for function series

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
%   30-Dec-98   S.M. Tan   Modified as class of qobase
if isempty(f.ftype)
   fprintf('Zero function series.\n');
   dispdims(dims(f.qobase));
else
   fprintf('Function series: %d term(s).\n',prod(size(f.ftype)));
   dispdims(dims(f.qobase));
   for k = 1:length(f.ftype)
      fprintf('\n');
      disp(['Function {' num2str(k) '}, Type   : ' num2str(f.ftype(k)) ', Params : ' num2str(f.fparam{k})]);
      if all(shape(f.qobase)<10)
         disp(full(double(qo(f.qobase{k}))));
		else         
         disp(double(qo(f.qobase{k})));
      end
   end
end

function dispdims(qdims)   
fprintf('Hilbert space dimensions ');
if ~iscell(qdims{1})
   fprintf('[ ');
   fprintf('%d ',qdims{1}); fprintf('] by [ ');
   fprintf('%d ',qdims{2}); fprintf('].\n');
else
   fprintf('([ ');
   fprintf('%d ',qdims{1}{1}); fprintf('] by [ ');
   fprintf('%d ',qdims{1}{2}); fprintf(']) by ');
   fprintf('([ ');
   fprintf('%d ',qdims{2}{1}); fprintf('] by [ ');
   fprintf('%d ',qdims{2}{2}); fprintf(']).\n');
end
