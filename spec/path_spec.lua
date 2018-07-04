require 'spec.spec_helper'

describe("Path library functions:", function()
  local path = require 'utilities.path'

  describe(".parts", function()
    it("should return directory and file when both are provided", function()
      local dir, file = path.parts('/Users/user/code/hammerspoon-config/init.lua')
      assert.are.equal('/Users/user/code/hammerspoon-config', dir)
      assert.are.equal('init.lua', file)
    end)
    it("should return directory and empty string when no file provided (trailing slash)", function()
      local dir, file = path.parts('/Users/user/code/hammerspoon-config/')
      assert.are.equal('/Users/user/code/hammerspoon-config', dir)
      assert.are.equal('', file)
    end)
    it("should, sometimes confusingly, return directory and file when file has no extension", function()
      local dir, file = path.parts('/Users/user/code/hammerspoon-config')
      assert.are.equal('/Users/user/code', dir)
      assert.are.equal('hammerspoon-config', file)
    end)
  end)

  describe(".basename", function()
    it("should return file", function()
      assert.are.equal('init.lua', path.basename('/Users/user/code/hammerspoon-config/init.lua'))
    end)
    it("should return file without supplied suffix", function()
      assert.are.equal('init', path.basename('/Users/user/code/hammerspoon-config/init.lua', '.lua'))
    end)
    it("should return file if supplied suffix doesn't match", function()
      assert.are.equal('init.lua', path.basename('/Users/user/code/hammerspoon-config/init.lua', '.txt'))
    end)
  end)

  describe(".dirname", function()
    it("should return directory", function()
      assert.are.equal('/Users/user/code/hammerspoon-config', path.dirname('/Users/user/code/hammerspoon-config/init.lua'))
    end)
  end)

  describe(".extension", function()
    it("should return extension", function()
      assert.are.equal('.lua', path.extension('/Users/user/code/hammerspoon-config/init.lua'))
    end)
  end)
end)
