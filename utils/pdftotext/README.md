# pdftotext

Convert pdf to text

## Usage

First you have to build the docker image, then you can use the command.

`> ./build`
`> ./pdftotext filename.pdf`

Note that the `pdftotext` mounts the specified file to the docker image, so you have to mount it from a child of the current working dir.  The following will not work:

`> ./pdftotext ../../will-fail.pdf`
