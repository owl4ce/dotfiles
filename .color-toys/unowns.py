#!/usr/bin/env python
# -*- coding: UTF-8 -*-
__author__ = 'actionless'

import random

unowns = [[
    '   ▀█▀▀▀█▀   ',
    '    ▄▀▀▀▄    ',
    '   ▀▄ ▀ ▄▀   ',
    '     ▀█▀     ',
    '    ▄█▄▄▄▄   ',
    ], [
    ' █▄        █ ',
    ' █ ▀▄▀▀▀▄  █ ',
    ' █ ▀▄ ▀ ▄▀ █ ',
    ' █   ▀▀▀ ▀▄█ ',
    ' ▀         ▀ ',
    ], [
    '   ▀▀▀█▀▀▀   ',
    '    ▄▀▀▀▄    ',
    '   ▀▄ ▀ ▄▀   ',
    '     ▀▀▀     ',
    '             ',
    ], [
    ' ▀▄       ▄▀ ',
    '   ▀▄▀▀▀▄▀   ',
    '   ▀▄ ▀ ▄▀   ',
    '  ▄▀ ▀▀▀ ▀▄  ',
    ' ▀         ▀ ',
    ], [
    '      █▀▀▄   ',
    '    ▄▀▀▀▄ ▀▄ ',
    '   ▀▄ ▀ ▄▀ █ ',
    '     ▀▀▀ ▄▀  ',
    '      ▀▀▀    ',
    ], [
    '    ▀▄ ▄▀    ',
    '    ▄▀▀▀▄    ',
    '   ▀▄ ▀ ▄▀   ',
    '     ▀█▀     ',
    '     ▄▀▄     ',
]]

for mode in ['normal', 'bold']:
    random.shuffle(unowns)
    if mode == 'bold':
        print("\033[1m")

    print(
        '\n'.join([
            ''.join([
                "\033[03{n}m{string}".format(
                    n=color_number + 1,
                    string=unowns[color_number][line_number]
                )
                for color_number in range(6)])
            for line_number in range(5)])
    )

# reset font:
print("\033[0m")
