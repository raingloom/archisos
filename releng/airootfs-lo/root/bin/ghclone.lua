#!/bin/env lua
--ssh  :git@github.com:trillek
--https:https://github.com/trillek-team/tec.git
local url = ...--TODO: proper parameter parsing
local protocol, repository = url:match'^(.+)github.com[:/](.+)$'
local reponame = repository:match'/(.+)%.git$'
protocol = protocol:match'^https' and 'https' or 'ssh'
local url_ssh = protocol=='ssh' and url or 'git@github.com:'..repository
local url_https = protocol=='https' and url or 'https://github.com/'..repository
os.execute( 'git clone '..url_https )
os.execute( 'cd '..reponame..' && git remote set-url origin --push '..url_ssh )
