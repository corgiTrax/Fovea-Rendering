<<<<<<< HEAD
function [lhs1] = svisencode (rhs1, rhs2, rhs3)
=======
function [lhs1] = svisencode_mexgen (rhs1, rhs2, rhs3)
>>>>>>> ac558b5382ec91179aee6ad2338a946a1ac7afde
% SVISENCODE    Encode the source image
%
% I=SVISENCODE(C,ROW,COL) encodes the image specified either by
% SVISCODEC or by SVISSETSRC at the fixation point in ROW, COL and
% returns the encoded image in I, using the resolution map specified
% by SVISSETRESMAP.
%
% SEE ALSO: SVISCODEC, SVISSETRESMAP, SVISSETSRC

% Mexgen generated this file on Tue Jun 10 14:13:21 2008
% DO NOT EDIT!

[lhs1] = svismex (5, rhs1, rhs2, rhs3);
