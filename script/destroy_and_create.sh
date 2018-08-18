#!/bin/bash
CD=$(dirname $0)
sh $CD/destroy.sh
sh $CD/create.sh
