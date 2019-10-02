%-----EXTRACT AND RENAME DATASET-----%

% skips extraction if tar gz file not found or dataset already exists
if isfile('cifar-10-matlab.tar.gz')
    if isfolder('dataset')
    else
        % extract cifar-10 dataset
        % requires "cifar-10-matlab.tar.gz" in root directory
        untar('cifar-10-matlab', '');

        % rename extracted folder to "dataset" for future reference
        movefile cifar-10-batches-mat dataset;
    end
end