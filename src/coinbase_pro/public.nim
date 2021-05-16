import base
export base

import jhooks
export jhooks

import structs
export structs

import asyncdispatch
import httpclient
import logging
import std/[json,jsonutils]
import strutils

const JPARSEOPTIONS = Joptions(allowExtraKeys: true, allowMissingKeys: true)

using
  self: Coinbase

proc getData*[T](self; args: seq[string]): Future[T] {.async.} =
  let pStr = args.join("/")
  let res = await self.http.getContent(self.url & "/" & pStr)
  let json = parseJson(res)

  debug json.pretty()
  fromJson(result, json, JPARSEOPTIONS)

proc getBook*(self; product: string, bookLevel: typedesc[L1 | L2 | L3]): Future[Book[bookLevel]] {.async.} =
  return await self.getData[:Book[bookLevel]](@["products", product, "book?level=" & $level(bookLevel)])
