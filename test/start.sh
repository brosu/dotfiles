#!/bin/sh
chezmoi data && chezmoi apply
exec "$@"