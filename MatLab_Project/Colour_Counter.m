%-----COLOUR OCCURENCES-----%

colourOccurences = zeros();

colourOccurences(1) = sum(sum(ColourExtractorImage(:,:,1)));
colourOccurences(2) = sum(sum(ColourExtractorImage(:,:,2)));
colourOccurences(3) = sum(sum(ColourExtractorImage(:,:,3)));