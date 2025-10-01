function expand_pdf_width --description "Expand PDF width and save in place"
    # Check input
    if test (count $argv) -lt 1 -o (count $argv) -gt 2
        echo "Usage: expand_pdf_width <input-pdf> [extra-width]"
        echo "Default extra width is 360 units (~12.7 cm)"
        return 1
    end

    set infile $argv[1]
    set basename (basename $infile .pdf)
    set dir (dirname $infile)
    set filename (basename $infile .pdf)
    set infile "$dir/$filename.pdf"
    set bakfile "$dir/.$filename.bak.pdf"
    set outfile $infile

    # Extra width (default 360, or user specified)
    if test (count $argv) -eq 2
        set extra $argv[2]
    else
        set extra 360   # ~12.7 cm
    end

    # Get original PDF dimensions first
    set w (pdfinfo -box $infile | awk '/Page size:/ {print $3; exit}')
    set h (pdfinfo -box $infile | awk '/Page size:/ {print $5; exit}')

    # Check if dimensions were parsed correctly
    if test -z "$w" -o -z "$h"
        echo "Error: Could not parse PDF dimensions (w=$w, h=$h)"
        return 1
    end

    set neww (awk -v w=$w -v e=$extra 'BEGIN{print w+e}')

    # Create backup of original file only after validation
    mv $infile $bakfile
    set temp_infile $bakfile

    # Use temporary file to avoid input/output clash
    set tempfile "$outfile.tmp"

    # Apply new mediabox and cropbox
    if not cpdf -mediabox "0 0 $neww $h" $temp_infile -o $tempfile
        # Restore original file on error
        mv $bakfile $infile
        echo "Error: Failed to apply mediabox"
        return 1
    end

    if not cpdf -cropbox "0 0 $neww $h" $tempfile -o $outfile
        # Restore original file on error and clean up temp
        mv $bakfile $infile
        rm -f $tempfile
        echo "Error: Failed to apply cropbox"
        return 1
    end

    # Clean up temporary file
    rm -f $tempfile
end

alias epw=expand_pdf_width
