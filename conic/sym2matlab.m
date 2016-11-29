function c = sym2matlab(c)
% Convert symbolic expression containing matrix entries into MatLab.
%
% See also: symm

% Copyright 2010 Levente Hunyadi

greek = {
    'alpha', ...
    'beta', ...
    'gamma', ...
    'delta', ...
    'epsilon', ...
    'varepsilon', ...
    'zeta', ...
    'eta', ...
    'theta', ...
    'vartheta', ...
    'iota', ...
    'kappa', ...
    'lambda', ...
    'mu', ...
    'nu', ...
    'xi', ...
    'pi', ...
    'varpi', ...
    'rho', ...
    'varrho', ...
    'sigma', ...
    'varsigma', ...
    'tau', ...
    'upsilon', ...
    'phi', ...
    'varphi', ...
    'chi', ...
    'psi', ...
    'omega' ...
};
idpattern = ['([A-Za-z]|' strjoin('|', greek) ')'];

c = char(c);
c = regexprep(c, [idpattern '_(\d+)_(\d+)'], '$1($2,$3)');  % A_23_1 --> A(23,1)
c = regexprep(c, [idpattern '_(\d+)'], '$1($2)');  % b_10 --> b(10)
c = regexprep(c, [idpattern '(\d)(\d)(?!\d)'], '$1($2,$3)');  % A23 --> A(2,3)
c = regexprep(c, [idpattern '(\d)(?!\d)'], '$1($2)');  % b1 --> b(1)
