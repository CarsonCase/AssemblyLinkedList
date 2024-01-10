//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract LinkedList{

    uint128 public headSlot;

    // 53,227
    function push(uint128 val) external returns(bytes32 newNodeData){
        assembly{
            // read the value of the slot storing the Head node
            let wholeSlot := sload(headSlot.slot)


            // i = index of new node (1 slot after last head)
            let i := add(wholeSlot,1)

            newNodeData := or(shl(128,val),wholeSlot)

            // store new node at new index location
            sstore(i,newNodeData)

            // update head location
            sstore(headSlot.slot, i)
        }
    }

    // 51,261
    function insert(uint128 index, uint128 val) external{
        assembly{
            let slotData := sload(index)
            let v := shr(128,slotData)
            let n := and(0x00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF,slotData)

            // do not allow insertions at index 1, out of bounds, OR head (should push)
            if or(iszero(n),eq(index,sload(headSlot.slot))){
                revert(slotData,0x20)
            }
            
            // generate storage location for new node
            // new location on the right (128 rightmost bits)
            let newLocation := and(0x00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF,keccak256(index,0x20))
            // current node at index must point to our new node
            // note we need to shift the value back left, and insert in the new location
            sstore(index, or(shl(128,v),newLocation))

            // create new node and point to the old one
            sstore(newLocation, or(shl(128,val),n))
        }
    }

    function traverseMultiply() external returns(uint128 i){
        assembly{

            function multiply(x) -> multiple{
                multiple := mul(x,2)
            }
            
            for { i := sload(headSlot.slot) } i { } {
                // load the next value at i
                let slotData := sload(i)
                let v := shr(128,slotData)
                let n := and(0x00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF,slotData)

                // do something with the values
                v := multiply(i)
                sstore(i, or(shl(128,v),n))
                
                // move i forward
                i := n
            }
        }
    }
    
    function readNode(uint128 slot) external view returns(uint128 val, uint128 next){
        assembly{
            let wholeSlot := sload(slot)
            val := shr(128,wholeSlot)
            next := wholeSlot
        }
    }

    function multiply2(uint128 val) public pure returns(uint){
        return val * 2;
    }

}