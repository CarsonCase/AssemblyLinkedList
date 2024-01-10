// //SPDX-License-Identifier: MIT
// pragma solidity ^0.8.0;

// contract Test{

//     uint128 headSlot;

//     // 72,639
//     function testInsert(uint128 index, uint128 value) external {
//         headSlot.insert(index, value);
//     }

//     function push(uint128 val) external{
//         headSlot.push(val);
//     }
    
//     function readStorage(uint128 slot) external view returns(uint a){
//         return LinkedList.readStorage(slot);
//     }


//     // function testRemove(uint index) external {
//     //     linkedList.remove(index);
//     // }

//     // // 63,088
//     // function testMultiply() external {
//     //     linkedList.traverse(0x4896eb59);
//     // }

//     // function read(uint i) external view returns(uint){
//     //     return linkedList.getValueAt(i);
//     // }

//     function multiply2(uint val) public pure returns(uint){
//         return val * 2;
//     }
// }