function [SI] = formatScanImageTiffMetadata(metadata)
%FORMATSCANIMAGETIFFMETADATA Cleans up ScanImage Tiff metadata
%   Processes ScanImage Tiff metadata and converts into a structure
%   datatype which makes it easy to pull out relevant metadata.
%
% Dinesh Natesan

arguments (Input)
    metadata
end

arguments (Output)
    SI
end


% extract RoiGroups
roi_ind = regexp(metadata,'{\n  "RoiGroups"');
roi_str = metadata(roi_ind:end);

% fix minor errors in strings
meta_str = metadata(1:roi_ind-1);
meta_str = replace(meta_str,'scanimage.types.BeamAdjustTypes.None',"'scanimage.types.BeamAdjustTypes.None'");
evalc(meta_str);

% Add ROIs back to metadata
roi = jsondecode(roi_str);
SI.RoiGroups = roi.RoiGroups;

end