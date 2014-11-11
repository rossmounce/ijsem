#!/bin/bash
# Usage: attempt to make a plaintext conversion copy of all PDFs in all subfolders (maxdepth 1 folder down) of the working directory

# Turning on the nullglob shell option
shopt -s nullglob

# Loop through pwd cd'ing into each directory then pdftotext all PDFs within each subdirectory

cat largestfirst.out | while read -r line; 
	do 
	#echo "doing file $line"
	STEM=$(echo $line | cut -d'.' --complement -f4-)
	cat $line | while read -r sline;
			do
			#'http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&id=$sline&rettype=gb&retmode=xml'
			#cmdtwo="http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&id=$(sline)&rettype=gb&retmode=xml"
			#echo $cmdtwo
			#THIS KINDA WORKS EXCEPT OUTPUT cmdone="wget 'http:\/\/eutils.ncbi.nlm.nih.gov\/entrez\/eutils\/efetch.fcgi\?db=nucleotide&id=$sline&rettype=gb&retmode=xml' > ../output/$STEM/$sline.xml"
			cmdone="wget http:\/\/eutils.ncbi.nlm.nih.gov\/entrez\/eutils\/efetch.fcgi\?db=nucleotide&id=$sline&rettype=gb&retmode=xml' > ../output/$STEM/$sline.xml"
			resa="${cmdone/\\/$CAT}"
			resb="${resa/\\/$CAT}"
			resc="${resb/\\/$CAT}"
			resd="${resc/\\/$CAT}"
			rese="${resd/\\/$CAT}"
			#resf="${rese/\\/$CAT}"
			#alternatively resa="${cmdone//\/$CAT}" to remove all
			#allof="${cmdone//\/$CAT}"
			echo $rese
			#eval "$allof"
			#sleep 4
			done
	done
