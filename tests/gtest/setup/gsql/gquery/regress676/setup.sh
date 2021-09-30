#!/bin/bash

cwd=$(cd `dirname $0` && pwd)
# get gtest folder
gtest_dir=$cwd/../../../..

# start gsql server
gadmin start gsql

# create graph schema
cd $gtest_dir/test_case/gsql/gquery/regress676
gdev_path="$(gadmin config get System.AppRoot)/dev"
gsql 'PUT ExprFunctions FROM "../../../../resources/common/ExprFunctions_gsql_regress676.hpp"'
gsql regress676_schema.gsql

# install query
all_queries=$(ls -a)
for query in ${all_queries}; do
  if [[ "$query" =~ query.gsql$ ]]; then
    echo "Define query: $query"
    gsql -g GSQL_Algo_Test $query
  else
    echo "Ignore file: $query"
  fi
done

gsql -g GSQL_Algo_Test 'INSTALL QUERY ALL'