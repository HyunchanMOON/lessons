function labelXTicks(labels,rot)
if nargin < 2
    rot = 60;
end
ax = gca;
ax.XTick = 1:numel(labels);
ax.XTickLabel = labels;
ax.XTickLabelRotation = rot;
