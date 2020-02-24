function out = mynomalize(in)
in_range = max(in) - min(in);
out = (in -min(in)) ./ in_range;