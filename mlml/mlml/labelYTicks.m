function labelYTicks(labels,rot)
if nargin < 2
    rot = 0;
end
ax = gca;
ax.YTick = 1:numel(labels);
ax.YTickLabel = labels;
ax.YTickLabelRotation = rot;
