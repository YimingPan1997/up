echo "[GTEST_BEGIN]" 
echo "[GTEST_JSON_BEGIN]" 
 
gsql -g GSQL_Algo_Test 'run query tg_eigenvector_cent(["BETWEENNESS_CENT_C11"],["BETWEENNESS_CENT_C11_HAS_EDGE"],20,0.001,26,TRUE,"","")' 
 
echo "[GTEST_JSON_END]"
echo "[GTEST_END]"