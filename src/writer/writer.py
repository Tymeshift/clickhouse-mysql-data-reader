#!/usr/bin/env python
# -*- coding: utf-8 -*-


class Writer(object):

    def opened(self):
        pass

    def open(self):
        pass

    def insert(self, schema=None, table=None, values=None):
        pass

    def close(self):
        pass