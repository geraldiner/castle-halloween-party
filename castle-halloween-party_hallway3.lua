return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.2.5",
  orientation = "orthogonal",
  renderorder = "left-up",
  width = 16,
  height = 15,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 17,
  nextobjectid = 32,
  properties = {},
  tilesets = {
    {
      name = "castle-halloween-party_spritesheet",
      firstgid = 1,
      filename = "assets/sprites/castle-halloween-party_spritesheet.tsx",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 10,
      image = "assets/sprites/castle-halloween-party_spritesheet.png",
      imagewidth = 160,
      imageheight = 160,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      terrains = {},
      tilecount = 100,
      tiles = {
        {
          id = 0,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 1,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 2,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 3,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 4,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 5,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 6,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 7,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 10,
          properties = {
            ["collideable"] = false
          }
        },
        {
          id = 11,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 12,
          properties = {
            ["collideable"] = false
          }
        },
        {
          id = 13,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 14,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 15,
          properties = {
            ["collideable"] = false
          },
          objectGroup = {
            type = "objectgroup",
            name = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            draworder = "index",
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "rectangle",
                x = 0,
                y = -0.0909091,
                width = 16,
                height = 16,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 16,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 20,
          properties = {
            ["collideable"] = false
          }
        },
        {
          id = 21,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 22,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 23,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 24,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 25,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 26,
          properties = {
            ["collidable"] = true
          }
        }
      }
    }
  },
  layers = {
    {
      type = "objectgroup",
      id = 7,
      name = "Doors",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 14,
          name = "South",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 224,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["destination"] = "hallway1"
          }
        },
        {
          id = 15,
          name = "West",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 128,
          width = 8,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["destination"] = "bedroom2"
          }
        },
        {
          id = 17,
          name = "North",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 0,
          width = 32,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {
            ["destination"] = "backyard"
          }
        }
      }
    },
    {
      type = "objectgroup",
      id = 14,
      name = "InnerWalls",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 19,
          name = "WDoorway",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 96,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "LeftBackWall",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 32,
          width = 80,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "RightBackWall",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 32,
          width = 80,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      id = 15,
      name = "OuterWalls",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 23,
          name = "Wall1",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "Wall2",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 0,
          width = 80,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "Wall3",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 0,
          width = 80,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 31,
          name = "Wall4",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 0,
          width = 32,
          height = 240,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 28,
          name = "Wall5",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 224,
          width = 80,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "Wall6",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 224,
          width = 80,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "Wall7",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 160,
          width = 32,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "tilelayer",
      id = 10,
      name = "Floor",
      x = 0,
      y = 0,
      width = 16,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 46, 46, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 46, 46, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 46, 46, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 46, 46, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 35, 36, 36, 36, 9, 46, 46, 10, 36, 36, 36, 37, 0, 0,
        0, 0, 45, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 47, 0, 0,
        0, 0, 45, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 47, 0, 0,
        0, 0, 19, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 47, 0, 0,
        46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 47, 0, 0,
        0, 0, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 47, 0, 0,
        0, 0, 29, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 47, 0, 0,
        0, 0, 45, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 47, 0, 0,
        0, 0, 45, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 47, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 46, 46, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 46, 46, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      id = 11,
      name = "OuterWalls",
      x = 0,
      y = 0,
      width = 16,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        1, 1, 1, 1, 1, 1, 17, 0, 0, 15, 1, 1, 1, 1, 1, 1,
        1, 2, 3, 3, 3, 3, 27, 0, 0, 25, 3, 3, 3, 3, 4, 1,
        1, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 1,
        1, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 1,
        1, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 1,
        26, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 1,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 1,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 1,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 1,
        6, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 1,
        1, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 1,
        1, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 1,
        1, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 1,
        1, 22, 23, 23, 23, 23, 7, 0, 0, 5, 6, 6, 6, 6, 24, 1,
        1, 1, 1, 1, 1, 1, 17, 0, 0, 15, 1, 1, 1, 1, 1, 1
      }
    },
    {
      type = "objectgroup",
      id = 16,
      name = "Player",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {}
    },
    {
      type = "tilelayer",
      id = 12,
      name = "InnerWalls",
      x = 0,
      y = 0,
      width = 16,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        11, 16, 8, 8, 8, 8, 8, 0, 0, 8, 8, 8, 8, 8, 0, 0,
        0, 0, 18, 18, 18, 18, 18, 0, 0, 18, 18, 18, 18, 18, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 0,
        8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 0,
        18, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 0,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 0,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 0,
        21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      id = 13,
      name = "Furniture",
      x = 0,
      y = 0,
      width = 16,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
