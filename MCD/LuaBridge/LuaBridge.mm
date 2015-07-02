//
//  LuaBridge.m
//  TestLua
//
//  Created by fengxiao on 15/6/30.
//  Copyright (c) 2015年 hick. All rights reserved.
//

#import <Foundation/Foundation.h>

extern "C"
{
#include "lauxlib.h"
#include "lualib.h"
#include "lua.h"
#include "LuaBridge.h"
    
    static lua_State *glua_state;
    
    void initLua(lua_State *L)
    {
        luaopen_base(L);
        luaopen_table(L);
        luaL_openlibs(L);
        luaopen_string(L);
        luaopen_math(L);
    }
    
    void initLuaPath(lua_State *L)
    {
        lua_getglobal(L, "package");
        lua_getfield(L, -1, "path");
        const char* cur_path = lua_tostring(L, -1);
        lua_pushfstring(L, "%s;%s/?.lua",cur_path,[[[NSBundle mainBundle] resourcePath] UTF8String]);
        lua_setfield(L, -3, "path");
        lua_pop(L, 2);
    }
    
    
    void initLuaEngine()
    {
        glua_state = luaL_newstate();
        initLua(glua_state);
        initLuaPath(glua_state);
        NSString *file = [NSString stringWithFormat:@"%@/%s",[[NSBundle mainBundle] resourcePath],"main.lua" ];
        int ret = luaL_loadfile(glua_state,[file UTF8String]);
        if(ret != 0)
        {
            NSLog(@"error %d",ret);
            return;
        }
        lua_pcall(glua_state, 0, 0, 0);
        
    }
    
    void closeLuaEngine()
    {
        lua_close(glua_state);
    }
};