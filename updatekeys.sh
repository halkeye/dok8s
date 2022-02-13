#!/bin/bash
find -name '*secrets*.yaml' -exec sops updatekeys -y {} \;
