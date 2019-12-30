file_exists = (filename) ->
    file = io.open(filename, "r")
    if (file)
        file\close!
        return true
    return false

create_file = (filetype, filename) ->
    handle = assert(io.open(filename .. '.' .. filetype, "wb"))
    data = "\x41\x41\x41"
    handle\write data
    assert(handle\close!)
    return true



describe 'File Generator', ->
    it 'can generate txt files', ->
        assert.truthy create_file("pdf", "spec_test"), "Create file function call"
        assert.truthy file_exists("spec_test.pdf"), "File does not exist"

