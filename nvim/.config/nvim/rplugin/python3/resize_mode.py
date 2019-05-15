import pynvim


@pynvim.plugin
class ResizeMode(object):
    def __init__(self, nvim):
        self.nvim = nvim
        self.resize_active = False

    def remap(self, mapping):
        for k, v in mapping.items():
            self.nvim.command(f'nnoremap {k} {v}')

    def unmap(self, mapping):
        for k in mapping:
            self.nvim.command(f'nnoremap {k} {k}')

    @pynvim.command('ToggleResizeMode', nargs='*', range='')
    def toggleResizeMode(self, args, range):
        self.resize_active = not self.resize_active

        end = ':ToggleResizeMode<CR>'

        vs = ':vs<CR>'
        sv = ':sv<CR>'

        down = '<C-w>j'
        right = '<C-w>l'

        mappings = {
            'h': ':vertical resize -5<CR>',
            'j': ':resize +5<CR>',
            'k': ':resize -5<CR>',
            'l': ':vertical resize +5<CR>',
            's': f'{vs}{end}',
            'S': f'{sv}{end}',
            'c': f'{vs}{right}:term<CR>{end}A',
            'C': f'{sv}{down}:term<CR>{end}A',
            't': f':tabe<CR>{end}',
            'q': end,
        }

        if self.resize_active:
            self.remap(mappings)
        else:
            self.unmap(mappings)
