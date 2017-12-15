#!/bin/sh

  for fil in Mn*; do
    mv $fil `echo $fil|sed 's/Mn/Mn/'`
  done

