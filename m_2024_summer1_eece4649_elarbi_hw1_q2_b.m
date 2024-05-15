% X-ray Attenuation through Tissue with Bone
% This script calculates and visualizes the attenuation of X-rays as they pass through
% a 10 cm thick tissue sample containing a 3 cm diameter bone.
%
% Author: Muhammad Elarbi
% Email: elarbi.m@northeastern.edu
% Date Created: May 13, 2024
% Last Modified: May 14, 2024
% Course: EECE 4649: Biomedical Imaging
% Instructor: Charles A. DiMarzio
%
% Usage:
% This script models the attenuation of X-ray beams through a tissue sample with an embedded bone.
% Run the script in MATLAB to view the output in the Command Window.

% Define parameters
tissue_thickness = 10; % cm
bone_diameter = 3; % cm
soft_tissue_mu = 5.7028; % cm^-1
bone_mu = 54.7392; % cm^-1
I0 = 1; % Initial intensity (assumed to be 1 for simplicity)

% Create x positions from 0 to 10 cm
x = linspace(0, tissue_thickness, 1000);

% Initialize attenuation array
attenuation = zeros(size(x));

% Calculate attenuation for each position
for i = 1:length(x)
    if x(i) >= (tissue_thickness - bone_diameter) / 2 && x(i) <= (tissue_thickness + bone_diameter) / 2
        % Passes through bone
        attenuation(i) = I0 * exp(-bone_mu * bone_diameter - soft_tissue_mu * (tissue_thickness - bone_diameter));
    else
        % Passes through soft tissue only
        attenuation(i) = I0 * exp(-soft_tissue_mu * tissue_thickness);
    end
end

% Plot the result
figure;
imagesc(x, [0 1], attenuation);
colormap('gray');
colorbar;
xlabel('Position (cm)');
ylabel('Intensity');
title('X-ray Attenuation through Tissue with Bone');
