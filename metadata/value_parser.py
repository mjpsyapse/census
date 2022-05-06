

import re
import collections


COLUMN_PATTERN = re.compile(r'(\d+)\s*\-?\s*(\d+)$')
SPLIT = re.compile(f"\s+")
COLUMN_TOKENS = re.compile(r"^(\w+)\s+\d+\s+(.+?)\s+\d+\s*\-?\s*\d+$")
VALUE_PATTERN = re.compile(r'(\-?\d+)\s*(.*)')

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


def is_valid_entries(line):
    return line == 'VALID ENTRIES'


def extract_value(line):
    match = VALUE_PATTERN.search(line)
    key, val = None, None
    if match:
        key, val = match.groups()
    return key, val


def read_stuff():
    with open('2020_Basic_CPS_Public_Use_Record_Layout_plus_IO_Code_list.txt', 'rb') as legend:
        for line in legend.readlines():
            line = line.replace(b'\xc2\x96', b'') # weird cleaning...
            line = line.replace(b'\xc2\x92', b'')
            line = line.replace(b'\xc2\x85', b'')
            line = line.decode('utf8').strip()
            yield line


def parse_stuff():
    legend = collections.defaultdict(dict)
    name = None
    desc = None
    started = False
    offset = 0
    continue_column_desc = False
    valid_entries = 0
    for line in read_stuff():
        # Skip lines with nothing in them
        if not len(line):
            continue_column_desc = False # finish getting description of column
            valid_entries = 2 if valid_entries == 1 else 0
            continue

        # First wait for the row that starts w/ name.
        if not started:
            if line.startswith('NAME'):
                started = True
            continue

        # Look for columns
        is_column, offset = check_column(line, offset)
        if continue_column_desc and not is_column:
            legend[name]['desc'] += f" {line}"
        if is_column:
            continue_column_desc = True
            valid_entries = 0
            name, desc = COLUMN_TOKENS.search(line).groups()
            legend[name] = collections.defaultdict(dict)
            legend[name]['desc'] = desc
        valid_entries = 1 if is_valid_entries(line) else valid_entries
        if valid_entries == 2:
            key, val = extract_value(line)
            if key:
                legend[name]['values'][key] = val
    return legend

def main():
    print("Column,Key,Value")
    for name, data in parse_stuff().items():
        for key, val in data['values'].items():
            print(f'"{name}","{key}","{val}"')

    


if __name__ == "__main__":
    main()
