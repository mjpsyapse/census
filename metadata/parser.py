

import re


COLUMN_PATTERN = re.compile(r'(\d+)\s*\-?\s*(\d+)$')
SPLIT = re.compile("\s+")
COLUMN_TOKENS = re.compile(r"^(\w+)\s+\d+\s+(.+?)\s+\d+\s*\-?\s*\d+$")


def check_column(line, offset):
    match = COLUMN_PATTERN.search(line)
    original = offset
    # skip FILLER columns
    if line.startswith('FILLER'):
        _from, _to = [int(el) for el in match.groups()]
        match = False
        offset = _to
    elif line.startswith('EDITED UNIVERSE'):
        match = False

    # is_column, new_offset
    if match:
        _from, _to = [int(el) for el in match.groups()]
        if offset + 1 == _from:
            offset = _to
            match = COLUMN_TOKENS.search(line)
        else:
            match = False

    return bool(match), offset


def read_stuff():
    with open('2020_Basic_CPS_Public_Use_Record_Layout_plus_IO_Code_list.txt', 'rb') as legend:
        for line in legend.readlines():
            line = line.replace(b'\xc2\x96', b'') # weird cleaning...
            line = line.decode('utf8').strip()
            yield line


def parse_stuff():
    legend = {}
    name = None
    desc = None
    started = False
    offset = 0
    continue_column_desc = False
    for line in read_stuff():
        # Skip lines with nothing in them
        if not len(line):
            continue_column_desc = False # finish getting description of column
            continue

        # First wait for the row that starts w/ name.
        if not started:
            if line.startswith('NAME'):
                started = True
            continue

        # Look for columns
        is_column, offset = check_column(line, offset)
        if continue_column_desc and not is_column:
            legend[name] += f" {line}"
        if is_column:
            continue_column_desc = True
            name, desc = COLUMN_TOKENS.search(line).groups()
            legend[name] = desc
    return legend

def main():
    print("Name,Description")
    for name, desc in parse_stuff().items():
        print(f'"{name}","{desc}"')


if __name__ == "__main__":
    main()
