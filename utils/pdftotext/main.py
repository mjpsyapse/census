import pdftotext
import sys


filename = sys.argv[1]
print(f"reading {filename}")

# Load your PDF
with open(filename, "rb") as f:
    pdf = pdftotext.PDF(f)

# Iterate over all the pages
for page in pdf:
    print(page)

