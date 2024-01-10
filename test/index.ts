import { expect } from "chai";
import { ethers } from "hardhat";
import {BigNumber} from "ethers";
import { LinkedList } from "../typechain";
import { assert } from "console";

const logGasUsage = (currentGasUsage: BigNumber) => {
  console.log(`           Current gas use:   ${currentGasUsage}`);
};

describe("LinkedList", function () {
  let ll: LinkedList;
  before(async()=>{
    const LinkedList = await ethers.getContractFactory("LinkedList");
    ll = await LinkedList.deploy();
    await ll.deployed();
  })

  it("Linked List behaves as expected", async function () {

    for(let i = 0; i < 500; i++){
      await ll.push(i);
    }

    await ll.traverseMultiply();

    // await ll.testInsert(3,15);


    // await ll.testInsert(3, 15);

    // await ll.testMultiply();


    // logGasUsage(gasInsert);

    // const val0 = await ll.read(0);
    // const val1 = await ll.read(1);

    // const val2 = await ll.read(2);

    // expect(val0.toString()).eq("24");
    // expect(val1.toString()).eq("26");
    // // expect(val2.toString()).eq("30");
    // expect(val2.toString()).eq("28");
  });
});
