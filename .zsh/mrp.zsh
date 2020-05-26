# Front-end
alias mrps='pushd client_nogulp/apps/mrp;npm start;popd'
alias mrpbw='pushd client_nogulp/apps/mrp;npm run build:watch;popd'
alias mrptw='pushd client_nogulp/apps/mrp;npm run test:watch;popd'
alias mrpt='pushd client_nogulp/apps/mrp;npm run test;popd'

# Back-end
alias mrpu='pushd components/mrp;be rspec spec/unit;popd'
alias mrpi='pushd components/mrp;be rspec spec/integration;popd'
alias mrpa='mrpu;mrpi;'
