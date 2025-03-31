//ignition/modules/Deployment.ts
//SPDX-License-Identifier: MIT


import { buildModule } from '@nomicfoundation/hardhat-ignition/modules';

const DeploymentModule = buildModule('DeploymentModule', (m) => {
  const RemittanceToken = m.contract('RemittanceToken');

  return { RemittanceToken };
});

export default DeploymentModule;