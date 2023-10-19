#!/usr/bin/perl
use strict;
use warnings;

# Target directory where XML files will be created
my $targetDir = "/c/Program Files/Common Files/Native Instruments/Service Center";

# Error message and exit if target directory doesn't exist
unless (-d $targetDir) {
    die "Error: The target directory $targetDir does not exist. Please create it and try again.\n";
}

# Using the external 'find' command to get all .nicnt files
my @files = split "\n", `find . -type f -name '*.nicnt'`;
my $counter = 0; # Initialize a counter

# Process each .nicnt file
for my $file (@files) {
    $counter++; # Increment the counter for each file found
    print "\rScanned items: $counter"; # Print the counter value
    
    print "\nProcessing .nicnt file: $file\n";

    my $dir;
    if ($file =~ /^(.*\/)/) {
        $dir = $1;
    }

    if (-e "$dir/wallpaper.png") {
        print "Found wallpaper.png in $dir\n";

        # Get the filename without path and extension
        my ($filenameNoExt) = $file =~ /\/([^\/]+)\.nicnt$/i;

        # Open the .nicnt file and read the content
        open my $nicnt, '<', $file or die "Could not open file '$file': $!\n";
        my $content = do { local $/; <$nicnt> };
        close $nicnt;

        # Extract XML content after <?xml
        if ($content =~ /(<\?xml[\s\S]*)/i) {
            my $xmlContent = $1;

            # Create a new XML file in the target directory and write the XML content to it
            my $xmlFile = "$targetDir/$filenameNoExt.xml";
            open my $xml, '>', $xmlFile or die "Could not open file '$xmlFile': $!\n";
            print $xml $xmlContent;
            close $xml;

            print "XML content from $file has been written to $xmlFile\n";
        } else {
            print "No XML content found in $file\n";
        }
    } else {
        print "No wallpaper.png found in $dir. Skipping...\n";
    }
}

print "\nScanning completed.\n"; # Indicates the end of scanning
