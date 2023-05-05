-- ====================================================
-- ROS 2 related commands
-- ====================================================
-- Build
vim.api.nvim_command([[
  command! ColconBuild :! CC=clang CXX=clang++ colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
]])
vim.api.nvim_command([[
  command! -nargs=1 ColconBuildSingle :! CC=clang CXX=clang++ colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON --packages-up-to <args>
]])
vim.api.nvim_command([[
  command! ColconBuildDebug :! CC=clang CXX=clang++ colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Debug
]])
vim.api.nvim_command([[
  command! -nargs=1 ColconBuildDebugSingle :! CC=clang CXX=clang++ colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Debug --packages-up-to <args>
]])

-- Test
vim.api.nvim_command([[
  command! ColconTest :! colcon test
]])
vim.api.nvim_command([[
  command! -nargs=1 ColconTestSingle :! colcon test --packages-select <args>
]])
vim.api.nvim_command([[
  command! ColconTestResult :! colcon test-result --all
]])
